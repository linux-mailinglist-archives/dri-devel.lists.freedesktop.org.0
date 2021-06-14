Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9223A6CAA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 19:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028206E053;
	Mon, 14 Jun 2021 17:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6776E04A;
 Mon, 14 Jun 2021 17:04:30 +0000 (UTC)
IronPort-SDR: RqwjaB/4bVku6eObzk3M55S3BTyTzTZhTbZsU69cmdXvy/+q5wmYrCzv88P4Qizij8wX2XC9UC
 kF8ABZ48vTCQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="291478236"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="291478236"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 10:04:29 -0700
IronPort-SDR: IkFlGlKLx5LGW+aCIzHPR8c9pXA8xoVBWfHN7eZyHFEViQMGf+S+s42Z6aDaEip9mQ0XGiOMGu
 w+txkH4Nrffw==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="451656420"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.254.188.63])
 ([10.254.188.63])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 10:04:29 -0700
Subject: Re: [PATCH 01/13] drm/i915/guc: Introduce unified HXG messages
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210610043649.144416-1-matthew.brost@intel.com>
 <20210610043649.144416-2-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <8c17827d-69e6-99b6-d063-1f6fcd16aa9a@intel.com>
Date: Mon, 14 Jun 2021 10:04:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210610043649.144416-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: john.c.harrison@intel.com, Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/9/2021 9:36 PM, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> New GuC firmware will unify format of MMIO and CTB H2G messages.
> Introduce their definitions now to allow gradual transition of
> our code to match new changes.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 ++++++++++++++++++
>   1 file changed, 213 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> index 775e21f3058c..29ac823acd4c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> @@ -6,6 +6,219 @@
>   #ifndef _ABI_GUC_MESSAGES_ABI_H
>   #define _ABI_GUC_MESSAGES_ABI_H
>   
> +/**
> + * DOC: HXG Message
> + *
> + * All messages exchanged with GuC are defined using 32 bit dwords.
> + * First dword is treated as a message header. Remaining dwords are optional.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  |   |       |                                                              |
> + *  | 0 |    31 | **ORIGIN** - originator of the message                       |
> + *  |   |       |   - _`GUC_HXG_ORIGIN_HOST` = 0                               |
> + *  |   |       |   - _`GUC_HXG_ORIGIN_GUC` = 1                                |
> + *  |   |       |                                                              |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | **TYPE** - message type                                      |
> + *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
> + *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
> + *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
> + *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
> + *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
> + *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_SUCCESS` = 7                     |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | **AUX** - auxiliary data (depends on TYPE)                   |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 |                                                              |
> + *  +---+-------+                                                              |
> + *  |...|       | **PAYLOAD** - optional payload (depends on TYPE)             |
> + *  +---+-------+                                                              |
> + *  | n |  31:0 |                                                              |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_HXG_MSG_MIN_LEN			1u
> +#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
> +#define   GUC_HXG_ORIGIN_HOST			0u
> +#define   GUC_HXG_ORIGIN_GUC			1u
> +#define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> +#define   GUC_HXG_TYPE_REQUEST			0u
> +#define   GUC_HXG_TYPE_EVENT			1u
> +#define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
> +#define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
> +#define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> +#define   GUC_HXG_TYPE_RESPONSE_SUCCESS		7u
> +#define GUC_HXG_MSG_0_AUX			(0xfffffff << 0)
> +#define GUC_HXG_MSG_n_PAYLOAD			(0xffffffff << 0)
> +
> +/**
> + * DOC: HXG Request
> + *
> + * The `HXG Request`_ message should be used to initiate synchronous activity
> + * for which confirmation or return data is expected.
> + *
> + * The recipient of this message shall use `HXG Response`_, `HXG Failure`_
> + * or `HXG Retry`_ message as a definite reply, and may use `HXG Busy`_
> + * message as a intermediate reply.
> + *
> + * Format of @DATA0 and all @DATAn fields depends on the @ACTION code.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN                                                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | **DATA0** - request data (depends on ACTION)                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | **ACTION** - requested action code                           |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 |                                                              |
> + *  +---+-------+                                                              |
> + *  |...|       | **DATAn** - optional data (depends on ACTION)                |
> + *  +---+-------+                                                              |
> + *  | n |  31:0 |                                                              |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_HXG_REQUEST_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> +#define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfff << 16)
> +#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
> +#define GUC_HXG_REQUEST_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
> +
> +/**
> + * DOC: HXG Event
> + *
> + * The `HXG Event`_ message should be used to initiate asynchronous activity
> + * that does not involves immediate confirmation nor data.
> + *
> + * Format of @DATA0 and all @DATAn fields depends on the @ACTION code.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN                                                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | **DATA0** - event data (depends on ACTION)                   |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | **ACTION** - event action code                               |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 |                                                              |
> + *  +---+-------+                                                              |
> + *  |...|       | **DATAn** - optional event  data (depends on ACTION)         |
> + *  +---+-------+                                                              |
> + *  | n |  31:0 |                                                              |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_HXG_EVENT_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> +#define GUC_HXG_EVENT_MSG_0_DATA0		(0xfff << 16)
> +#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffff << 0)
> +#define GUC_HXG_EVENT_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
> +
> +/**
> + * DOC: HXG Busy
> + *
> + * The `HXG Busy`_ message may be used to acknowledge reception of the `HXG Request`_
> + * message if the recipient expects that it processing will be longer than default
> + * timeout.
> + *
> + * The @COUNTER field may be used as a progress indicator.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN                                                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_NO_RESPONSE_BUSY_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | **COUNTER** - progress indicator                             |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_HXG_BUSY_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> +#define GUC_HXG_BUSY_MSG_0_COUNTER		GUC_HXG_MSG_0_AUX
> +
> +/**
> + * DOC: HXG Retry
> + *
> + * The `HXG Retry`_ message should be used by recipient to indicate that the
> + * `HXG Request`_ message was dropped and it should be resent again.
> + *
> + * The @REASON field may be used to provide additional information.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN                                                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_NO_RESPONSE_RETRY_                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | **REASON** - reason for retry                                |
> + *  |   |       |  - _`GUC_HXG_RETRY_REASON_UNSPECIFIED` = 0                   |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_HXG_RETRY_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> +#define GUC_HXG_RETRY_MSG_0_REASON		GUC_HXG_MSG_0_AUX
> +#define   GUC_HXG_RETRY_REASON_UNSPECIFIED	0u

I thought we had agreed to remove the entries that hadn't yet landed in 
the official specs, i.e. the reason here? Not a blocker given that the 
only defined cases matches the MBZ, but if you need to do another spin 
better to remove it for now.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +
> +/**
> + * DOC: HXG Failure
> + *
> + * The `HXG Failure`_ message shall be used as a reply to the `HXG Request`_
> + * message that could not be processed due to an error.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN                                                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_FAILURE_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | **HINT** - additional error hint                             |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | **ERROR** - error/result code                                |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_HXG_FAILURE_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> +#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfff << 16)
> +#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffff << 0)
> +
> +/**
> + * DOC: HXG Response
> + *
> + * The `HXG Response`_ message shall be used as a reply to the `HXG Request`_
> + * message that was successfully processed without an error.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN                                                       |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | **DATA0** - data (depends on ACTION from `HXG Request`_)     |
> + *  +---+-------+--------------------------------------------------------------+
> + *  | 1 |  31:0 |                                                              |
> + *  +---+-------+                                                              |
> + *  |...|       | **DATAn** - data (depends on ACTION from `HXG Request`_)     |
> + *  +---+-------+                                                              |
> + *  | n |  31:0 |                                                              |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +
> +#define GUC_HXG_RESPONSE_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> +#define GUC_HXG_RESPONSE_MSG_0_DATA0		GUC_HXG_MSG_0_AUX
> +#define GUC_HXG_RESPONSE_MSG_n_DATAn		GUC_HXG_MSG_n_PAYLOAD
> +
> +/* deprecated */
>   #define INTEL_GUC_MSG_TYPE_SHIFT	28
>   #define INTEL_GUC_MSG_TYPE_MASK		(0xF << INTEL_GUC_MSG_TYPE_SHIFT)
>   #define INTEL_GUC_MSG_DATA_SHIFT	16


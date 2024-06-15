Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9A9094EF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 02:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A511310E0F0;
	Sat, 15 Jun 2024 00:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="rM67PXqZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBD910E0F0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 00:05:51 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-6fd8506a0b2so2202142a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 17:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1718409951;
 x=1719014751; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c21Xnr26mF4XhO4v24lG8CYkDryUnaevoVevI7wRSgQ=;
 b=rM67PXqZK2Fdxymj1/lsieOImlxO5CcHaLJmidreiT5XXchqTQ3aAbBLqERjDCVhB2
 PAdhT8zml3xd882vIDcboM46FLogc4s+RS7ZD0JF4xEpMDzL+Br8lHb28h45YaMd109N
 KOLaDWPvPGttPDKzCzjKSFqLSfXt09XGju3DXR3SjcRcBkTwp4suYY5JA796AaGJGkyf
 MX/LC/nutUPAGZrsteUQhd7Gb4xQak+xAKVEl1cAaikCFqi2RnkWGwEnNNkrZnQ2JuyV
 lsRNAAMUFAMcUTNBXXTcHGL4gODIUcbn7yHxh8XGwE1vMDrEAJtSIDwEuweCBijtjWCM
 YnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718409951; x=1719014751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c21Xnr26mF4XhO4v24lG8CYkDryUnaevoVevI7wRSgQ=;
 b=fWv9x3KvY7rhAvd7YV50gtEBQEs5xQr70/RhW/xmbkXpG5alc8sYaxG+/amycDMGOR
 TP2NJ0i2VzkGET+lJEsDr8o7fTpL9PtFc37ZbHwWvt1D0EUq060NN72taWv2Tji9UCj0
 Zl7qu3JDaLfNwPgYl0wLvePmYSPtLccERqsdGX/Sgsvj7128KDNgWcfO94JhDu1ZgCH7
 dGA70slcJ0llMZvFblzIAPIqC68VPTlOf9z6m9tO62Qt4algclVHkS1iXQ6jB/43ZMcG
 mpVJPgLO/L4GPgGlqZVsF5nanUNnuROgLpStDCy4KADlIC1t8UMQRM9uXvl4PCo5nD+B
 0Qag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgOM54omUVVv5IyIpw9MFpnalmKFBTVwwNyQb2vLR6FwfqEonkhwNTh4gAkce1F3BTzZFRJ3C3j2G0knP5BQ7QQJOX+IGqebxxP23JQ850
X-Gm-Message-State: AOJu0Yw6breXrUQWrfyHsMi+Ppn7QI71G75IQq00g8hQdLMiGUcDLrVr
 nV66BgLfMT2XxksXzxhDYRATeM5cvXWgq/I0KQEOj0VenMZiFsP2ipHlqmHntLU=
X-Google-Smtp-Source: AGHT+IHET3q/ZWVI0gCLmEytjo+qe1Q0o8W6KZxsgsqtRPqlyJa6ges0MNDa6YBygs6HHNzj/wFOeQ==
X-Received: by 2002:a17:903:1250:b0:1f7:2050:9a76 with SMTP id
 d9443c01a7336-1f8625c0d68mr49770465ad.8.1718409950685; 
 Fri, 14 Jun 2024 17:05:50 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f17f92sm37976575ad.221.2024.06.14.17.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 17:05:50 -0700 (PDT)
Date: Fri, 14 Jun 2024 17:05:48 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Message-ID: <20240614170548.188ead0d@hermes.local>
In-Reply-To: <20240613082208.1439968-2-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-2-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> +#define HBL_AUX2NIC(aux_dev)	\
> +	({ \
> +		struct hbl_aux_dev *__aux_dev = (aux_dev); \
> +		((__aux_dev)->type == HBL_AUX_DEV_ETH) ? \
> +		container_of(__aux_dev, struct hbl_cn_device, en_aux_dev) : \
> +		container_of(__aux_dev, struct hbl_cn_device, ib_aux_dev); \
> +	})
> +
> +#define RAND_STAT_CNT(cnt) \
> +	do { \
> +		u32 __cnt = get_random_u32(); \
> +		(cnt) = __cnt; \
> +		dev_info(hdev->dev, "port %d, %s: %u\n", port, #cnt, __cnt); \
> +	} while (0)
> +
> +struct hbl_cn_stat hbl_cn_mac_fec_stats[] = {
> +	{"correctable_errors", 0x2, 0x3},
> +	{"uncorrectable_errors", 0x4, 0x5}
> +};
> +

These tables should be marked const?

> +struct hbl_cn_stat hbl_cn_mac_stats_rx[] = {
> +	{"Octets", 0x0},
> +	{"OctetsReceivedOK", 0x4},
> +	{"aAlignmentErrors", 0x8},
> +	{"aPAUSEMACCtrlFramesReceived", 0xC},
> +	{"aFrameTooLongErrors", 0x10},
> +	{"aInRangeLengthErrors", 0x14},
> +	{"aFramesReceivedOK", 0x18},
> +	{"aFrameCheckSequenceErrors", 0x1C},
> +	{"VLANReceivedOK", 0x20},
> +	{"ifInErrors", 0x24},
> +	{"ifInUcastPkts", 0x28},
> +	{"ifInMulticastPkts", 0x2C},
> +	{"ifInBroadcastPkts", 0x30},
> +	{"DropEvents", 0x34},
> +	{"Pkts", 0x38},
> +	{"UndersizePkts", 0x3C},
> +	{"Pkts64Octets", 0x40},
> +	{"Pkts65to127Octets", 0x44},
> +	{"Pkts128to255Octets", 0x48},
> +	{"Pkts256to511Octets", 0x4C},
> +	{"Pkts512to1023Octets", 0x50},
> +	{"Pkts1024to1518Octets", 0x54},
> +	{"Pkts1519toMaxOctets", 0x58},
> +	{"OversizePkts", 0x5C},
> +	{"Jabbers", 0x60},
> +	{"Fragments", 0x64},
> +	{"aCBFCPAUSERx0", 0x68},
> +	{"aCBFCPAUSERx1", 0x6C},
> +	{"aCBFCPAUSERx2", 0x70},
> +	{"aCBFCPAUSERx3", 0x74},
> +	{"aCBFCPAUSERx4", 0x78},
> +	{"aCBFCPAUSERx5", 0x7C},
> +	{"aCBFCPAUSERx6", 0x80},
> +	{"aCBFCPAUSERx7", 0x84},
> +	{"aMACControlFramesReceived", 0x88}
> +};
> +
> +struct hbl_cn_stat hbl_cn_mac_stats_tx[] = {
> +	{"Octets", 0x0},
> +	{"OctetsTransmittedOK", 0x4},
> +	{"aPAUSEMACCtrlFramesTransmitted", 0x8},
> +	{"aFramesTransmittedOK", 0xC},
> +	{"VLANTransmittedOK", 0x10},
> +	{"ifOutErrors", 0x14},
> +	{"ifOutUcastPkts", 0x18},
> +	{"ifOutMulticastPkts", 0x1C},
> +	{"ifOutBroadcastPkts", 0x20},
> +	{"Pkts64Octets", 0x24},
> +	{"Pkts65to127Octets", 0x28},
> +	{"Pkts128to255Octets", 0x2C},
> +	{"Pkts256to511Octets", 0x30},
> +	{"Pkts512to1023Octets", 0x34},
> +	{"Pkts1024to1518Octets", 0x38},
> +	{"Pkts1519toMaxOctets", 0x3C},
> +	{"aCBFCPAUSETx0", 0x40},
> +	{"aCBFCPAUSETx1", 0x44},
> +	{"aCBFCPAUSETx2", 0x48},
> +	{"aCBFCPAUSETx3", 0x4C},
> +	{"aCBFCPAUSETx4", 0x50},
> +	{"aCBFCPAUSETx5", 0x54},
> +	{"aCBFCPAUSETx6", 0x58},
> +	{"aCBFCPAUSETx7", 0x5C},
> +	{"aMACControlFramesTx", 0x60},
> +	{"Pkts", 0x64}
> +};
> +
> +static const char pcs_counters_str[][ETH_GSTRING_LEN] = {
> +	{"pcs_local_faults"},
> +	{"pcs_remote_faults"},
> +	{"pcs_remote_fault_reconfig"},
> +	{"pcs_link_restores"},
> +	{"pcs_link_toggles"},
> +};
> +
> +static size_t pcs_counters_str_len = ARRAY_SIZE(pcs_counters_str);
> +size_t hbl_cn_mac_fec_stats_len = ARRAY_SIZE(hbl_cn_mac_fec_stats);
> +size_t hbl_cn_mac_stats_rx_len = ARRAY_SIZE(hbl_cn_mac_stats_rx);
> +size_t hbl_cn_mac_stats_tx_len = ARRAY_SIZE(hbl_cn_mac_stats_tx);
> +
> +static void qps_stop(struct hbl_cn_device *hdev);
> +static void qp_destroy_work(struct work_struct *work);
> +static int __user_wq_arr_unset(struct hbl_cn_ctx *ctx, struct hbl_cn_port *cn_port, u32 type);
> +static void user_cq_destroy(struct kref *kref);
> +static void set_app_params_clear(struct hbl_cn_device *hdev);
> +static int hbl_cn_ib_cmd_ctrl(struct hbl_aux_dev *aux_dev, void *cn_ib_ctx, u32 op, void *input,
> +			      void *output);
> +static int hbl_cn_ib_query_mem_handle(struct hbl_aux_dev *ib_aux_dev, u64 mem_handle,
> +				      struct hbl_ib_mem_info *info);
> +
> +static void hbl_cn_reset_stats_counters_port(struct hbl_cn_device *hdev, u32 port);
> +static void hbl_cn_late_init(struct hbl_cn_device *hdev);
> +static void hbl_cn_late_fini(struct hbl_cn_device *hdev);
> +static int hbl_cn_sw_init(struct hbl_cn_device *hdev);
> +static void hbl_cn_sw_fini(struct hbl_cn_device *hdev);
> +static void hbl_cn_spmu_init(struct hbl_cn_port *cn_port, bool full);
> +static int hbl_cn_cmd_port_check(struct hbl_cn_device *hdev, u32 port, u32 flags);
> +static void hbl_cn_qps_stop(struct hbl_cn_port *cn_port);

Can you reorder code so forward declarations are not required?

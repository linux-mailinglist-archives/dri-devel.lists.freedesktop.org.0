Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D3185DD97
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D47F10E5A4;
	Wed, 21 Feb 2024 14:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qDCqwG+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59D4C10E5A4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5nErZPjMLhPsfWriYnC+8VOrGhOivrHRB3dejnUbVUUcZMO0eegXNagheTvQz/DLk/F3csZCBsOFhcy2zQmXC6lkcNX3dlqy0AlokCjy446Sfbbd33C25opjtZ9ZAN+PZQghPFO3wjQ1w3UjHuppBpaCiWvvfggVIwW9EPGiSHa8GZ7gPMlZXtJfI4JKSnx4y+dziX02kD3nkNA7aIE4Fx3s3Q8IZ4BrSw6ggw027IVoqtRIQSz1SN1jTWUhKYiYyv7H7kRFbfolfyjorRCwPtQa7iCkgc2cX3VFrnT+Vls3VvDTkMpG++az8I8JYLqQYc4WjuQ3fRlOELqfyYlqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qp4m0/NXhBEX0hBSrwFDybp96XQq5vbxf1cLNJBg494=;
 b=jJ6hLXyc5HN1Vvg+IVfTcGkSRIv+xg/vsyhraQz77D7a68uxBviBfpT7JJAztT2D5g4n7rVxMAXlU+kXUzQsuwuGl/v0oszzoYOfedCLR5rcRvIDi/po1WN9ZXj9e9CicT8gfvPX343hIX/OAgJVb0pFtfsfZKkbGoN/CqV/idFw7WomLBiQLCX0uHDF4SVwD4ryrNfONHVDq67u0t0XB1Lm1XEo562IC0spXbF4wsibQMaAfXHi2lMfERvgFlsNMLZbPFj5NVfmcAGpNKmh22vebWuxWnGJLMkDWozku8uUt0qFNXK+KD+x3186qeDXOGHF8B2ukPxvkjefvosI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp4m0/NXhBEX0hBSrwFDybp96XQq5vbxf1cLNJBg494=;
 b=qDCqwG+/PKm5aXeCrx5sD74pqQgKLkGKnTAibfqR0Hh/08cmhikmR4JIhbD4DkcFpFVUI7i5x9IhXaZNeNBtqjud7bVn9cMlPL+2SAlcgtEERn7FLvtZTiQ+4R7qAS/MsP5ajDZWE70jWX0dEM6WkSCLjouh81ynEvZ0Z9Qa1os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5856.namprd12.prod.outlook.com (2603:10b6:510:1d7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Wed, 21 Feb
 2024 14:07:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Wed, 21 Feb 2024
 14:07:26 +0000
Content-Type: multipart/mixed; boundary="------------IBPUWZb9aefdFjsLaXovRGi5"
Message-ID: <3c5b80a7-5bf9-4752-a596-438924fdec9c@amd.com>
Date: Wed, 21 Feb 2024 15:07:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Running ttm_device_test leads to list_add corruption. prev->next
 should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b.
 (prev=ffffa0b1a5c034f0) (kernel 6.7.5)
Content-Language: en-US
To: Erhard Furtner <erhard_f@mailbox.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <20240219230116.77b8ad68@yea> <ZdRtDOhQGQUm5X4d@archie.me>
 <20240220134556.61f6441c@yea> <ae1ffd81-5026-4d64-b055-4f60090962a5@amd.com>
 <20240220184323.2c8b4f0a@yea>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240220184323.2c8b4f0a@yea>
X-ClientProxiedBy: AS4P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5856:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e67dc22-b960-4c2f-24f1-08dc32e66eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KaZlcYK+NCeRjduwzUDzhKFnaE6Ypp4yXg4p7+VjYkhzHhpVvvKyJkPljaO28lmPNQ6C7+rFFBbTk8/+6zrLhpe4wInUvxQsvOQILZB19lXNmGrwU9lnPNbx/ijogerQC2TbtkAxQkkj5StHaA3ElAxuNSNQiuao/lmmqCbd8WOjvhskImbQp5k96q/zzw0Qo8ANrKwr8WrfqjjTi/MgsLIuGR/CAkT0A4s2gidbcqn0uDOZxZJRBDo7sVNZy0OIsV5clygN4tmU9JZS6t4VITXCMK8XhrJ5lweMltNRGXXLmJ2OYJ98ZgxJo0ew+yqSjGSIGd3Ck9qncpz0rBWUpNHfrrO5T7FZ7eyCcrljati3Cx6Mh9cclsT077ko5o/1V2xBFS2E2kCVkfnXEph9heBV80tWD+UUCoBkm/zXOpCU/k41hhT3jlMbpyyBZMlloKyFgdvfpzoExueFz8XowINDeh0etnyvSSRgPsyhnMIu9iaxWHb7/lBnn37Nh3Q9VuEVGN0WMRx7kvueUPQL9fce3pPDqoiv0jZUFmmbguM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFV2bC9pRDRhZjhmdVlLMVdJY3BJVm1KQU14NlNNS2xuQXlKcmVzSXNJWVJu?=
 =?utf-8?B?NXRrVy9FSXYrNUQ3eThKaWh2NFRPOXlXOGptbmNUWXo2ME96OUlyejR2c25L?=
 =?utf-8?B?cnBxbHFZa3duWkQzeTRHR2tvS1UzMEhNbHhMMlJvc1labm43Uk90WHZvM0dI?=
 =?utf-8?B?aVJxeVg3TDJ3UHlVS0ZyWklGREZkTzJmWUlFWEhBOUVMRmdnOW1ZRWwzZ1Zm?=
 =?utf-8?B?WlpDelFGZmFjbVBERmRFbTA1U3FyWnAyS05SOFAwLzhTUFRyVmg1WldLdnJp?=
 =?utf-8?B?VEVSMEFkVCt4dHQyK3c0WjVOaXRyb1p3ZXhrQUlCWUs2NGRQVkVONGlUUS9k?=
 =?utf-8?B?aU93UWFjY0dYVWloWmJPREtOUTVxWkdtTzArcmJodldkTFJtdmNOd0RXYkQ5?=
 =?utf-8?B?aVZaN1VnNXBMUXpkaEhDdVJuTzJRK0VQTjJJeHVIL09JY1FSM2tyQ3BabXhq?=
 =?utf-8?B?SkQvUEJiVjI4SFRjeHNkN21JUjZpc2dRN1BMaThwLytVdlgrbzNSYlN2WXZ4?=
 =?utf-8?B?MFNDTXI5VnZ0MXFDZUxqS0Q4UkZqd2VoRE1YYnNyVGI5U1h4UC9RRC9lM0Fk?=
 =?utf-8?B?MitmOGtTSDNpWGg5ejdLYnlwTElFMERDVkU0TUZoU2ttd1dhb2ZCSmNCemZY?=
 =?utf-8?B?NGFjRFA3NTdpbXVoNzJGcnh5Y2NDd1c0ZkdlTlRxckQzekk1M3hMSmNYV1d4?=
 =?utf-8?B?eHFtVkd6Vjl5L2xUVWFjMXdnOXFTaDZMN2RqUGlQZi9Vc2dNMnE2NjdNczhP?=
 =?utf-8?B?VnZWT0ZCSUdCYzhIRWxBQ1dwd1dtb3hnK3ZFZ3lMakdmTHlZY05tb0ZpbmlM?=
 =?utf-8?B?WWowbWFZWUgyOU9uWm1laUJNZWFXck9ZZ2JiMUVoSnVJSGEyN3BIWEljazc0?=
 =?utf-8?B?SDFPM29HeWQxVUlXekdTODlqcmFxVHNsQTd1OFFwUndrYURKSDEvTnR3d0xV?=
 =?utf-8?B?WGNURVE2OVU0aHpFSmVwSGRRVDFPeVUwY3FLR09haXA2RFQ1ZkdlSVFaaUFR?=
 =?utf-8?B?SkJRa1lTa3lubGlJbUZ6cXJUWWdmRHBWZUZZdUJmdDhBakhQM1ZRa0VGdnQ0?=
 =?utf-8?B?RXVpcDRHbnBDeWhydEYrWkJhVUtZWC9oNkliWFBhTWcyNDhWZVAwakRQcC9N?=
 =?utf-8?B?d0VkVGI3QXZrYlFISUxuMVpubm0zSGt1YWZDNXMxT2NmcHJFRXhVeXN0N2xU?=
 =?utf-8?B?d3hkOFNnWFRBVm54YU45QmdUQi9YbjJ5M01VZytmakZIeiswUUlIMDlZWGRR?=
 =?utf-8?B?U3VieEg0ZWZVTVNYcm5ZeUN4ekVVdUYrSFhuWDV3UFo5SkpTZmdqQUVBSUs1?=
 =?utf-8?B?cjdkWitlYUVKd3NTSUtZdlZ4VFJ5TzQrMGxOa2Nvc3Izei9ubVU4SmtoWXAr?=
 =?utf-8?B?VldYVVBnRlhUalJyZU5GU0FqZlkrQlpySFJwSThTVms4dUx3UlF2VVpZVFJx?=
 =?utf-8?B?NXZxbSt4Zm5kNWFQM2VJTEtLWGpqYzRWMnE2YnJLRmpET3A0UWU4ZUZNR0Zn?=
 =?utf-8?B?eTBIK29xQTMxMmxlazUxaCtGUERSUWZOUk05VHJLRHNpNDIxTnRMTEhoRDFO?=
 =?utf-8?B?bnhBbGN1VlEwNDJlL3l0U3Vxb242WlI0d3dlYzNyWDg2OXpVSFc3YXRKYnl4?=
 =?utf-8?B?cXM3Z29QcHExcWsvaFIwVXp6bTNaWWhwR0ljWlpnOTZnb3lhL2hLSzlOcG1E?=
 =?utf-8?B?dWRCNzBSRFg2cXY1UGFXWThRcEwzVmNZT1o0OHJxNzEvYWk1TjV3WkZ3eENp?=
 =?utf-8?B?amFFYUV6ZHJpL1l0ck5MUVE3SnZzeGxzclJzZ1ZQcEpMWWhaZWZjb2FxdERo?=
 =?utf-8?B?eUcxRWRGTk1mSDBwQm9sVUZTOTgrLzJVcVZFckZsOUVKdGZuZm8raGhRWWRm?=
 =?utf-8?B?bXJ4SkJzSEMrSDB6eXN6QkxFU0FOSVNRSFdpWWNiTWVpYjRSVUpWaFlLVVc0?=
 =?utf-8?B?M2F6d1VLVll3RndNZ2FMaFAya3NGNmJPQnNFWkc1YlZ6c1M5cnlHdmF1dzN5?=
 =?utf-8?B?Yy91ZlVJNnpEWTl0bTZCT2RjczBWanlHSHJaVXYvdWhqOURWN3JKc0VhVHVw?=
 =?utf-8?B?Z01TNFBFS2VQZWJLWWd3S21qSzJhVUxveURZVEVad2VUYW8xVVJSV0dSTUUz?=
 =?utf-8?Q?ruNw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e67dc22-b960-4c2f-24f1-08dc32e66eb7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 14:07:26.2543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLqIWgK6Fe1lxfKgpfuKjnLW7khTeao6og8X2xxZ/fUN5SelA1WcthXRWPk51EnW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5856
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

--------------IBPUWZb9aefdFjsLaXovRGi5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.02.24 um 18:43 schrieb Erhard Furtner:
> On Tue, 20 Feb 2024 14:50:04 +0100
> Christian König <christian.koenig@amd.com> wrote:
>
>> Yeah and that's probably the problem. The test is not supposed to be
>> compiled and executed on bare metal, but rather just as unit test
>> through user mode Linux.
>>
>> We probably don't check that correctly in the kconfig for some reason.
>> Can you provide your .config file?
>>
> Here's my v6.8-rc5 .config attached.

Thanks for that.

As long as nobody comes up with an approach how to run the test even 
when other drivers want to interact with TTM the attached patch is my 
best idea.

It basically disabled compiling the TTM tests as long as neither 
compiling for UML or COMPILE_TEST are set.

Opinions?

Thanks,
Christian.

>
> Regards,
> Erhard

--------------IBPUWZb9aefdFjsLaXovRGi5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-ttm-tests-depend-on-UML-COMPILE_TEST.patch"
Content-Disposition: attachment;
 filename="0001-drm-ttm-tests-depend-on-UML-COMPILE_TEST.patch"
Content-Transfer-Encoding: base64

RnJvbSBhMWRjZDFjZTYzMmJmNmMzODc2NWUzY2MwMDZiNmQ5MmM0ZTcwYjM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Q2hyaXN0aWFuPTIwSz1DMz1CNm5pZz89IDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkRhdGU6IFdlZCwgMjEgRmViIDIwMjQgMDg6MTg6NTkg
KzAxMDAKU3ViamVjdDogW1BBVENIXSBkcm0vdHRtL3Rlc3RzOiBkZXBlbmQgb24gVU1MIHx8IENP
TVBJTEVfVEVTVApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNo
YXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKQXQgbGVhc3QgdGhl
IGRldmljZSB0ZXN0IHJlcXVpcmVzIHRoYXQgbm8gb3RoZXIgZHJpdmVyIHVzaW5nIFRUTSBpcwps
b2FkZWQuIFNvIG1ha2UgdGhvc2UgdW5pdCB0ZXN0cyBkZXBlbmQgb24gVU1MIHx8IENPTVBJTEVf
VEVTVCB0bwpwcmV2ZW50IHBlb3BsZSBmcm9tIHRyeWluZyB0aGVtIG9uIGJhcmUgbWV0YWwuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKaW5kZXggMjUyMGRiMGI3NzZl
Li5jN2VkYmExOGE2ZjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnCkBAIC0xOTksNyArMTk5LDcgQEAgY29uZmlnIERSTV9U
VE0KIGNvbmZpZyBEUk1fVFRNX0tVTklUX1RFU1QKICAgICAgICAgdHJpc3RhdGUgIktVbml0IHRl
c3RzIGZvciBUVE0iIGlmICFLVU5JVF9BTExfVEVTVFMKICAgICAgICAgZGVmYXVsdCBuCi0gICAg
ICAgIGRlcGVuZHMgb24gRFJNICYmIEtVTklUICYmIE1NVQorICAgICAgICBkZXBlbmRzIG9uIERS
TSAmJiBLVU5JVCAmJiBNTVUgJiYgKFVNTCB8fCBDT01QSUxFX1RFU1QpCiAgICAgICAgIHNlbGVj
dCBEUk1fVFRNCiAgICAgICAgIHNlbGVjdCBEUk1fRVhQT1JUX0ZPUl9URVNUUyBpZiBtCiAgICAg
ICAgIHNlbGVjdCBEUk1fS1VOSVRfVEVTVF9IRUxQRVJTCkBAIC0yMDcsNyArMjA3LDggQEAgY29u
ZmlnIERSTV9UVE1fS1VOSVRfVEVTVAogICAgICAgICBoZWxwCiAgICAgICAgICAgRW5hYmxlcyB1
bml0IHRlc3RzIGZvciBUVE0sIGEgR1BVIG1lbW9yeSBtYW5hZ2VyIHN1YnN5c3RlbSB1c2VkCiAg
ICAgICAgICAgdG8gbWFuYWdlIG1lbW9yeSBidWZmZXJzLiBUaGlzIG9wdGlvbiBpcyBtb3N0bHkg
dXNlZnVsIGZvciBrZXJuZWwKLSAgICAgICAgICBkZXZlbG9wZXJzLgorICAgICAgICAgIGRldmVs
b3BlcnMuIEl0IGRlcGVuZHMgb24gKFVNTCB8fCBDT01QSUxFX1RFU1QpIHNpbmNlIG5vIG90aGVy
IGRyaXZlcgorICAgICAgICAgIHdoaWNoIHVzZXMgVFRNIGNhbiBiZSBsb2FkZWQgd2hpbGUgcnVu
bmluZyB0aGUgdGVzdHMuCiAKICAgICAgICAgICBJZiBpbiBkb3VidCwgc2F5ICJOIi4KIAotLSAK
Mi4zNC4xCgo=

--------------IBPUWZb9aefdFjsLaXovRGi5--

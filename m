Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHbnIMh2lGlmEAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:10:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDF14D063
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 15:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A6B10E4DA;
	Tue, 17 Feb 2026 14:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fumjDTs8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011067.outbound.protection.outlook.com [40.107.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B9B10E4DA;
 Tue, 17 Feb 2026 14:10:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeQaXm2hhk2pOmdmyCEQdyg/9QNTkSq3+ZmJRwSnRbPnX2tVxmN4NsrYQrHgMlcmh1zlVk1aKrmoGuDvP73h/TOpvqpMCbYPEnW82midEVqG84rYizdidOXoDuK9+PZ43NEDr1tHlmtgz0ooYy1o82G3IQIS7cU3+KJXdWAYLpTrEDmjNOHPK9fDoBVPjR1T/IVGboNp1ooNL7L5Scgrn1KFS9oXvuOMKB5xRw0YH8YN1TBfHpDaaf3+QbGGyATcXlfYb4IvXn/7rM7YTlLIS86kC+S2RH25qZc+VbTPKFa52h/PVQpLZSGfMxh7r7vUMV40YVmgFkIhPlLk+rPrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=95UGzk/bbezALZ/C0wepaF53IbL1/Vb2N3FGIJY46w4=;
 b=uJnxSZerm2Lvaw0fXkGWwRS13q9jpG1iJAfKxg8W4EDcs0RDtj/+J1JR3SEXDSGV6gm1DV8xjSDzsbufCBS0OgAAGV5WL/IxfQedWekSigMTNvcFgbTmvDiDuCaOt9tkG53x3m6553p1BpqPhHo2bmzOy75lyCHWOJwhGyxV9If9qQtt2iZ0GsToMnz0u763U6Jw4xFLiVn4eBq/cYQvS2WQawwEyWj2RHFw54ad3LAhv4FKhp8tq5RUxct278xYVprsHpkyzDHV4/w8iZEDXJYQUpxJK5QfsQMflV82di3X5JN2lYhEyf/yMAy+18urYlLDk+58qnz4upCWZ0b0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95UGzk/bbezALZ/C0wepaF53IbL1/Vb2N3FGIJY46w4=;
 b=fumjDTs8T0NGelk3SrJJPXKDuh0ctURcG+dUHeykJiYVrM0wQPwCZtaMGgRFS99dGuAsH+BGKESOFDaOBB2nOBxP/NBTy8WzS1sY6VZBzuPc1zFAEhi1R/2yLu9/b6TwN1tf0CcOZco7I06aK2V0/G7rJs5qzB6PXbE8lKNbrJo7V0SCpU2aFtP1t5Qo4WXANcdbd+390rqvlsemoxlIeOzhDs6qNppiHquZdVnMTJPsa2tn0pBAAxUNqdR4zCPd1JzBRGPNcgzEwvtaD6Jf8uDKzAfC0MQm6vMYJvNznzmVy3dDZb21Iwbg8eXbc+z+xaUQ1m5LYt9k1DZ77D0nbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 17 Feb
 2026 14:10:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 14:10:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 23:10:02 +0900
Message-Id: <DGHAPCX1JAWX.3B8VMCMPCZ7UG@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Gary
 Guo" <gary@garyguo.net>
Subject: Re: [PATCH v3 7/8] gpu: nova-core: use core library's CStr instead
 of kernel one
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>
 <DGH77OGW8BFR.2NV0GJ1890DPF@kernel.org>
In-Reply-To: <DGH77OGW8BFR.2NV0GJ1890DPF@kernel.org>
X-ClientProxiedBy: TYCPR01CA0134.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d1b21c-c972-48ca-81e5-08de6e2e40cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHBIeEV5SHgvMHZBbEltOXBUcFF5dDM1TjJqOHpkVE1zdy95Ly9RTTF5ck1j?=
 =?utf-8?B?aWZRL2FzenBnMTVsRWcwSHRNLzZrNVNmY1BVaDgrVC9WSkhyVWhyUE14V1NL?=
 =?utf-8?B?OVpRK3JVcFdXU2tqZ05oS29ySlFkdGZxMHAxVExSVXJSeGFxNXQ4bzk3UE1s?=
 =?utf-8?B?N1h1eGtDN09SZHl4OFVGNG85VjJVVFZDSHJ2Mi9JZlJOVzl3OVZ4TTRkQmVv?=
 =?utf-8?B?TTFWaW55cmdkUk5wak9ab1EySkxseng1WHRkRStZbW1oSmxLSnR0YlB2U2lj?=
 =?utf-8?B?ZjVVeCtuTmFkM0pMUTNHUWpHaE16RUZBTU9JWXJ5a0l3aklwQVAyWmJHQm9X?=
 =?utf-8?B?UXRNUkFWVS9ad3pPRDZVVjByZ2pBTDEwRElPblovMFh3YnVvR3E2VWtzdWZa?=
 =?utf-8?B?bkZySmgwanNnRU1mQ1g4TjlNamRhc2FOU20zTkR0QWJlWnZERVkwYmV6RERk?=
 =?utf-8?B?UHV3NWYwU0YyaEJOWVVwekVMS0FQSlRHYVBSSzAvSkxXTGE1TzdFd2gyMmFH?=
 =?utf-8?B?ZHQyNzJRdmlJbytUSHQxYi9KZTZieDRLc0tLT1ptU0NXQXJkRmNZL3FpYzRt?=
 =?utf-8?B?WEtqcWQ0VGh4V21UTklQRVQ1VHpyaCtPTFhxenZrRVlTdUtnUDJBUGxMVWp2?=
 =?utf-8?B?ekpvdE0rbUgrYzdDMWVEL3EvQnBkeGlCNUFFOFhLaGVUdlQyRENzc1BPbWpN?=
 =?utf-8?B?em5rVjJUR2pXTnNNaHhjTGhoaUFPWDNkOW5GeWp3UzExWkVNOGRaVytWZnl2?=
 =?utf-8?B?eDVWMXl0S25pU20zV2ZZa3JsbjVWRWhvQlE2TkxRVGdvbkhRTWg5SkQwWFlM?=
 =?utf-8?B?bmsydHZFdGZBUlVtaXJGcDVFVlJPRlR4cEFmZ1dVWjY0bC9nbFM0NjlFM1ZW?=
 =?utf-8?B?RHUvNlhtZjN3dk1ObUw0ZE0ycnJHK0R0SUlINkFnTWQ0aWdJd1FkUGxmTyt1?=
 =?utf-8?B?Uk9qc1pFNndpWmpBVW5EdCt1c2dpRElWejIwZ081ZUl6TzlzQnFrdGxJUjdx?=
 =?utf-8?B?ei8wcVUrSHFSaXhZMm8zdXI2dTBWeUQyNmcwU3EwWnptTE1yY3hCaEpCTHBK?=
 =?utf-8?B?NVM4Vzh4QjRYYUM5cmJPeCtLak5PZmFpUFJuVXpXaTROQm0yQlZtc2ovMlRn?=
 =?utf-8?B?bldZc1g2WTNaeVU4VUJNeEdaK3NjVkJFclFFYWhCSC9vaVJFeW5wVmdvTVVv?=
 =?utf-8?B?K1J6elZvQm5idGZHWDFmWStIZ3JTQjlCTzhTejNwUUR2WjI1cU45TnpQME9U?=
 =?utf-8?B?T0RBM3hCZXpLWUZpUFZqcEN3TzNtQ1RxT0JTRFV2QXdBOW9RZGw1T2VTNFkx?=
 =?utf-8?B?dUZCcll0Q1BHbG9JdnF2TmV2d1d5Y3pBblFNRUQxMGtNNUcwbkxwUDFyRDdX?=
 =?utf-8?B?b1N5ODVNbUFZWFFmRFZHQ0dsNFdOTVpnTkVjVndmYVRLK1BFTUl4T0FERExy?=
 =?utf-8?B?ZWF6dldsQjBIOHN3Mmx0UkczbENQVnZvR2Z2RmE2V0wyOWgraFBHVTZCVEp5?=
 =?utf-8?B?RHE3czNDekhucE5hMEQvbXNTMytoclB3aU5WMjVieU4xNEpHUC9qdEIrME00?=
 =?utf-8?B?T21vWWx1czV2MUl6c2d3Rnk4Vldsb2EvZWxvbVdSdHUwUzQ4UkQ1ZklEOFFp?=
 =?utf-8?B?a1dEalFjcXJvdUdwMXN4MHF5ZnBlV2RjRmdrZmxIeVNFa1BIdHlYSzRUdzhM?=
 =?utf-8?B?bnRaZUgrSXNObHJjdEpFYTY1TUFTRktRbEptTzU3ME01bS9mOTlFQXBVY2pG?=
 =?utf-8?B?ZGlVbzg5YitlWDRqb1dlNDhWTmY4Q3FnMFVuNXc2ZElHeE1pRm82TTh2VnRz?=
 =?utf-8?B?bEk5Sk85YlQvL2ZZdkRIRkJKV2llY1VSZGFsWVdjdm9hN3hnMjdYdzhGdTFV?=
 =?utf-8?B?VTU5OWs5S1hNdHRGSTRySUNwd0dSNDd0MjhtNDlhK1lSdDdETjA3dXJpSUFW?=
 =?utf-8?B?VzB1NjNHbEFXWmV6aDFCeVdiVG9HTEhvR3ZWbzhjK1BqVncyelZLZFJMRmN1?=
 =?utf-8?B?TzJFWk80YVhDMmFRYkJMMVkzaGZBOHhPY0d5WDdyTVl1eUF4ZHFvc1BtM1Nr?=
 =?utf-8?B?UUdyUEcxZDBYbDJudmFyMSs2UEI2V3FVWXNYK21mMEI4dEZKVTlmY0RnOTdj?=
 =?utf-8?Q?iWYs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFBGQlIzMWRhNEZRTWxHcjJRTm41cmZyNHpvMmpPQ3VOVHZMVEJkN1g1aWtz?=
 =?utf-8?B?VXFWbisxYlhVZDZCN1doYk9zVVVIZkJHaHVtdVE1V0RmcGo5R2drbUJFTENS?=
 =?utf-8?B?Zm82dFlMZnVXeGc5NU5BalpMOWlnRlVWVm91T2FKMHNFUDJzNEdvSUtrdnhU?=
 =?utf-8?B?eENHN09VTHFJTnovREE3RGN4K3l4UzE5bXU3K3hxZGpjdUFuQWcwamNqbFg2?=
 =?utf-8?B?d3ZNUnhQd1l2bWc1SWRSclNkNnF0bVFWMDcvcWczeHpobFJFVUFsOUtaWGtq?=
 =?utf-8?B?WVZGZFJpSXJ2cW5CMldXMlJvTktLS0hoem5XckhybTN4bkJqa3cySTRuSVRU?=
 =?utf-8?B?cW1BVzZ6ZnJuNlpkYzJ5YXhKWU9OTFUxcmRNcjMzc2c2dElIcWxYY0RQeVI5?=
 =?utf-8?B?a21EMkVPODNuRzVLMENjSHExQjFZenc4M2I4NkJkSjlQMDdHRzcwUkllbm4x?=
 =?utf-8?B?aEVwZCs1YXFLUktuTzNNNmVaWXdiUkZYRG1uWmFyMXBlS3FDbk9kazBxNjZI?=
 =?utf-8?B?RTJ3RXE4dENuMjBqNVVBM2hHK2FDZS9QWE5EWGljSGpidCtSVkdhQWpTN01l?=
 =?utf-8?B?dHpWSkQ4Y0szQkg4QUk2UnpQRXl2bTd3dVBaelVhV3Eyd3l0NnJDeEJESnF6?=
 =?utf-8?B?dnZJbGlNelZzaEU0YlQxdEYrOFNZVU9PRzNPSFV3TG9FdUJ5OXBZRGZGcjNk?=
 =?utf-8?B?VUdGOHlNczV3dlcvWXdwRUlNRWIzWWVPODYzSXREaVVjOEtnR1dBSEVYNExH?=
 =?utf-8?B?anJXcW1Mc1psTGpnbFpySDV3SGNZbm5nMUE5WkpNOEpuVWNpVU03TkZBMVNE?=
 =?utf-8?B?am5zS09UYXhvS05JWkJEUlNhWkRra3J4TjlBUXA3TWY4ZUdWUGsvVm5UTkwv?=
 =?utf-8?B?ZHFaUzA1ZE1Ta2ZySEtYVlVtc0xuV0FyTUZ6QlBDRTlNcjlNbVgrZU8yZGp2?=
 =?utf-8?B?eXZlNmR5eU1COEhCcHBrcklDNjR5VHY4U3Q3UEJwMjhSZXhWRy9HV0pDbTBB?=
 =?utf-8?B?Uk9IMHU5ZFJxT2dCZm0rRjcyT0lEWUozd3FScUt0Q1JNZ2JxYVY0dEtLVGRj?=
 =?utf-8?B?VUtvNUlMU293WlNtMWpwdkVSOW8xNFlCaWlkMVM4dks1L1JDRUJ5dVl3bkxk?=
 =?utf-8?B?MkYya09ZWlphT1Vqa2NnOVpVdWpTTjlWbFdxQkVOVjB0TW5lUEVkamFEdGli?=
 =?utf-8?B?V0NXbm9POXlCZVQ4aVdhZ2diV2VtQzBibm02K05HVnpOU1Npb1lQRHA5amsv?=
 =?utf-8?B?Q1RhZGQrSUUyWVFNVHJhazhYNW9DMFFTdmgvTHJUSnY5eERUU3FZV2dDT1Nm?=
 =?utf-8?B?VThpSldjR0lIcllZay9Tb0hiRXluMVRnUnpEVDlKdlIzZVpFa01KRDk5VFk0?=
 =?utf-8?B?dlBzODlHbmpHTnYzWjArQkdkY3RseDhyQmF4NXUzSGVmekc2M2FkUlBEOElI?=
 =?utf-8?B?WUpOTWFnMm9DVzhYZlJIcTI2TWlUMUJaQlFXWlFYZnp6UG5PMzlQaEh2ZU9V?=
 =?utf-8?B?eXNKYjF3d3pTQ2VQYWZrekF4ci9KcXhjVEZtUTQzRWVvSEhtaUYxd2pOcjZw?=
 =?utf-8?B?eHhJWkdybVptM2IwQUVwQStaZVBvdEdzOWtseEgvYm1IbW4rSG1vQUVRVmIr?=
 =?utf-8?B?ZlNEbHJsNG9PcWhpN0U2MzRWS2ljYmpQbGRRSEMxMkxzV1l2ZU5TeE9MUEpF?=
 =?utf-8?B?YkYyTmdKbGVXVEUvcTRMVWpTT1ZHUzN0L1o0NVJsMlJPWmxZWHBtU1U2bVFQ?=
 =?utf-8?B?YVRXbTF3bUxJM3h5Z2k1V1hwSEtsOVNiSWNxVHROYXN6ZVlmRzFNQTNaVHY0?=
 =?utf-8?B?TnJyRGgwL3dNU3VmNGljNXRzRS8wVnVHdUJwSmtIdHhxMEhHd1dwMlRpV1h5?=
 =?utf-8?B?WUltRDlTZWg0THpTUm9WWjEwTEpxRGxhZmVKazBUNzIzQlpZUlBORnZuc2p1?=
 =?utf-8?B?WXFJUFBTOFo2ZXZpNWxXWUNWZzFKdlJDdG9nQjJlcnZaQk1pZmVGb1JxL0U3?=
 =?utf-8?B?OElIWElpTnF4bTlSRzBvUTZUWE9kcktjVXNzWm9rdW5lVzdTQlpxVGxRVjlp?=
 =?utf-8?B?amtYV3lJcE93MzNEbUNCeFFpSWZyeXBDUllLeC8xRDJJWm8wSjlUOGtybVJq?=
 =?utf-8?B?d0hPcVlpYW01aEwvMjU5M2ZFRHNzRTYyNWMreHFIMGVIa0Y3R0N5TzJnSG84?=
 =?utf-8?B?SFBES29tZktBQ1hSUXZRY0xpRllDQ1VQaWMyY0ZVMngzbjVjd2hVNHB5OE5H?=
 =?utf-8?B?SWFRa0RHWTlCeTlHdVJtOXo1OTJZNWp0WHMrS1AvUkJyQnROQzNYY2ltcUVi?=
 =?utf-8?B?NXYvNmtuSDF5dlpyZlR0ajlCYU9ESnNDeThyaU1jUTVRMmNiNXY0bGlFNWl3?=
 =?utf-8?Q?SHbyIBaNf0efKxe+uKiJ7GwpoS0HNjhxEwLusgbc9/rh/?=
X-MS-Exchange-AntiSpam-MessageData-1: 8ICLgTS76GJhvA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d1b21c-c972-48ca-81e5-08de6e2e40cf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 14:10:07.3991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KntdiV2ELvRkVgl7RgKKPNohm1DAqBltACb2APCXmhz7Y1lshXLJNltJhMlBBOryABmteAvEcloggE0vzKNTNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: F0FDF14D063
X-Rspamd-Action: no action

On Tue Feb 17, 2026 at 8:25 PM JST, Danilo Krummrich wrote:
> On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
>> The kernel's own CStr type has been replaced by the one in the core
>> library, and is now an alias to the latter. Change our imports to
>> directly reference the actual type.
>>
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs     | 2 +-
>>  drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
>>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>>  3 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/f=
irmware.rs
>> index 68779540aa28..2f7249383e51 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -424,7 +424,7 @@ const fn make_entry_chipset(self, chipset: &str) -> =
Self {
>>      }
>> =20
>>      pub(crate) const fn create(
>> -        module_name: &'static kernel::str::CStr,
>> +        module_name: &'static core::ffi::CStr,
>>      ) -> firmware::ModInfoBuilder<N> {
>>          let mut this =3D Self(firmware::ModInfoBuilder::new(module_name=
));
>>          let mut i =3D 0;
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-co=
re/firmware/gsp.rs
>> index 9488a626352f..ae3f6581c5b6 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -32,9 +32,13 @@
>>  /// that scheme before nova-core becomes stable, which means this modul=
e will eventually be
>>  /// removed.
>>  mod elf {
>> +    use core::{
>> +        ffi::CStr,
>> +        mem::size_of, //
>> +    };
>> +
>>      use kernel::{
>>          bindings,
>> -        prelude::*,
>>          transmute::FromBytes, //
>>      };
>
> What's the improvement in this change? Both of the ones factored out are =
already
> correctly imported through prelude. Let's keep it as is.

Mmm, either they weren't at the time I initially wrote this patch, or
I've been careless (the latter being more likely). I'll remove this.

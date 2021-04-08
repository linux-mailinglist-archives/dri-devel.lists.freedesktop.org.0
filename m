Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 334EE358000
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B326EA55;
	Thu,  8 Apr 2021 09:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACB86EA54
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:56:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ozgq6BDxEtaChAwKalfJtqsK6eqEyB4BmUlor+1gZoemX9xVQiOCkk4GXfMZuoO4pIX+BROZlX2B6aTSy2pfTvt/C+1dmI8/RJeVoU750pW3xn5m4FYP2r2uFYxz+1TNi4aN1igcXx/wASwuwskpcMzjVg3amCrVSgJZeMz3RTjY6d9Nju/pzrpHtLfejTM7vIh7hJDvGfE5ROebq1E5cZdxabPd5syRnOQ7QXVfE3NJ+Bpu01KxmvckufgzdnlYXgoG0RkYTAONYV2JgfJAiNRrhhChhjjTxYmXYSy9sN0JKXSwVpfBh4GDzTkyMF3h5WFw0bro+l2KhsWIOSuB4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIMTf1OMUUwb8zclzhE75sJ733gOLCz0B4NOGx8Lb1Y=;
 b=f0rTuIZ+/PCfmt0SOQqZednKbNhD4UONXg6QAOC/Mg/ZWWClpsm8ThV16bcEEtIrcGsHzXliadEX6LrFQBRpYO57xT7y5zeZLMeob/9WXy6Hq9LXfU9MOP9Yi2l6oNt3unLzBqQuiXSSocaWEzr6Proad6WZY6RfMEMPuZoiRz1cTUOOTyhGn4z0gG3p5V9V63zeVrCXVr1tHpE2aqOsEclij1uoTSjY8jUFzWUllJg3AqS8xUtF5g4om3ZRsAjJFaB32qukjrM8b6liI4XDoxqxMuqeeb+uYjppiKPCtCvKtl7Zt6VdSO3ufxnYE6EVf6qkiVo5laj4orazsyATqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIMTf1OMUUwb8zclzhE75sJ733gOLCz0B4NOGx8Lb1Y=;
 b=2BFSUnBRI7vLl6wK30bi+f4qIq5aKPvh5duEinMrR4ZA8+pyuwSTHDytiZ2zT1Dhc2B0/QRKi+o0wWT0VS6nZEM8ccR6Cq+CYinCfln8eSHPzhCQ2cB25J9vMggAP+zSpu9YlT7Uvvn9eOH2jTOGeNfre5J6m83jM/SXhMShIq4=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2450.namprd12.prod.outlook.com (2603:10b6:207:4d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 09:56:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 09:56:04 +0000
Subject: Re: [PATCH v3] drm/syncobj: use newly allocated stub fences
To: David Stevens <stevensd@chromium.org>
References: <20210408095428.3983055-1-stevensd@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ce605cb0-ad27-e1b0-84c8-647ad1e19405@amd.com>
Date: Thu, 8 Apr 2021 11:55:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210408095428.3983055-1-stevensd@google.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
X-ClientProxiedBy: AM3PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:207::17)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:db83:c532:1fa2:b0cc]
 (2a02:908:1252:fb60:db83:c532:1fa2:b0cc) by
 AM3PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:207::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 09:56:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ffc4cb2c-d2c6-4da1-2f9d-08d8fa7485ab
X-MS-TrafficTypeDiagnostic: BL0PR12MB2450:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2450E2DE51EA798EE870626E83749@BL0PR12MB2450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSRRx/1CYau9vIAopXczFKEj/vT32G2eRH3/qLrYa1hBKbk/snv+AJmyMROTotbN8NiVwq7o4WnElebxLk5eAUkAORJfYC6/NTz8wYgCniT9VoypHUtNV4VCPFgEcejvTNDutZfo3/r3t/laCzB8xvol2x4JEp1p0sj1Ey+hJ8pWwq/jN1YXERTRIfv4tBELBfqDLoaz/89j06olXhU79i7WO7tE8VHCEwHhM3HCTOMA/5tQZwbhWYzg6vVHn6wYsuHbi4FlirhVzi3XU6r8fMR8WHOE4ueOET0ozRRcI/WizcNe+hS4Z0rZbmdGyLK75M9XIxKiM9HSJPnUDgXUtm5mHWmYald41pEuy49/xr4VByaOPQDY6efBBwQFvIEA3o3q2AJm45M9rxbURwDrUDDTfay7UrpqsdGdltm+cNPsBDHndSjLAAlcc4TarGyMrUp1pKD+id5VZSSr3Msesaa3pTROsRCeXB3aUGsTnEewVyYIDUqr8KgGLSrV10iaYCOG1tY/v46JfsxafxGTKaWkGnVIjBquwp3u7UdnJXp7oXwmm3Su79eW863JrFEpAzCDuRMEhkud/BQuD2oaTCg3Y3EV7pS2bbCRKK6vflxu7l+FGn1qjmKMl52IvCx1MCllElP2gmlWsfdGpgvx2EKmOtQyA48pWLJugH9KYlPkgzTk8vHD1gdBIL+HYXPg39/KfFaiFbmJfC1W1WSIFftXZ/zVTxDnHLpMMunlQmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(54906003)(36756003)(186003)(16526019)(6666004)(316002)(7416002)(4326008)(6916009)(52116002)(6486002)(478600001)(66946007)(86362001)(66476007)(66556008)(31696002)(66574015)(5660300002)(83380400001)(2906002)(31686004)(2616005)(8676002)(8936002)(38100700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YVdiZW9jZDVMTGVBejBBbEJCYjNFa1J0bnkyY01rR2ExZXEvSnlQU0dUYXdm?=
 =?utf-8?B?ZURTNmFDVlFDNE5ucUFLbWg0VkRzd0xNR2trWlliUFdxdHZpVFZlNE1lSzBK?=
 =?utf-8?B?RTIzbnh2RWZ0elVzT3lCWFRub2pvaC9LUVd6YmVqWU1VaUdEbTRVSXptUGti?=
 =?utf-8?B?YXU3R3NRVDh4aVlHTUIxVXVJT3l4QWYvd3BTdjJWRGw5NHhxME03OVpuOXhm?=
 =?utf-8?B?KzBYMUFtNnMwbHFDSjR3RndnanFORW04OXVZT21rRFZMNTQ3aXNERWoyc2Yy?=
 =?utf-8?B?WnBGcTltWVNCNUtTK2lZMXZhN2M4b2p6Q3NMSmZuNTg4SUJBaVJwZy9RTElE?=
 =?utf-8?B?ckNVTlY1ZW40NlVNMUJFVFpkYVRxSDNMeTM0a0hCb0dZNUtBVERWeTdBT041?=
 =?utf-8?B?eTE2NVNiTVcrQjNCS1BOditUUVQwYUhrblFTUVoxODZ3aHpsMjZCaVVCSklZ?=
 =?utf-8?B?WGRtVjgvNld5K0F4a0VhaGlzVVZmRmJqMFhvMUhQWHJOSk05TklnTzB3YUZQ?=
 =?utf-8?B?eUhNdDk1cFBHWUYzTGJZcFR3WnBvRzh5NHBadDUvMmxtQjI4U1ozc0l4V1ll?=
 =?utf-8?B?NGcyZkF3MFhON3JiamtucVRjUktZbjA4NStVRnZkWDVDZFdlNGlRNWw2eTR1?=
 =?utf-8?B?bzFKY2FTUkUyakF6ZEFNWmdpZVVRSTArTWhVTFNFM3Z4NUxDemY5c3l1YmV5?=
 =?utf-8?B?NjFOamtYeDlWZ1EyM1FFVXJRWHBPSG5yNVlkUXlySE5Wa1FtOThTYXY3V0JV?=
 =?utf-8?B?dDA0UW43cUwyekNxV1VZYmNnTitkRCsraCs5a295akNJdGxtZ2UyZ1ZxWWxh?=
 =?utf-8?B?R1NBTVNwSFFocm1yRGx1cisva0JjaEd0bStBVGdvZkllSFg0ZlBpbWUyTHFs?=
 =?utf-8?B?RC85TUVMeXd1L01MdlVOUDRJWXdCNU1kUGsxTVVieUFOMnpzSFZ2RER6R05R?=
 =?utf-8?B?cmRlY2NBOHUvWVp4eVNZN2hHUGlDT0llb3RMa0EvV3pLaWxabjJuYWRmemY2?=
 =?utf-8?B?dUFmVHVZblptOWl2OVpBU0pFeHN1SHdSVGNWWlVvd3UyQnJ0V0xHTktQMUJ3?=
 =?utf-8?B?VnczVXRReFFkb3AzQnMvWVZ6MlFLQjdteTlubEkzam94TkxRc3ByZGFTT2Iw?=
 =?utf-8?B?N09oN1BNNWkxbzYvVFFxcEhRczVDRUtSQjZJNnN4cCtvWWt4aENwbjdzMjl6?=
 =?utf-8?B?cms0TXo2Ymd6WmF2cTRPcld2QlRQT2JNdFM1L2lhRGxWWHlUTDJxdnNuQkRU?=
 =?utf-8?B?WGV5amsxMi9sb2MvcWY3clRBZEFpNHBZVHNQeWZhMGlGb2s1akNVMTh3b2hY?=
 =?utf-8?B?ZWNSMmJJd0lxZEliMElzOTd0WlhlcS9OaVpiN0FMaHlieFI4TUE1T3RtY01M?=
 =?utf-8?B?Tk5ZRTdIa2ZaV1p3d3dTTzVEMGJ5MzVvMjNFaEVzb1ZudWlHV2JkbGc5ZlFy?=
 =?utf-8?B?ejF0Y2NEUDBDb3NaNU8zWWQxcnBiVmwyNXRLTVlFREgvM016THZwdHNYR2p0?=
 =?utf-8?B?NnJwNWd3d3FJNlJZM1hvNXJTeWpHWnpSNHA4MmsyWS9PVXEzaFJJejlNb21M?=
 =?utf-8?B?VUl3VmloUWM5RlljMmJTbXdhTm9XNTJuWTR0N2VBdTlJNnlINUUreU5LWm1R?=
 =?utf-8?B?S1FVVzViblJqVzRrY0NJY3BoWTRLMlNnL0MvZFdJSU00SmQzRmRqWlU0NENC?=
 =?utf-8?B?UjBPYVFBREpYTlZpYVlDalo2Y0RZSHdESFVZdW5VVkpFY29xem5lRVdEZTIv?=
 =?utf-8?B?Q2ZCKzE2M1lKc1JaN05QZTNkSnQzMW8yVXQ4YzhrUXQrMWFRT3ovczBaZ0Nu?=
 =?utf-8?B?NlJZbDVGWEsxd3pscm9kYzFwZFJjTXZ6b3hXdEpVUkZ6TGxLaGE3a3dGMERI?=
 =?utf-8?Q?SeqZsLCUrsyjN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc4cb2c-d2c6-4da1-2f9d-08d8fa7485ab
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 09:56:04.0552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5M/cv0zWwkTSlag5nWtQkJuWl5xqyTHgwXeGDMBsXLqA/WifwaJoiCDf4R/uXHP+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2450
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDQuMjEgdW0gMTE6NTQgc2NocmllYiBEYXZpZCBTdGV2ZW5zOgo+IEZyb206IERhdmlk
IFN0ZXZlbnMgPHN0ZXZlbnNkQGNocm9taXVtLm9yZz4KPgo+IEFsbG9jYXRlIGEgbmV3IHByaXZh
dGUgc3R1YiBmZW5jZSBpbiBkcm1fc3luY29ial9hc3NpZ25fbnVsbF9oYW5kbGUsCj4gaW5zdGVh
ZCBvZiB1c2luZyBhIHN0YXRpYyBzdHViIGZlbmNlLgo+Cj4gV2hlbiB1c2Vyc3BhY2UgY3JlYXRl
cyBhIGZlbmNlIHdpdGggRFJNX1NZTkNPQkpfQ1JFQVRFX1NJR05BTEVEIG9yIHdoZW4KPiB1c2Vy
c3BhY2Ugc2lnbmFscyBhIGZlbmNlIHZpYSBEUk1fSU9DVExfU1lOQ09CSl9TSUdOQUwsIHRoZSB0
aW1lc3RhbXAKPiBvYnRhaW5lZCB3aGVuIHRoZSBmZW5jZSBpcyBleHBvcnRlZCBhbmQgcXVlcmll
ZCB3aXRoIFNZTkNfSU9DX0ZJTEVfSU5GTwo+IHNob3VsZCBtYXRjaCB3aGVuIHRoZSBmZW5jZSdz
IHN0YXR1cyB3YXMgY2hhbmdlZCBmcm9tIHRoZSBwZXJzcGVjdGl2ZSBvZgo+IHVzZXJzcGFjZSwg
d2hpY2ggaXMgZHVyaW5nIHRoZSByZXNwZWN0aXZlIGlvY3RsLgo+Cj4gV2hlbiBhIHN0YXRpYyBz
dHViIGZlbmNlIHN0YXJ0ZWQgYmVpbmcgdXNlZCBpbiBieSB0aGVzZSBpb2N0bHMsIHRoaXMKPiBi
ZWhhdmlvciBjaGFuZ2VkLiBJbnN0ZWFkLCB0aGUgdGltZXN0YW1wIHJldHVybmVkIGJ5IFNZTkNf
SU9DX0ZJTEVfSU5GTwo+IGJlY2FtZSB0aGUgZmlyc3QgdGltZSBhbnl0aGluZyB1c2VkIHRoZSBz
dGF0aWMgc3R1YiBmZW5jZSwgd2hpY2ggaGFzIG5vCj4gbWVhbmluZyB0byB1c2Vyc3BhY2UuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBTdGV2ZW5zIDxzdGV2ZW5zZEBjaHJvbWl1bS5vcmc+CgpS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
U2hvdWxkIEkgcHVzaCB0aGlzIHRvIGRybS1taXNjLW5leHQgb3IgaG93IGRvIHlvdSB3YW50IHRv
IHVwc3RyZWFtIGl0PwoKVGhhbmtzLApDaHJpc3RpYW4uCgo+IC0tLQo+IHYyIC0+IHYzOgo+ICAg
LSByZXVzZSB0aGUgc3RhdGljIHN0dWIgc3BpbmxvY2sKPiB2MSAtPiB2MjoKPiAgIC0gY2hlY2tw
YXRjaCBzdHlsZSBmaXhlcwo+Cj4gICBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgICB8IDI3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9zeW5j
b2JqLmMgfCAyNSArKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L2Rt
YS1mZW5jZS5oICAgICB8ICAxICsKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygr
KSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZl
bmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiBpbmRleCBkNjRmYzAzOTI5YmUu
LmNlMGY1ZWZmNTc1ZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMK
PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMKPiBAQCAtMTIzLDcgKzEyMyw5IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2ZlbmNlX29wcyBkbWFfZmVuY2Vfc3R1Yl9vcHMgPSB7
Cj4gICAvKioKPiAgICAqIGRtYV9mZW5jZV9nZXRfc3R1YiAtIHJldHVybiBhIHNpZ25hbGVkIGZl
bmNlCj4gICAgKgo+IC0gKiBSZXR1cm4gYSBzdHViIGZlbmNlIHdoaWNoIGlzIGFscmVhZHkgc2ln
bmFsZWQuCj4gKyAqIFJldHVybiBhIHN0dWIgZmVuY2Ugd2hpY2ggaXMgYWxyZWFkeSBzaWduYWxl
ZC4gVGhlIGZlbmNlJ3MKPiArICogdGltZXN0YW1wIGNvcnJlc3BvbmRzIHRvIHRoZSBmaXJzdCB0
aW1lIGFmdGVyIGJvb3QgdGhpcwo+ICsgKiBmdW5jdGlvbiBpcyBjYWxsZWQuCj4gICAgKi8KPiAg
IHN0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9nZXRfc3R1Yih2b2lkKQo+ICAgewo+IEBAIC0x
NDEsNiArMTQzLDI5IEBAIHN0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9nZXRfc3R1Yih2b2lk
KQo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfZ2V0X3N0dWIpOwo+ICAgCj4gKy8q
Kgo+ICsgKiBkbWFfZmVuY2VfYWxsb2NhdGVfcHJpdmF0ZV9zdHViIC0gcmV0dXJuIGEgcHJpdmF0
ZSwgc2lnbmFsZWQgZmVuY2UKPiArICoKPiArICogUmV0dXJuIGEgbmV3bHkgYWxsb2NhdGVkIGFu
ZCBzaWduYWxlZCBzdHViIGZlbmNlLgo+ICsgKi8KPiArc3RydWN0IGRtYV9mZW5jZSAqZG1hX2Zl
bmNlX2FsbG9jYXRlX3ByaXZhdGVfc3R1Yih2b2lkKQo+ICt7Cj4gKwlzdHJ1Y3QgZG1hX2ZlbmNl
ICpmZW5jZTsKPiArCj4gKwlmZW5jZSA9IGt6YWxsb2Moc2l6ZW9mKCpmZW5jZSksIEdGUF9LRVJO
RUwpOwo+ICsJaWYgKGZlbmNlID09IE5VTEwpCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7
Cj4gKwo+ICsJZG1hX2ZlbmNlX2luaXQoZmVuY2UsCj4gKwkJICAgICAgICZkbWFfZmVuY2Vfc3R1
Yl9vcHMsCj4gKwkJICAgICAgICZkbWFfZmVuY2Vfc3R1Yl9sb2NrLAo+ICsJCSAgICAgICAwLCAw
KTsKPiArCWRtYV9mZW5jZV9zaWduYWwoZmVuY2UpOwo+ICsKPiArCXJldHVybiBmZW5jZTsKPiAr
fQo+ICtFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9hbGxvY2F0ZV9wcml2YXRlX3N0dWIpOwo+ICsK
PiAgIC8qKgo+ICAgICogZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2MgLSBhbGxvY2F0ZSBhbiBhcnJh
eSBvZiBmZW5jZSBjb250ZXh0cwo+ICAgICogQG51bTogYW1vdW50IG9mIGNvbnRleHRzIHRvIGFs
bG9jYXRlCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPiBpbmRleCAzNDkxNDYwNDk4NDkuLmE1NGFhODUw
ZDE0MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4gQEAgLTM1MCwxMiArMzUwLDE2IEBAIEVY
UE9SVF9TWU1CT0woZHJtX3N5bmNvYmpfcmVwbGFjZV9mZW5jZSk7Cj4gICAgKgo+ICAgICogQXNz
aWduIGEgYWxyZWFkeSBzaWduYWxlZCBzdHViIGZlbmNlIHRvIHRoZSBzeW5jIG9iamVjdC4KPiAg
ICAqLwo+IC1zdGF0aWMgdm9pZCBkcm1fc3luY29ial9hc3NpZ25fbnVsbF9oYW5kbGUoc3RydWN0
IGRybV9zeW5jb2JqICpzeW5jb2JqKQo+ICtzdGF0aWMgaW50IGRybV9zeW5jb2JqX2Fzc2lnbl9u
dWxsX2hhbmRsZShzdHJ1Y3QgZHJtX3N5bmNvYmogKnN5bmNvYmopCj4gICB7Cj4gLQlzdHJ1Y3Qg
ZG1hX2ZlbmNlICpmZW5jZSA9IGRtYV9mZW5jZV9nZXRfc3R1YigpOwo+ICsJc3RydWN0IGRtYV9m
ZW5jZSAqZmVuY2UgPSBkbWFfZmVuY2VfYWxsb2NhdGVfcHJpdmF0ZV9zdHViKCk7Cj4gKwo+ICsJ
aWYgKElTX0VSUihmZW5jZSkpCj4gKwkJcmV0dXJuIFBUUl9FUlIoZmVuY2UpOwo+ICAgCj4gICAJ
ZHJtX3N5bmNvYmpfcmVwbGFjZV9mZW5jZShzeW5jb2JqLCBmZW5jZSk7Cj4gICAJZG1hX2ZlbmNl
X3B1dChmZW5jZSk7Cj4gKwlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICAgLyogNXMgZGVmYXVsdCBm
b3Igd2FpdCBzdWJtaXNzaW9uICovCj4gQEAgLTQ2OSw2ICs0NzMsNyBAQCBFWFBPUlRfU1lNQk9M
KGRybV9zeW5jb2JqX2ZyZWUpOwo+ICAgaW50IGRybV9zeW5jb2JqX2NyZWF0ZShzdHJ1Y3QgZHJt
X3N5bmNvYmogKipvdXRfc3luY29iaiwgdWludDMyX3QgZmxhZ3MsCj4gICAJCSAgICAgICBzdHJ1
Y3QgZG1hX2ZlbmNlICpmZW5jZSkKPiAgIHsKPiArCWludCByZXQ7Cj4gICAJc3RydWN0IGRybV9z
eW5jb2JqICpzeW5jb2JqOwo+ICAgCj4gICAJc3luY29iaiA9IGt6YWxsb2Moc2l6ZW9mKHN0cnVj
dCBkcm1fc3luY29iaiksIEdGUF9LRVJORUwpOwo+IEBAIC00NzksOCArNDg0LDEzIEBAIGludCBk
cm1fc3luY29ial9jcmVhdGUoc3RydWN0IGRybV9zeW5jb2JqICoqb3V0X3N5bmNvYmosIHVpbnQz
Ml90IGZsYWdzLAo+ICAgCUlOSVRfTElTVF9IRUFEKCZzeW5jb2JqLT5jYl9saXN0KTsKPiAgIAlz
cGluX2xvY2tfaW5pdCgmc3luY29iai0+bG9jayk7Cj4gICAKPiAtCWlmIChmbGFncyAmIERSTV9T
WU5DT0JKX0NSRUFURV9TSUdOQUxFRCkKPiAtCQlkcm1fc3luY29ial9hc3NpZ25fbnVsbF9oYW5k
bGUoc3luY29iaik7Cj4gKwlpZiAoZmxhZ3MgJiBEUk1fU1lOQ09CSl9DUkVBVEVfU0lHTkFMRUQp
IHsKPiArCQlyZXQgPSBkcm1fc3luY29ial9hc3NpZ25fbnVsbF9oYW5kbGUoc3luY29iaik7Cj4g
KwkJaWYgKHJldCA8IDApIHsKPiArCQkJZHJtX3N5bmNvYmpfcHV0KHN5bmNvYmopOwo+ICsJCQly
ZXR1cm4gcmV0Owo+ICsJCX0KPiArCX0KPiAgIAo+ICAgCWlmIChmZW5jZSkKPiAgIAkJZHJtX3N5
bmNvYmpfcmVwbGFjZV9mZW5jZShzeW5jb2JqLCBmZW5jZSk7Cj4gQEAgLTEzMjIsOCArMTMzMiwx
MSBAQCBkcm1fc3luY29ial9zaWduYWxfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSwKPiAgIAlpZiAocmV0IDwgMCkKPiAgIAkJcmV0dXJuIHJldDsKPiAgIAo+IC0JZm9y
IChpID0gMDsgaSA8IGFyZ3MtPmNvdW50X2hhbmRsZXM7IGkrKykKPiAtCQlkcm1fc3luY29ial9h
c3NpZ25fbnVsbF9oYW5kbGUoc3luY29ianNbaV0pOwo+ICsJZm9yIChpID0gMDsgaSA8IGFyZ3Mt
PmNvdW50X2hhbmRsZXM7IGkrKykgewo+ICsJCXJldCA9IGRybV9zeW5jb2JqX2Fzc2lnbl9udWxs
X2hhbmRsZShzeW5jb2Jqc1tpXSk7Cj4gKwkJaWYgKHJldCA8IDApCj4gKwkJCWJyZWFrOwo+ICsJ
fQo+ICAgCj4gICAJZHJtX3N5bmNvYmpfYXJyYXlfZnJlZShzeW5jb2JqcywgYXJncy0+Y291bnRf
aGFuZGxlcyk7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaCBi
L2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgKPiBpbmRleCA5ZjEyZWZhYWE5M2EuLjZmZmI0YjJj
NjM3MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9kbWEtZmVuY2UuaAo+IEBAIC01ODcsNiArNTg3LDcgQEAgc3RhdGljIGlubGlu
ZSBzaWduZWQgbG9uZyBkbWFfZmVuY2Vfd2FpdChzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSwgYm9v
bCBpbnRyKQo+ICAgfQo+ICAgCj4gICBzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfZ2V0X3N0
dWIodm9pZCk7Cj4gK3N0cnVjdCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9hbGxvY2F0ZV9wcml2YXRl
X3N0dWIodm9pZCk7Cj4gICB1NjQgZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2ModW5zaWduZWQgbnVt
KTsKPiAgIAo+ICAgI2RlZmluZSBETUFfRkVOQ0VfVFJBQ0UoZiwgZm10LCBhcmdzLi4uKSBcCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

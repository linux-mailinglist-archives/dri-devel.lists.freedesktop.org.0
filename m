Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHLmHhTZnmkTXgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:12:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5761964A4
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 12:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93EE110E221;
	Wed, 25 Feb 2026 11:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="GaVtP1mr";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="LSnFlMz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 873 seconds by postgrey-1.36 at gabe;
 Wed, 25 Feb 2026 11:12:15 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF21B10E221
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 11:12:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P5wkoQ2609368; Wed, 25 Feb 2026 10:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=1yDiPqvC8dKSsrcGJ6I4pSrZ1Tz34k5f7S1SdD0E4FY=; b=GaV
 tP1mrAHNof1tP8zQNEUci4cSJjovwgbJEdyU/jcUm2PrLLW56B6YZGP6DpXs4wZH
 f3nou3G1kd0pMPexd6y9306kwIeLFPeVFIvwhLDmNrXHYlgw6moI8EcJ9XWOjDYE
 vIhI4XipUaaREnJFLRsCdq5//HItIxW0WciQZuRjlMCvmvVannYl01UP7lpzaIT3
 5v1LfSEHooHVmwfJFwEGBMIXQOsPggUfv0xohxL3EhWFSMkrdLjtovQ9BYR8iHIr
 d/FoL8PJN/nNbEXBGN6T86x4dIJfHSAFai1BujOpzXl7u+u31y1UqESkuBYAayjW
 L1CASDESg2KcYKFRzpg==
Received: from cwxp265cu010.outbound.protection.outlook.com
 (mail-ukwestazon11022091.outbound.protection.outlook.com [52.101.101.91])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4cgsfahkf2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 25 Feb 2026 10:57:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D33fwA9WzQvDxBqmz3c6Gf9MItj6bnpuLoF0wuzfwBXWwzYQ1hIChf9EeBdbMd6vuaV5HzGgM19tap37Oanl8JDhBi2gkHS4WIBK7/0Yyae2pR7TabyAZzpAfrwXLZ9R1kob1BQLXTpIblH/TGrZd45sZbw1y+GBiGS0I7874BFC3wwLXKVTjexFcx4GfgxDNDHlV7wQWGKjBO4DkHYOl3grrecf1ebQcmkLKP3/AtImzAiIY47u0637APd06kzVCTUejnnzDxC7WPJtWt9GYPVtDoBw/tl7jsQO4dUqZYSVHOZtWkiE7A9jBGduaQLUC0BJN9RTRwZApOpZS85PAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yDiPqvC8dKSsrcGJ6I4pSrZ1Tz34k5f7S1SdD0E4FY=;
 b=y8c7YD3YUy+DC0Z7GnBanhNg5lcoHEt2kcc7CsfchTYfguAcEsi0dmLf2Y5II1Qz0yVO/IRpXJ9zGvmwLahfmHnIi9rrnhqyB6dDa78yi+PRAbblmTP2IttqYwwnux7ZTr5CD6Zf6h62ixq8WAX30F0yWdScYxjNOPfFoN1L/W04BtqYPJY84vBDz70WKTr8VW7/p2QxRNO0d8SGc7a4YFWQKJLeCd/LJqIeJeISAANAju6eEY6HUefhAZKKsDsR9Y2r1SJ2TepXxuCyYz+kUelOPOl4DLi/BjqVEOHs70dPkx0ZA50UamCZomgg2hmu+S71R2U+fOXFC/VrasW3pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yDiPqvC8dKSsrcGJ6I4pSrZ1Tz34k5f7S1SdD0E4FY=;
 b=LSnFlMz2XIUAI6wX6YX/V7H1IG0VkPG+EcmyCrXF/maxpZV562jdeacdOB3W2hhGcMKGiuhXoc3cJ7TYK5JljlTreJwgCygsN3gvk8/gBLk66MeMR3PdnBHO5GNQ2GrBebAWhVhAvraGXT4raXR14we5DIDnJ9PrqEHemIo6G1w=
Received: from LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::11)
 by CWLP265MB5675.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:57:07 +0000
Received: from LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6a13:bb8b:b1da:77e3]) by LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6a13:bb8b:b1da:77e3%6]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 10:57:06 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, Matt Coster
 <Matt.Coster@imgtec.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "airlied@gmail.com" <airlied@gmail.com>, "boris.brezillon@collabora.com"
 <boris.brezillon@collabora.com>, "loic.molinari@collabora.com"
 <loic.molinari@collabora.com>, "willy@infradead.org" <willy@infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH v3 6/6] drm/gem-shmem: Track folio accessed/dirty status
 in vmap
Thread-Topic: [PATCH v3 6/6] drm/gem-shmem: Track folio accessed/dirty status
 in vmap
Thread-Index: AQHcpkV7B2twTbyeiEevI5BaXzNo2Q==
Date: Wed, 25 Feb 2026 10:57:06 +0000
Message-ID: <d8d52d86fae1c3bb153cebb3ec154c84470804b8.camel@imgtec.com>
References: <20260209133241.238813-1-tzimmermann@suse.de>
 <20260209133241.238813-7-tzimmermann@suse.de>
In-Reply-To: <20260209133241.238813-7-tzimmermann@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8579:EE_|CWLP265MB5675:EE_
x-ms-office365-filtering-correlation-id: e58070d0-c78f-4632-096c-08de745c9dfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: iqb5sZWsBUWdy+qsIM0eMxoYIZBIN840ntLgwZ3g7ZiBFfFsssK0t65Eem7L5s9y9C8M+XHYnSyygKx6LExjZoLIlrsQs0d3jpYXp47CDwtiEp8psFcvJO6+6skMJibpCiqEY5Fpv5QTFjZTfUdAa1VDq/kFepLMyNMjGGsVEGpyLgl3q/VTQZ4ySzCPCW4sJU2TJ+iD7qMBDiFNBxkE7j5xIFpJkpIuNaFRsyIPDTjMAEPeJu5+4ZuWBySZJrJ56GVjUPOL/RbcVBg0SJEiC52Fd+ENJ9exELZdi20zvM3B72fAg/hncZKMl5xE2NBJ+Hot99gnvf62b9dAS+GsClKqGnDQMJLzYPuwVRCIJda9OQKp+SmYm1Ou8nUbZEANkLzfk4pkRYE+tSD8etz2lSZ87Nx1hj3FdcYOwkmmMg8qkHHdBlh50vA2eE0/WmRlm3UGz7UAzB8RHUC2n+Qdio//+fMYht34WwdaLSZ1UEMhhwTB2CGwXW+ySV2VvhQpWAY/aLExVTTd9wAg7cX4Binu0tYZTpnJEsuMzdsY7IlPu4MxPBrUKM5Qw1TyoJO1D5LRTuauWsSk96nmSjXYjhaXSal633OI4vxCbX+pVtmCmzmNfB4MdaPztUQEAkcMnJXXZsLbGkflCZ3E7hTOSVhDSV1SeaGx1QYbSBUScZLMd1XQzdAOKpzsv0HID45zfIOTFkeo3xcZy7XW0E+VQ7n1TWV2wsyFSPtErmJB8lUKFchMXseI+seiMvX9ZZP1IcnZySTJttiFFUemEJUNUjzFqzdRsfiZv3pNmOAf7kI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzAzUFlhaVdCQ204K3FXQXltbXN6VENua3ZLenEzL0RxSWNpSlR0eTJnUmh0?=
 =?utf-8?B?V3RjL3R0ZDJRdGo5TWNYSWR0VThqYUc4UjJsZ1dBNi9FdXJ5QU11ZWgwOEhl?=
 =?utf-8?B?YmNvS0N4SnBtanBReitRMStGYW1MNWdoQU9zRzFWN0swd3ZTZzRteUZmQXlF?=
 =?utf-8?B?b2dTR1hOWk1oTDNjWkdwY3FGSjBYN3hFbEhyUGZ3OHZEL1dpdGhUeWJzMndl?=
 =?utf-8?B?NkVxTzBYMy9PM08ySERCMVF1VW1OTVNmWXo1L2pudzdzay8yTWs4V1dxZ3c3?=
 =?utf-8?B?aStIekUvcWNrS2t6TjNHYmJDSHJKVHZSWCs5M2kxMG1xa0Vwd0ZFb3NpRHYw?=
 =?utf-8?B?QjllSGJabGZITm5IMzJmSkIwR1ZQSzVXeHFKMDhyd1MxaXpTZzdGd3puU0k4?=
 =?utf-8?B?Q2dWbExRQW1uNmVmMXNESnQ0QTJtcXpISHJOT1ZrdjdoVXZCaUdpaTNZNjVH?=
 =?utf-8?B?Y2NuamN3em9BRjl2ZytOUWNkeDZFeFg1bUUzNFpZdkZtd0dhOVlWaERPdy9S?=
 =?utf-8?B?M05EOURTbnNoRnJYUVN2bEltNlhLMUpMdVNtUmN0anMzSHdMQmtLT1k3ZjlS?=
 =?utf-8?B?cU1yVHBmellXVHRFamtTL1FCTWYvVHM5V0o0b2ZhT21LOEFVdjh6bm9qT1Ey?=
 =?utf-8?B?ZFpsZHdNQmdKVmk0TDJ5QnM4RlpHb2xPcGxpYytVRnUyWlNkZUJwWVF2Rnho?=
 =?utf-8?B?WHFXbnlvZ1ZQQjV5U3VrVjRaUHRyZEZubWNYT3VoV0pZK0llL3dOYW1mVWpN?=
 =?utf-8?B?WGdwMDI0TWhSd0VHcDgxOVZJRFNrV05EamlEYUVUMVk4RUF2QnA1MStpSDZv?=
 =?utf-8?B?RnQ2Mm9qM002a203cFdSUk5VYnl0MlRlNDlycitXVGkyVTRJVlJ3ZGNjSnVs?=
 =?utf-8?B?d1lVRXoyMmczSUpjZEdUUlpTOHlQekY5MXJ1MmtZZjlROFFGUXJlTTlYZHlS?=
 =?utf-8?B?UFpVVXlaZG9PYzdhK1VBb29JdnJXZXlKQkxKaGxPRGkwSUc2QzFucFRiSDYx?=
 =?utf-8?B?UTc4aHkxTGp0SURnR0Z4TDJsL2d1bUxTby9XdUZGckwveXQrWnRFaTEzYzlW?=
 =?utf-8?B?c1dOcUZCakhYRHhIZm1jSk9YMWZEcGpMc0RZN05XMlYrR1o2NGZrOFpRODBz?=
 =?utf-8?B?c3psU0d5QStQbk8rMURrWTNFNG9QZEtOTk5LbnhTZi9GM0NSOHR1Myt6elZ0?=
 =?utf-8?B?OXRTaDFIeUJCRTl5UUNtbGd3K1RiRktjTTBjbkJxQ0R1WitBQnJWaXk0cnU2?=
 =?utf-8?B?QzJNOGxQUHZ6RmpXQ2ppbWhwZ1NEa1lzQ0MvQ1lZZWxpbUl3akRrQmFGWWZw?=
 =?utf-8?B?VGRlU3A4OCttRWdERGI0VHpUUytmWVp2RGlmZEVTS2phUEVRUDVPUDFBeEZK?=
 =?utf-8?B?SUhFODRzbDIwdnIxNTdsY3o4cDJEQzFrS3hHQWRUSDJqUW1zem14NXMvZEQ5?=
 =?utf-8?B?UHVKY2hPcXd1cDBzbWN0UzBLUGVTMm9halJsRUZWdm5pOXlJUjArQVc2SHhZ?=
 =?utf-8?B?dlRvdGxteVFnd2pzR2NyaC92UDhWQ1dlcFlGc3FJcXZYQnJlSlBFaHIzSWNE?=
 =?utf-8?B?NlF5VkFpbjJVT1RRNHl0STl6ZG8wRFlSak16MW14czEzUzZjblBLOC9MMjJN?=
 =?utf-8?B?bmxaUTJWK1hqOFJnQURQOUdLbUw4bXZtUCt1UmZ2aWFOdWhBQWRNUEVRTEVF?=
 =?utf-8?B?Vmc2ZS9PcFZPK2o2VUNxcksrcEFkQkwwZEVSVUsrUFhobTI5K2MvQXlMeU82?=
 =?utf-8?B?cUZscVoyNnpZYkkwRmJEKzR1ZGcwZXd0YWZTVzFyRmNLdGNIK2hKblM0aGd6?=
 =?utf-8?B?VnhMRytCb1A4Q25pTUt0RnNTWGw3eVZxcXpaZTB1UEtCRzM4S0Y0NE5iT1Jj?=
 =?utf-8?B?ZGV3aEZDcGNjRzBpSWZwV1hwTENjZFJFTnBlckRvaktEN1BDME9SU2hXU2I1?=
 =?utf-8?B?UGREYVlpMnNSc2tYYkdYN1V0MFR6d2hoL3drOE9DUWdSdGVRMlJXWjlQQStR?=
 =?utf-8?B?ZUxrNWl4R2ZSL2lvalZLbnRSM0t5R29adWtCZWVRTW90QW9PckgvbW9iRXRt?=
 =?utf-8?B?eU5uSld3NVArdE8xc0FhbUZ2SHJHUXVVbVJzYVFDekhGSHFJNTFmMFJYWjlu?=
 =?utf-8?B?RFN3RHhGWmlNTTRpazc1Vk93b2FpUDRjSFlpeXR1NUtNcU55ZVAxM1hWM05G?=
 =?utf-8?B?cmlHbVBVR2t0bWdNWVd0dHA2OUh3QWZJWWxMemJHY1dweUgraXFPd1Z5eWR0?=
 =?utf-8?B?Q1BDYXBmZVpHNlJGYko4a3Fhc0l3eHZVUlJ1Yy9TUzRwbXZoTUptQkpOQzIv?=
 =?utf-8?B?WVgzS09VQmVTQ2VoWHVCT2NxTnBGTmtLVEpGUHV4Z1dVTjlCYkN4MVBRem80?=
 =?utf-8?Q?tRS4kDjC//yLpuNw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <165FB314CCB8994FB3C70EDA9B598406@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e58070d0-c78f-4632-096c-08de745c9dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2026 10:57:06.9488 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7OV3WznN07+AYxWVSq83JbK6WCaA7GdjSztOVZfyz6ZxzD2jY2Pv0fcGI1SP4ltP6U7tUOzBgtkdp9b3ainhUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5675
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNyBTYWx0ZWRfX2v2byLbFMK1d
 nhe8EK17eAIWquzpBz3uzO0uP3MxsKzfhBewn2CMZLiBSWcQyFwadIFdUfAk9NmTO9nnId9GSII
 //iwTaR8xzEe+Qx34z7iAsSDfsfdrRoM/OFxVp2do+/GFGx6XtnnLeZ3Ctl/ZK55YJVCw2ecrZv
 E1c5cgwUgWnetVB23NAmhpDDfTbznmOFQVDOdVHAZmrzjc3/vy6/kU0tSpYuHgmHRWjLKwKvk+w
 3VveJf0rtFDBLZNzcaYSSMsfumzvZD1hQ7Iq6fJ3gGEOqeDM4hkHMCrBP41GCJamVXcakZbMfkg
 KZlXP8y7+/j38Pk9F52UP/DE3B9vx1T/QKS0UfDWVSqb3HySolzvYnMQirfClnSNmI7x98knh/2
 Ri7FFsHNxUil+svr8pUDbkz3zbg3WcriladGmEvAMeFli07LQ+v+JPdgwCfbxjuoypVD2qt6Igb
 zf1mUXhfKVLs3wj0ubA==
X-Proofpoint-GUID: qH8b2aNupVJatOIq_TN_2hDNrvLRfmHn
X-Authority-Analysis: v=2.4 cv=TYSbdBQh c=1 sm=1 tr=0 ts=699ed585 cx=c_pps
 a=Z12jOdkJfn/qflD5pAsjZw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22 a=QX4gbG5DAAAA:8
 a=r_1tXGB3AAAA:8 a=rceyiVvF9YZcsutDZYgA:9 a=QEXdDO2ut3YA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: qH8b2aNupVJatOIq_TN_2hDNrvLRfmHn
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:Matt.Coster@imgtec.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:boris.brezillon@collabora.com,m:loic.molinari@collabora.com,m:willy@infradead.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,imgtec.com,ffwll.ch,gmail.com,collabora.com,infradead.org,kernel.org,linux.intel.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[Frank.Binns@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Binns@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:mid,imgtec.com:dkim,imgtec.com:email,suse.de:email,IMGTecCRM.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: DC5761964A4
X-Rspamd-Action: no action

SGkgVGhvbWFzLA0KDQpPbiBNb24sIDIwMjYtMDItMDkgYXQgMTQ6MjcgKzAxMDAsIFRob21hcyBa
aW1tZXJtYW5uIHdyb3RlOg0KPiBPbiBzdWNjZXNzZnVsIHZtYXAsIHNldCB0aGUgcGFnZV9tYXJr
X2FjY2Vzc2VkX29uX3B1dCBhbmQgX2RpcnR5X29uX3B1dA0KPiBmbGFncyBpbiB0aGUgZ2VtLXNo
bWVtIG9iamVjdC4gU2lnbmFscyB0aGF0IHRoZSBjb250YWluZWQgcGFnZXMgcmVxdWlyZQ0KPiBM
UlUgYW5kIGRpcnR5IHRyYWNraW5nIHdoZW4gdGhleSBhcmUgYmVpbmcgcmVsZWFzZWQgYmFjayB0
byBTSE1FTS4gQ2xlYXINCj4gdGhlc2UgZmxhZ3Mgb24gcHV0LCBzbyB0aGF0IHRoZSBidWZmZXIg
cmVtYWlucyBxdWlldCB1bnRpbCB0aGUgbmV4dCBjYWxsDQo+IHRvIHZtYXAuIFRoZXJlJ3Mgbm8g
bWVhbnMgb2YgaGFuZGxpbmcgZGlydHkgc3RhdHVzIGluIHZtYXAgYXMgdGhlcmUncyBubw0KPiB3
cml0ZS1vbmx5IG1hcHBpbmcgYXZhaWxhYmxlLg0KPiANCj4gQm90aCBmbGFncywgX2FjY2Vzc2Vk
X29uX3B1dCBhbmQgX2RpcnR5X29uX3B1dCwgaGF2ZSBhbHdheXMgYmVlbiBwYXJ0IG9mDQo+IHRo
ZSBnZW0tc2htZW0gb2JqZWN0LCBidXQgbmV2ZXIgdXNlZCBtdWNoLiBTbyBtb3N0IGRyaXZlcnMg
ZGlkIG5vdCB0cmFjaw0KPiB0aGUgcGFnZSBzdGF0dXMgY29ycmVjdGx5Lg0KPiANCj4gT25seSB0
aGUgdjNkIGFuZCBpbWFnaW5hdGlvbiBkcml2ZXJzIG1ha2UgbGltaXRlZCB1c2Ugb2YgX2RpcnR5
X29uX3B1dC4gSW4NCj4gdGhlIGNhc2Ugb2YgaW1hZ2luYXRpb24sIG1vdmUgdGhlIGZsYWcgc2V0
dGluZyBmcm9tIGluaXQgdG8gY2xlYW51cC4gVGhpcw0KPiBlbnN1cmVzIHdyaXRlYmFjayBvZiBt
b2RpZmllZCBwYWdlcyBidXQgZG9lcyBub3QgaW50ZXJmZXJlIHdpdGggdGhlDQo+IGludGVybmFs
IHZtYXAvdnVubWFwIGNhbGxzLiBWM2QgYWxyZWFkeSBpbXBsZW1lbnRzIHRoaXMgYmVoYXZpb3Vy
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+IFJldmlld2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPiAjIGdlbS1zaG1lbQ0KDQpUaGUgY2hhbmdlIHRvIHRoZSBpbWFnaW5hdGlv
biBkcml2ZXIgaXM6DQoNCkFja2VkLWJ5OiBGcmFuayBCaW5ucyA8ZnJhbmsuYmlubnNAaW1ndGVj
LmNvbT4NClRlc3RlZC1ieTogRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoN
ClRoYW5rcw0KRnJhbmsNCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVt
X2hlbHBlci5jIHwgNCArKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2dl
bS5jICB8IDYgKysrKy0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9z
aG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jDQo+
IGluZGV4IDBjODZhZDQwYTA0OS4uZGRhOWFmOWJmNWIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYw0KPiBAQCAtMjY1LDYgKzI2NSw4IEBAIHZvaWQgZHJtX2dl
bV9zaG1lbV9wdXRfcGFnZXNfbG9ja2VkKHN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2ht
ZW0pDQo+ICAJCQkJICBzaG1lbS0+cGFnZXNfbWFya19kaXJ0eV9vbl9wdXQsDQo+ICAJCQkJICBz
aG1lbS0+cGFnZXNfbWFya19hY2Nlc3NlZF9vbl9wdXQpOw0KPiAgCQlzaG1lbS0+cGFnZXMgPSBO
VUxMOw0KPiArCQlzaG1lbS0+cGFnZXNfbWFya19hY2Nlc3NlZF9vbl9wdXQgPSBmYWxzZTsNCj4g
KwkJc2htZW0tPnBhZ2VzX21hcmtfZGlydHlfb25fcHV0ID0gZmFsc2U7DQo+ICAJfQ0KPiAgfQ0K
PiAgRVhQT1JUX1NZTUJPTF9HUEwoZHJtX2dlbV9zaG1lbV9wdXRfcGFnZXNfbG9ja2VkKTsNCj4g
QEAgLTM5Nyw2ICszOTksOCBAQCBpbnQgZHJtX2dlbV9zaG1lbV92bWFwX2xvY2tlZChzdHJ1Y3Qg
ZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtLA0KPiAgCQl9IGVsc2Ugew0KPiAgCQkJaW9zeXNf
bWFwX3NldF92YWRkcihtYXAsIHNobWVtLT52YWRkcik7DQo+ICAJCQlyZWZjb3VudF9zZXQoJnNo
bWVtLT52bWFwX3VzZV9jb3VudCwgMSk7DQo+ICsJCQlzaG1lbS0+cGFnZXNfbWFya19hY2Nlc3Nl
ZF9vbl9wdXQgPSB0cnVlOw0KPiArCQkJc2htZW0tPnBhZ2VzX21hcmtfZGlydHlfb25fcHV0ID0g
dHJ1ZTsNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
Z2VtLmMNCj4gaW5kZXggYzA3YzlhOTE1MTkwLi4zMDdiMDJjOTE2ZDQgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZ2VtLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9nZW0uYw0KPiBAQCAtMjUsNyArMjUsMTAgQEANCj4gIA0K
PiAgc3RhdGljIHZvaWQgcHZyX2dlbV9vYmplY3RfZnJlZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikNCj4gIHsNCj4gLQlkcm1fZ2VtX3NobWVtX29iamVjdF9mcmVlKG9iaik7DQo+ICsJc3Ry
dWN0IGRybV9nZW1fc2htZW1fb2JqZWN0ICpzaG1lbV9vYmogPSB0b19kcm1fZ2VtX3NobWVtX29i
aihvYmopOw0KPiArDQo+ICsJc2htZW1fb2JqLT5wYWdlc19tYXJrX2RpcnR5X29uX3B1dCA9IHRy
dWU7DQo+ICsJZHJtX2dlbV9zaG1lbV9mcmVlKHNobWVtX29iaik7DQo+ICB9DQo+ICANCj4gIHN0
YXRpYyBzdHJ1Y3QgZG1hX2J1ZiAqcHZyX2dlbV9leHBvcnQoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmosIGludCBmbGFncykNCj4gQEAgLTM2Myw3ICszNjYsNiBAQCBwdnJfZ2VtX29iamVjdF9j
cmVhdGUoc3RydWN0IHB2cl9kZXZpY2UgKnB2cl9kZXYsIHNpemVfdCBzaXplLCB1NjQgZmxhZ3Mp
DQo+ICAJaWYgKElTX0VSUihzaG1lbV9vYmopKQ0KPiAgCQlyZXR1cm4gRVJSX0NBU1Qoc2htZW1f
b2JqKTsNCj4gIA0KPiAtCXNobWVtX29iai0+cGFnZXNfbWFya19kaXJ0eV9vbl9wdXQgPSB0cnVl
Ow0KPiAgCXNobWVtX29iai0+bWFwX3djID0gIShmbGFncyAmIFBWUl9CT19DUFVfQ0FDSEVEKTsN
Cj4gIAlwdnJfb2JqID0gc2htZW1fZ2VtX3RvX3B2cl9nZW0oc2htZW1fb2JqKTsNCj4gIAlwdnJf
b2JqLT5mbGFncyA9IGZsYWdzOw0K

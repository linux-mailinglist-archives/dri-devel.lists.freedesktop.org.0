Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNVsNXhmpmljPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 05:41:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1931E8EA6
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 05:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3CE10E0C7;
	Tue,  3 Mar 2026 04:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QE67BMyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E856710E0C7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 04:41:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pm2ccYKdZ05SwPHarT/0iIu2PwvHIp2iXi/UNIk1TVty7pJjbwsCmQZ67uOw34/unVuXEJr1mWM8wEjuljd0RSJfzCztM4E9Bo+1/niOE5z45+yRmOiB2Rhniuo55i2H9ut6yxOARpxQUuC//lsF2CBRAqCSYj+qi1jnvgRLNWjpqpGGccK+uzdbZ7JLV4/noNdynhT0sJSnW/kwjUZnQLncE6JAuiZjY7ggSz4Gt2jfWBsabQx8nxteRQ61qzMdFzJoZfU6fhvVtOWzV6uZkcgh8gdxq69ARVvdFSUW614TcHbd4jz5IjGIUCfzMXmBRy81zBTSsGmSkcxq9Qu2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/j9Skf7OorPEl4IqbwMTmjYr7P0SBhUq/6nqb1gM8c=;
 b=RrDguMIgRg8/FgflQ6m6JPW9MROdI/XAJbIbT5uc496r5vVjFF8Xm3mzyy1DrUEYa8WwShGjwKHuJmXmn71BshjoLQXYwVT8llN117SH6cT8za9+yTJTUdE78aS/MnyIqYDU1ATjgyUuPtZhwv/Bbh3N5gDW0hy9+KilFQCVeLDcPB6rNew0pov7MWgFWosoOwM8cz70pcsScvcOVPP3IRjwwgN6BTYm/mw6+Y1Ie2/dSwNfKPzpy3WVtDguzFhiBzQrvELT4zifE8zlbzc7dIe+x1xqsKsxcvdTixbBSqK2lOxSOKHUnkMNlocij2HHhA6q+dpPujdHxx2WRCK3vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/j9Skf7OorPEl4IqbwMTmjYr7P0SBhUq/6nqb1gM8c=;
 b=QE67BMyMkJnHySvRpjw9fxiEOFM1+WT8zegEFIsCSU0tAKzleqmwqtuoYLVk2Atg2EGt60zQSUzJYvBF9MI/K1FtphO5xwlwsDgow7F3iaw6DsDWcBSiojzqZJaxHySrwd12BbBwueQNcgrqoSlXeRfK0Amk3pARZRlsznlQU1u0LYg9LdpZT7Zelk7Q0+/+GWzkfjAgzgaaXw1Eg9NwgFHmpFiRj7J+FN2noy0Ge9v9MYiz946Ox169Y8VtaMKgqtn2J6C0b/ZsseuJbuMVblMIB1Nph1QNCx+5FB2oaLpQ2f1WlTDQVL2ZcsyrQhsbze9x/KmvnjcRqnJPNxS5HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 04:41:21 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 04:41:21 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: dri-devel@lists.freedesktop.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH RESEND] drm/tegra: dp: fix kernel-doc warnings in dp.h
Date: Tue, 03 Mar 2026 13:41:17 +0900
Message-ID: <4932648.mvXUDI8C0e@senjougahara>
In-Reply-To: <20260219215535.469520-1-rdunlap@infradead.org>
References: <20260219215535.469520-1-rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 252b1f38-79b9-4cca-56ce-08de78df1dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: xFMUYdDeEnmhMSsAc7Jg+DI8uU7PYfOlU7JzGBFJzHZjIzoTNiSpqh90lpCU84mmzhGYMVJN7MBqbx53DshfEQTgZzTkQZAgNbNqIjhwr1cRfGG5E7bfmbhFXKf7ESQ13UiSrovDtotUR58hr3F/w0462hrcktoPFtW4uzcpKKnGfYAcsB0/MGSWeJem6WbOQ+wpgDE/M+3xFeJPRv0sEgCnhcHnWA0HoRDGaBX9m1IbeMbDhKTLJxVaiplMKGaW/kp/8BlLlJnm+ajP52hAf84ClhJNrppleK9OmHXsZ3jkQTeadPRWtmBXqIC40JSY+qlHGFeSC/03Av1tc73uKsHCJqAar/1TVRFaYY6Pkyhe/Q+OD4wgNpoDdWSUB4LPAiS6Nyadh0uMG1eERU+JErx6D89VULc5DeJ9jlJ2jWZVwC7VtqTk2G4OLbzAjp9DpUkGVV8wv0QOUHzbSo+0/N5/zh3BDtgbrtJjkSJafU9kBD7TafFTPVMuxlv0yA+57aF+n8U2GtAAO5n/kCzGoiDMUOEmle8w8wN2nxIzduXKxoF/0PYUvNg5QN35ocg4vguKHskt568oTHDXAHzt36aoHO6FL1cUVvN+H4HlJAriWK5IQubPhDhX2BIjXPbqldMucT4tFKYTsCql/v3DaojHAeqQXkQdbowq9GWvake9RZTIQ7qzOngmBFXD98NXSiVmLevmeGoekg9oEK3tJWMipEz/VUzJJc967/FblYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBYakNHU2gwM21jaG1FT0Y3MVVCV05veUhMYk9RTkluTlYwbzVWZlhPWkZl?=
 =?utf-8?B?ZHJCakNNT1oxV1NDWEVyMlFhRmFDRWMwbFV6VHAvdVZnaFNIU2VXUjhOL21F?=
 =?utf-8?B?azlMWkVsNnlQSHpPMXlacWEycmlEbnltbUNqeGFYYUo2NnBWRTRQMmZlbXZY?=
 =?utf-8?B?Z08zejhjOVhEb0VtZWtIL3BLcWNwWUcxcWhmZGRSd2xQV1hQOEJ2YXI1U0xK?=
 =?utf-8?B?Z0VhUnNVOS9jWFljM2c0WkdzbmpHd29mNmxZR0hDU2hjb0VNakF2eldKNFNm?=
 =?utf-8?B?RGZlNmwvUkx2ejZxMXQvaCtPbjNyeG4yUHE5SzUzRkNHck9JcHdhUVc5MTVx?=
 =?utf-8?B?L1pubmxWV25nZFdYWWtqQnBzSDZDMUlrN1dsU3liMGZFWnVDdFp6QS9NWHVR?=
 =?utf-8?B?VkFUVFdLdmI2TWtNa0NzUzBBV2psakR4VDY1NzdyUzhFQ2xWc1VDSHpJQ0Q3?=
 =?utf-8?B?WC94RmxiRVdsaG1LblFuUUdRazVZV1JjSzNaS2tNVVBIdlg1YnU3M3l2b1g5?=
 =?utf-8?B?emJadjRIVXRzWFFZSThNcVh0L1NMNGNEd2pLbml6QXRMamtEMmNKdEd4bXVv?=
 =?utf-8?B?eFFsOUliaXBJaTE5ZWNncmpFQU9jdTdlU2lNSkltanUzNC80a3pVS0R4YXd0?=
 =?utf-8?B?Q0RIajhTNFFzRHVwSXMyRHpLL2ZYRlk2YlpjSEd2N3hNS0MrcUtSQnJDVUhs?=
 =?utf-8?B?eTV4clJuZ0RPRmNRS1lJV3RBb3FSMWwvM1lPSXl2Q1luanZUVzFueEtNam1I?=
 =?utf-8?B?ZllkWHYzUEJqSG1pZWJUU3hxQUh4bHl1Rk5GT0ZEZ1gxMGVlRi9tWlJTUWJq?=
 =?utf-8?B?M1ozYml4enlCd1ZDODdvZGN0WU8yREhQZ1M3aG9XT3NHcjZUM2dGU1Zhbzln?=
 =?utf-8?B?TFVGcUgyM0V4NFlDZFlrbWxERkM0WGR4R3hobmxDWTZSWDdQdTR5cEZaVFZ5?=
 =?utf-8?B?R1VUMEdjUjVEa0RVTGJHbmN4bWxEL3h0MWtRVGVMZ2hwWFN0L3ErZlk1L1k0?=
 =?utf-8?B?dGZ1akhDVEIrdURiTG9oQ2JRNGJlV3hNU0ZUd08xOGhQcXZrMXBZRFlIc0hD?=
 =?utf-8?B?V2NuMm80SHRBOWRsWlR1dU4rOFFyUFNUU0FuY29GWnU2WGt5V3RNVGRRRThk?=
 =?utf-8?B?bXVIN0Fpc25mRkVxL2JJWjV3MmpZbWxjZnhXQ0JXMjM4aXFZeU5TaktsZkJH?=
 =?utf-8?B?ODUrdk4vUitjRlYrTzY5bFZuMklDWUlrM2c4OEpzbDNDS1gyUDkxNmhidml6?=
 =?utf-8?B?bjVpZ0g1SjdqK1pzUjVrbTQwcWhMUnB6b0ZBMXdjdzJiOG1NV3B0Y2xUZTVk?=
 =?utf-8?B?amNyYkpnMzhiK2VMTWp4VU1SaGRYMkpZc3RkS0ZteTE0eVJmYnRrQmwra0dZ?=
 =?utf-8?B?blZ0N2N3VUNNNzZnWG4vSnEwQjJ3VE4yZUlNUWpwMnBaMmUyNFlBeWdnTVF4?=
 =?utf-8?B?bVB1VSt1K1V5bTZmU2EyMlRBZVB3TGwyaFh6REZXcVBXOVNsUzE4c0pLRG83?=
 =?utf-8?B?ZUh0eXNqbGtYM01qSlp4eWVHcTY4KzkxNDhjZzBwcG42NUJlYzY5NE8yWGk2?=
 =?utf-8?B?Z2F5a3lzSzdXd0lUNU9pZ3VQcU55dFBtNXdCRW1UT1Rjd2dVclI4OHRYQzdS?=
 =?utf-8?B?SVcwRkdFUjZ1K2JmSTVlSUhmVmIzS0VhQlZobnFsT1JiamxTaStZc2xkK09H?=
 =?utf-8?B?N0tGbnlEbTNaWlN0SXFVblk0bXhkbVhualU0WTEyMFpSVkFBU0ZvNjl3M0Jv?=
 =?utf-8?B?ZnpaS05pbWtBRXZNbkluNmZuTkU1akpLenZOOU1DKzJvU1RmbDhNU0RyT2tY?=
 =?utf-8?B?VGxoTkZtcVFEZExWTmFJNEhpTmEzWlVUcHNsY080eHFCbkhWQ0lVaDdVWXNI?=
 =?utf-8?B?ZGtTNGgzNkE0bGxCWDJxV1ArYVpGMjl2Vk0zbnpGa0dUY2I3OWhxWXZaTWxX?=
 =?utf-8?B?K2hORS9QbDNDNWZtL3FIb2Z6a0tSVEV1VXVHNndRL0ZMTmh0VFlCTjJ4YkRZ?=
 =?utf-8?B?TUhyK2NtRU5FTm9YL2lNcTRxUWFrbWpXbmUreUF1QzE1QUV4T0dZRGxqcWhI?=
 =?utf-8?B?WS9OZkozOS9IdW5vays0RE9LcHBqZkxGSFVTS3kxSHdaVUIyb0ZrTWdjSDZM?=
 =?utf-8?B?ODNpUjFSRUxzS0c2cHVYUGIwWnlwOW5ENk1YMVUxeWRFWnl3K0R3MlVBODBj?=
 =?utf-8?B?cmU4R3V0dkJsQS9CdVRvZ1FFaGZRUEttK2JCZkw4cytGaUl3azQ2UHVJZ3E5?=
 =?utf-8?B?QlhXZTZpdlQ4WHpHMUJlWHRWdWt5SmVrV1ovYjB4NXMwOFdxUVNzMEpFeTVL?=
 =?utf-8?B?UkpMd1hCdUpseUsvUnRwd0l6NE5rYnlaSzBHWnZvK3N3MnpjWTJVWGZRUisz?=
 =?utf-8?Q?WQrElZcE6CASQ21Mo284Wl4LoLp88GMgw+/if6ZxjwSAY?=
X-MS-Exchange-AntiSpam-MessageData-1: 7O9Ox3Qm0BFQQA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 252b1f38-79b9-4cca-56ce-08de78df1dfe
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 04:41:21.1411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jivKBWuz6XnTWe1L2/WKzBH10Z7uOs6Do97wxNpdrc7Zqba0lpUTyCW3zlZCsY21kkrXdPoZ14GDgBDvPR2A0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966
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
X-Rspamd-Queue-Id: 3A1931E8EA6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,linux.intel.com,kernel.org,suse.de,gmail.com,vger.kernel.org,nvidia.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,Nvidia.com:dkim,suse.de:email,ffwll.ch:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:email,infradead.org:email]
X-Rspamd-Action: no action

On Friday, February 20, 2026 6:55=E2=80=AFAM Randy Dunlap wrote:
> Use correct kernel-doc format and add missing nested struct entries to
> eliminate kernel-doc warnings:
>=20
> Warning: drivers/gpu/drm/tegra/dp.h:28 Incorrect use of kernel-doc
> format: * tps3_supported:
> Warning: drivers/gpu/drm/tegra/dp.h:54 struct member 'tps3_supported'
>  not described in 'drm_dp_link_caps'
> dp.h:73: warning: Function parameter or struct member 'apply_training'
> not described in 'drm_dp_link_ops'
> dp.h:73: warning: Function parameter or struct member 'configure'
>  not described in 'drm_dp_link_ops'
> dp.h:160: warning: Excess struct member 'cr' description in
> 'drm_dp_link'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  drivers/gpu/drm/tegra/dp.h |   12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>=20
> --- linux-next-20260218.orig/drivers/gpu/drm/tegra/dp.h
> +++ linux-next-20260218/drivers/gpu/drm/tegra/dp.h
> @@ -26,7 +26,7 @@ struct drm_dp_link_caps {
>  	bool enhanced_framing;
>=20
>  	/**
> -	 * tps3_supported:
> +	 * @tps3_supported:
>  	 *
>  	 * training pattern sequence 3 supported for equalization
>  	 */
> @@ -62,12 +62,12 @@ void drm_dp_link_caps_copy(struct drm_dp
>   */
>  struct drm_dp_link_ops {
>  	/**
> -	 * @apply_training:
> +	 * @apply_training: apply the link training
>  	 */
>  	int (*apply_training)(struct drm_dp_link *link);
>=20
>  	/**
> -	 * @configure:
> +	 * @configure: configure the DP link
>  	 */
>  	int (*configure)(struct drm_dp_link *link);
>  };
> @@ -113,6 +113,8 @@ struct drm_dp_link_train {
>   * @max_lanes: maximum number of lanes supported on the link
>   * @caps: capabilities supported on the link (see &drm_dp_link_caps)
>   * @aux_rd_interval: AUX read interval to use for training (in
> microseconds) + * @aux_rd_interval.cr: clock recovery read interval
> + * @aux_rd_interval.ce: channel equalization read interval
>   * @edp: eDP revision (0x11: eDP 1.1, 0x12: eDP 1.2, ...)
>   * @rate: currently configured link rate
>   * @lanes: currently configured number of lanes
> @@ -126,10 +128,6 @@ struct drm_dp_link {
>=20
>  	struct drm_dp_link_caps caps;
>=20
> -	/**
> -	 * @cr: clock recovery read interval
> -	 * @ce: channel equalization read interval
> -	 */
>  	struct {
>  		unsigned int cr;
>  		unsigned int ce;

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>





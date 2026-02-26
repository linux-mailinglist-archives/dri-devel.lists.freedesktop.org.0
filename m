Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC89NL8yoGmLgAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DA81A54BD
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A486A10E8F7;
	Thu, 26 Feb 2026 11:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X4fNARNt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010046.outbound.protection.outlook.com
 [52.101.193.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6D610E907;
 Thu, 26 Feb 2026 11:47:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEKVWR0VnwjLmrrYKCSAJUJn8Fkv6TOFUq7gUhWXyJIPKLPoOO4LF3XLK28mMlZ6aFzonvw4VKfrPgnQmPg5QNnyfNtl2G3puUzB3iucyInYHLWQTllwtumAG3UntR4lOQbjAcPXYNWgWVxnO8Ffx/dq3uhFcIgpe8QAdEDhjG86QG//wovoGAPFqGubLKO3sHm+rWJDJF5U2E2WSRC7pFqlnW9mfdW1OgMN+0qouUr4jqtXej9F8RIpNQu5RyJI5HST0TusiSO6XHvcbyFCHvNW4GpJDXdtsbCmAG6VHp/1XjfsciO/XGO1Ri+HB19DKCel6fDXave0v6BES8+69g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xk0cB3ejg6x+g8QPLVKlfP5LVx9IUWJ+gsFaeJ3sRc=;
 b=qg2U/xazEujnmVKBIt5fMdabYAceYoS0V/QvfAPQ0+obl6bioIxJzj8cRa1LF6Frcu+tIwyVw+w6pGPFIJreIYs/WC5quOKZKZfQk/KFwGdoabcHPp5Rzq1m8evT58D011j8T52Va0DNZGjDyLAkHgk5N7qsVrtqUj2a4N66waAX2YFwIpG2z0cJq0rexKMiTl9OinUjRoHhnYt0Ge9chbALTfAUAZVSB8QGq669HyxQNFz4WGYZy0DHUS7bVkUs6DACw5eyiRHIQI/xxbBS7Pu0cl8efggUi1GnB/WUJpDsdyAHb4rtEFHCBuMAK5yb/nVm6y+5H0ooUR7b2b7VTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xk0cB3ejg6x+g8QPLVKlfP5LVx9IUWJ+gsFaeJ3sRc=;
 b=X4fNARNt/ANCGgc7ALaU+7LhDebE5xVQDH1nGpmTqDVmZhIp5SRREm6O8U9OTmZ9vEFLlVqrCFvSwDX1ls8zYGKSGnvLa/fN9Gy9HznGssdbWAd4F1ts7ZsEOTp3x8bKzbXHu48LdfCb0kAra7lNiGCAe+1WlmxOOAd0kGfTuwcz75P5nK9Ky3zhMu3lUcVumjoGwxz851R5hlwIT4k/a9UbcTq3cCRFmZN2JcPrPDyZ3o42w8xbIH16G5SOzvSwIoBm6hcQCqD1h2U4NyI5Owy40jceOFIXINMR8rvp2oNh3cvDhyZtNkh8IL1/EiYkktRAM5liObcwhYzz0Ne9/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH8PR12MB7112.namprd12.prod.outlook.com (2603:10b6:510:22c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Thu, 26 Feb
 2026 11:47:00 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 11:47:00 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 20:45:37 +0900
Subject: [PATCH v3 5/9] gpu: nova-core: gsp: clarify invariant on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-continuation-v3-5-572ab9916766@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH8PR12MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: cec7b3f8-2a4d-4fec-c61a-08de752cc0b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: E7ifM75NDmgpnsuFAErQKXUxW3w6bVfupHxbbOGEIOT0tfRoOViOM9i7ymgTaYVHBRDt/wVrDvzt+impURif1tsy8caTpjl7KZ+QyRWYpp+y3FYJzjRNOn/GT295I1wmsO8w3odekKYQtqA+6B4Pi1Oe76gukoaPi3B6L0WfGSBXdKCzync++J4AfxbfwQGK64ow+Q2dnf7bQUiVvFBAx/9pX5PZj4piL8X5MNpchsrUY9bUrpUitmsSkG/LSHYmzGR52EUrBpNbdjsA/ifyDcy3moWN3+Dts61C078ZM+5rC8u2dEvOKaiXyeCByvTEJuwGwK1qahbbHRx+2R1Mcr2kV49AlQ5R5eCaWWE9PEnqwZGHAshtTYDaYN2TZfONyiaLsfDGGnWpUMY2tA/hkTE3rP8pcK1KOMOZyLEJlwCbK1Wka0eeuk/HTXzXQyFe8rIsdclyHqNRMmtPstc6ZDfh8lV7+6T0XtX3d5Ur7bAF03wJnB2ZHBSZw47UgHAhY9iyNRrJqaroT9/mFc7qeNZ3Rf4aEoNFZpGYdqRL4DtrrVOK/DqwpOQECQtJm54AAQt4Yxw5O+Wc5OU8cmLs2cJ1sL7oyYT8ow0+2XFmNLfg5ybL1RQjTh+Revi7G+KxRMx9cYLTmQ6laAr0x3A8Auj1V+kMOQg01KfsZKnE3aQoHAZCLdMRkye9phkbDKT8qJpFc4q4khchSTLvZi6F5DNhOXqEfWgHXnjaiCf5op9LwuxtOKCDtYJkq8DzQQ0naYzaAkRhhjWUcunQAhT6qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3dsL3luYy83ZmRnTkFsTjE2dXdqVnJQMjdZNC9Oc3VjeHFNdTlWSTVnU1Q4?=
 =?utf-8?B?ckYwZm1ESlJpSDVSR0ZzaCt5KzdLZm9wSVQ2Kzdab0phL0hiekRQM2RoNUhU?=
 =?utf-8?B?QVkwYXNmQkExRk1mU1VCQzVYSVhCZmtURWR1SnBuRGVOTklBdmJjRFpodEVB?=
 =?utf-8?B?aStEaVpaU3ZzclQ0VTNUeUN0VGVqTTF4NWxsUFd0Y0ZSWlpBc05LWldaTWhF?=
 =?utf-8?B?QkRsTkNVWm9jUVBrdktOZHU3dGs2NStwQXZpK2QwZUZyMVoxaGI3ditCR0d5?=
 =?utf-8?B?blh5RDhESFFVUE1ZazRKRmV2WlFYemlycC9nZ1J0QkVRY0haSkErY0NJaFJU?=
 =?utf-8?B?Y1NzYnJTY0VrT3lYK3RGQUZYYWh0eXFJQUVKL3BjdWE2V0RxNEMybUgwaHVs?=
 =?utf-8?B?K1ZJSENJQ0UrRytFejk1RFNPSGFYOWMreDhRYTFjcXRyWVZlQk5sVERSWHMr?=
 =?utf-8?B?UTRiUkJVaXBkN05WTkxRdWozR1lxRlg5MnY2NzZ4b0pDTlhOU3Q3NGlseXRJ?=
 =?utf-8?B?SlVJb01LWUFPQ2tpY296dHBTWEc3SExDcHNrMzhPdnIwMFV2Tit2ZDdYL21X?=
 =?utf-8?B?bk1HVDBiOWtoM2FXbUlQZWR0aEpqc3NqaTFFRGZYeEVPMTBDNVdUWUYyRUxC?=
 =?utf-8?B?ekhPQzhScjdxM0xZMzUrMHdKZGhDSWpUNUxsc2ZvdlZseUxhNWlRYUZiRW5B?=
 =?utf-8?B?UlFWUGcraG5ndUFjcU9iT1MwSjFiMW8vZW4yU3Fva0NKMkUrWVBQejVndURs?=
 =?utf-8?B?NUU4K0UrT0kzZU90REtrQ1NweFlnRDMvWlhwbXFmT2lCMWZSZUxEVm00dm9s?=
 =?utf-8?B?Qll4bUNoZHRZNlFZa0FBUGk0RFVHYXZpcktWS0pDR3cvUlR4ZHVhRUp4b1NF?=
 =?utf-8?B?SkFwNHBIaU5aYzhsb2hjVzNhYXZoaVBMZHV3L1ZrbDZ4L1B1WVJWa0w2dWg0?=
 =?utf-8?B?OUdkRzlwM1VvTXY2ZE1sRE1aZnJXSmRDVk1MUmlUZFVoYmFhTXBxQ0dBcmdn?=
 =?utf-8?B?aktVbzVwcElKdmg1UnlueFE1VXRTbytLSW4reTJ1OU9WYUNheGV6ak5meExr?=
 =?utf-8?B?UmlJUzc0TTZ5Z2wvNkl4Ym9PRzFwNW5iNEh3RzMvZUFMN2NTNjBvMkpFN0FX?=
 =?utf-8?B?djJvTVJ4MnczSUZFZ3N2SjQzMk5UY1g0bFlISDhBYzI2aDJLQU50QzNyamN3?=
 =?utf-8?B?bENBQUg3TlkwSWxJNDVTcS8vcHAyRmh4RjdRSHFXV0hGQWRUN2t4SktSekVM?=
 =?utf-8?B?UHBWVjZudnREMTdIaVYzRUNyUDBiN0taZExSb2JJRk1vWmdrRUhrVk01eW1U?=
 =?utf-8?B?a2tqNzNtNkdORitnN3l1cGNLWmNoQ1FPS3h1Ui8vd2EwaVlSeG5vRXFMa20r?=
 =?utf-8?B?cURaaXdlMmdPTzdaMDRRYjRLcGNwVFFwS2Q2OVdBNFdJRXhIYjVybkFwdEla?=
 =?utf-8?B?QzREQzNEeWJEOWNlS1g5RDl6and2cEh6aktNeE1jY3VLL3BuemhaRFgxT1Vq?=
 =?utf-8?B?TVFnR1pxWE4xYW5vSHUxcmVZTHZJOXFrNjcxM2lzQnFyYXlGaHgvcHp4Zzla?=
 =?utf-8?B?bDJaM2Z0bG1meW5pdmQ4RmhjL3VRam02WmlLaU5jMDlEQTZCTERScktzOWRS?=
 =?utf-8?B?MFFmbWxxZFpPVExKOFNkMW53REJNTGdxQU5VdCtSRXFYZ1ExWklaek8rK0Ft?=
 =?utf-8?B?Z0svVVlRUnh5aWV5V3U4NDVVMjdwOFVyc0kvNThGQ25xY2U3TkJBZE5Jb2dL?=
 =?utf-8?B?Q2RMVjQ0VlNFYUFGVS94cExlb2tXUEdtazBOYzFLc0dnaFBjV2g0OGY2bVNI?=
 =?utf-8?B?dG1EMjdxTzZPbG1uYTlYZGF4dXZkUkxkU3J0alZWNmV4alk5SitOYmZSRTBU?=
 =?utf-8?B?aVQyNHIrSDN4UXJybm11SXY1QTBZVzVkaUo4ZjU3ajhvQVJBV043a2ovYVVs?=
 =?utf-8?B?dHVYTUp1VVFnR0lkdE9XWVN0aElZY2xDbXB0N3VaeHArK3F1NzNmaTZMa0pl?=
 =?utf-8?B?RnB0WnY1VlJCaEd1ZXFhVldzdkQzM1JsdE9WazFLZXQyc3Q4dDVsbHdYQ0lo?=
 =?utf-8?B?anlveVZJRUs0SlpEempaWWhvVmRFWkc3WGEra2J4SGI1ZlNrc3RQNGdwOEhy?=
 =?utf-8?B?Q2h4SFNoRUpzcGl0L1JqVHZCemEzdEJWb1VXbjZNWmdnK2xwVHhHL2pDVkJP?=
 =?utf-8?B?WDVTcGRIczBuQ1FsOW9sN2RFd0RMdFgvamNqQUwvUVU4T0grSVFpYWhyRFV6?=
 =?utf-8?B?K2dHRkdjNmtwR2hIYXBUektSdlJ4ZTBoRHJrZ3RsZ3lMWkNGQzZ4TVo4Tlpv?=
 =?utf-8?B?SnlyVUNDM3FOeEk5RVkweHBieUxCMUJDNjdzTjF4a2hueE5BbGxtUWxCRFlk?=
 =?utf-8?Q?wpurxY/V2voVr3Ob/8V1k8ZgPWrnRr2+1KVIeDXBOmAFn?=
X-MS-Exchange-AntiSpam-MessageData-1: VVDrCZLkFBxOag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec7b3f8-2a4d-4fec-c61a-08de752cc0b3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:47:00.6488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buBWyCUwBPC55P5YAq1Qcnm4zrUAuyF8zX6jUqPnqzk6RjPqWA9f428SUdcVIrdcxdFVDiTUTTCofLQJBxlaJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7112
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 80DA81A54BD
X-Rspamd-Action: no action

Clarify why using only the first returned slice from allocate_command
for the message headers is okay.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3c2652be74bf..3653212efa7a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -531,7 +531,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             .gsp_mem
             .allocate_command(command_size, Delta::from_secs(1))?;
 
-        // Extract area for the command itself.
+        // Extract area for the command itself. The GSP message header and the command header
+        // together are guaranteed to fit entirely into a single page, so it's ok to only look
+        // at `dst.contents.0` here.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.

-- 
2.53.0


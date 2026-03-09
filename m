Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y7VzOdVRrmkMCQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:51:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D71A233BC2
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 05:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADB910E0DB;
	Mon,  9 Mar 2026 04:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sjJMyKCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012028.outbound.protection.outlook.com
 [40.93.195.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B38B10E0DB;
 Mon,  9 Mar 2026 04:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofvJwkruZEiibr7m0D7kHUWx2/mjQ/I3oagRiGHjmZHhBkHd90XQcD1DLAiqo5aOIbS3HPqau7bJWiWdUBux3f3Ak95SqdRwmdEO1MCKmoxKDo3u/6WiWPTeE6bhxqzp7OAiNWPHoE0+u133oBl+OFQRn4z3ZZ1knpj70hgDUx6gZXkM6J7KlrCpuLoF6S01I/O/7QFKCjy4HUdUKFYxO9Pfjx4rDqdzPvLeBQO2kW6FeeLTb0HHAblsUm3YmTcttO5k527fnM9sIvEFZAA29/t66vf0fxCXM0cLCJcwt/7dR/C1FroEzqwpMP0aWDqXEAMZklyeQQgA6kakqEeL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKa7z0oO+YzsFPFvDFbjQCwwLegUoo0/xgI6N7z71go=;
 b=YqBaKx7zHIw59YCYGu9NBQPHHl8YVh66SxFBrm5E/kcT0QeXPuNHV+TKAxM5nD09o62M/t+Mm6ozN6/mJux0ckSLLbIRBsm66hH7i90xETlJa9RX4VX5q8IgZwhj7A9CB/aFbXyB/Fi6y8e3nY/p1JQslsI531KuztcyCd3w3q9tSNh3KDubDOHOIHbkQnaZM8TpCP4ng62qnbumiP3aXu1GIY/S5KtzPLR1XAEsIVMsCwT1YAjBx1kYx5a7HJLUH/d0RmKUusgIk5fWHww2skNJrIVjQNMo4Ovcg4XD+wn7IC9sfbKdBrfzPedGn+kpArZ2nIPpa1bfmM/Npe7xaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKa7z0oO+YzsFPFvDFbjQCwwLegUoo0/xgI6N7z71go=;
 b=sjJMyKCaLij3BagX5sPmpGj7In/cdPGhFOV3N6P94gQdZZ9rd9mVL8mQZ6dRfdikLFkrEe8KKl6o2Gn+FMoXvTil6fYkmn4zjHbEJsPICPuBUcDvLmg6fIGMS9GOq7DUdcJi1psMUsaXR9j8ZmlRA8fJ8E2yHAnp+eoOvc66K9WSDxvkQSHNbGTMCrCczqmtA+76V838WyjHsS55HOP5ztH7zY8svLcFmPvFO6xpODpBUMl1g/Icbi1SCWhVi6sDGHuSUgHegckL4HLSeBfgUCXzZS7Z8uzh1BWSM7Ncw8RLb7LuPHUm/5AIJHfp8UBG6Zx0riepS+doY5DcWkYEDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by LV2PR12MB999098.namprd12.prod.outlook.com (2603:10b6:408:353::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 04:51:25 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Mon, 9 Mar 2026
 04:51:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 13:51:21 +0900
Message-Id: <DGXZCHSH4JPB.1ZZW2B72MHCMT@nvidia.com>
Subject: Re: [PATCH v10 08/10] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
 <20260301-turing_prep-v10-8-dde5ee437c60@nvidia.com>
 <DGS465GNPO0G.1WKMAHMPTXLNN@nvidia.com>
 <DGUXZT9RZEVS.HSSD90Q8XKEU@nvidia.com>
In-Reply-To: <DGUXZT9RZEVS.HSSD90Q8XKEU@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0107.jpnprd01.prod.outlook.com
 (2603:1096:405:378::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|LV2PR12MB999098:EE_
X-MS-Office365-Filtering-Correlation-Id: a6deecae-997d-4928-c452-08de7d978460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: iH6Cwi1uo7+ymwAWDTkwE3/egGD9LFF6HqXsTf3sIZh90MAxHdXXUaCOloIvuk99rM2LZJCe6261Yhk+HD97x4csb7QRv/itFXbtgBr6hmZtwqOQKnIYpv+6H6ryeVgrU8suR4GZUbwPQ2Z3vgl7e6JSirYUY267AYI443/wxdQM9f5+KQ1FSQkJ04SRdies4kLSqI4+uAju9RQUXhD5wWEmP8kQX8SlGDWYwXfncLiFwhRflJHp3W5ckVV49zis27/qvhyYPBJkq1UNzttI3uQM/PvF//32RLNWvVhh0v62bu++n8aeI9Lu6JJqBsW7aRh3CPp+Hld4tnwW2At8KJqaR8hKfbEKBYENQczTcEAAeDERPNCSkvx72DJhBpd+L3DpAidK+b9ehJtIWCeCnomQ0UEp7PSfuhgD0Qx7C1qDa3D+bnpqPUpGPn+rOa0KqmQYxwCPTc1ipSxDkupNC7KKb0pt206/2sl53vMLtJeoq5r1wc8L1rbhifmn6oYt+3BBK2b4kQpaDk45jUc8XAwnp10suXW6KAPisvVYI51coKnEuvz4nG+L/cAPVsuwSs7MHo9Kik3fpHtTzIWYzDQN3MMmz8zMXw45IF5rcTfWMYxndQIqc8rD6LyDuSaVb2XwwFz3mtUV96vB0f7XN5TEBtCXzcf6vRyrLCeGAq3mB587roRwboDwv6vv9B111c0Gmufkjn/xoifZFCl/OUvCcnXSieEViRxnGgNt1MsVzclP5cThy00Lcol48yLq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1BhRlFSWGFhVmFqUmM5M3crZGJmQUJBTUFMQU91MnBSUldPQmI3YzVUU0R5?=
 =?utf-8?B?OWU1MnlmbDVDWUpyM21qZ09ZckpnNVU2dEhoVzRnaGR5Nm5vLzhsMGkvNWQw?=
 =?utf-8?B?aHZqc1dKaVYyWXVHSVJRWGw0TENBanVYMkttV0d0QkxUVXMwMkNmdU9rMXBG?=
 =?utf-8?B?SXhQREJSR2VacWtHYkJpNkpTekNqZUVKenNWMXdadkR6cG1SNGZUZ1QrWVNn?=
 =?utf-8?B?UUdlTThOdE1FMTA0MXd3VzM3bHpOclJUYmJIT0RJbXNHc3lFamlTOTFJTHp5?=
 =?utf-8?B?dC9jT3lNbGpNWnloTGRQZG92eDM2ZHBDRGdleklsZ2FLc0J5TXRrMzZMbFBq?=
 =?utf-8?B?enV1VkZ1NjNyNGVRNnRVd213eFZDZWUvZDkrRTUxUFMxSEJzMkt5S2srUXM2?=
 =?utf-8?B?Tk1YM1RQNTJVcEpNRUVyUjI2clBuM20vZnBzcWt6VFd4T1FFQXpPaUNwc2JY?=
 =?utf-8?B?d09HYks5SlBzcnhPVHlKcG5XWnJPSDhaQTJtUHNQa052ZlNreVYyclNSQ0hS?=
 =?utf-8?B?UlVwODRFZGFhaFhlUFh0NUNhWUw0SFY4UThwVGdYNkZITmRmM0xVNTlWcmEv?=
 =?utf-8?B?MWNUR2kxUmgyOUYrdFRUdWJWQTBZd1JFL3Iya1ZSbDRkcGgrTzM0TzlrSllw?=
 =?utf-8?B?eWZIS291eGtRelVwSE9IVTlKZnhNaGt1ZmVaZXY3aU1pQzVsWTJSd2xnSnZR?=
 =?utf-8?B?a0lWbkkrejBuQUUxY1JHNTJMQ05vcTVEQUdRcUxtNThIUDBQM1VYNFZrWXpE?=
 =?utf-8?B?dTlHYXJHUVRlekRnRkRoQ0VwNXZZNUV1M0p4Y0F6R1k0YXRoZzRmRFUwczE2?=
 =?utf-8?B?U096WHF2a3U1NUJuM05CQVdtRWExQWl3OVMyNFkzMnV6NHJGT2xHbHYzSnlm?=
 =?utf-8?B?Mi9sc3NWUVdBVEVvMmxhbG5MSlBnTGsrVm82Tyt1RXI4aVAvSENmSFIyazg0?=
 =?utf-8?B?VHYySnlnaTlOSitoQzNUNjdrTkl0UHhYckpYa3dhUm91ZTF0TjRMWUNCWTl3?=
 =?utf-8?B?clpqZkFuaHBLSUtlSFZsRlpWNTZ0MFZ5dDF0VysyVzYzWlFWZEVrSnJlb0Ri?=
 =?utf-8?B?aGZQMlp2YitTSTNzMXlZd015eXI2T3owTkVlV0ZmS20zOGVaS2Vqa1U3eUo3?=
 =?utf-8?B?SnlDYndOcWVLT1VKMzgyTmk4TnNuYnQyTStXTzcrT3A5aUd6N3lOMFNldmZJ?=
 =?utf-8?B?SFN6aHhXZnIxaEFGQW9RS09QSFNwOEJaOXo4TTBTUzdwQmdSK0RSVFV6ODAz?=
 =?utf-8?B?SnNwUGJ2Tm94SmlzQWFaWXRqY0ZJUWFrOFQyVDB1TFNHNnVaVzdtVE0rUDRy?=
 =?utf-8?B?akg0OWROeFMzbU5OdU1iSHdGc3BWVlVORTY4dUZOM0luaTIxVXFXSTlXYTcx?=
 =?utf-8?B?S1ZDSmtHcklYZ3ZDNkF1Z203SVRLM3cxTytmU1ZkOVp1b1JNRGx1eThjTUIy?=
 =?utf-8?B?UTd1QnlhdE92UGpyTHZESi9MbUx1OUM5WTI0T3FCWHRLbC9zR0FEY292dVdU?=
 =?utf-8?B?RW93RldLT2drN05DMVZOOGp6NTVub1dLLzgyd3hVNXR6dHJtM2ErWEx1SmR2?=
 =?utf-8?B?NXR2cTNFWUp2L2FmMDlvNldMK25KSUpIbUZGeFhaL3JFU1FEMm1TbkdlbTJ4?=
 =?utf-8?B?SWVXZFZ5cklhSWpEUVA1Q2N6N2c3dnFYb0FCak5TemdiZEZFYVN0akVRbDRp?=
 =?utf-8?B?VGFLb3lnMDR4TzVRcGtrSGF2anh6NVNUYTRud3QrMW5hV0JIWDk3ZldGY0Ix?=
 =?utf-8?B?WkhZM1U5c1BXbFE3dUtGY1pTU2hrZXZUa1J1SHlVWjV4TGhveWRqRTlRTXNk?=
 =?utf-8?B?NzJvUVVqMUhwQU9hcGFlaTYrRVRLeXorUFd3NDlpMm02YW5pUldxNXlESmQv?=
 =?utf-8?B?TExMZytRWXZtQmlkazZ5VUZGZnRYSHV5d2FIV09TcmpzcUloNCt4L2xRK2tM?=
 =?utf-8?B?Tk5zOVJCbjNUamwzdExnZHBlR1FJSktBbWJLZ2x2Y2FleXBNbWs3Y2dWUUFi?=
 =?utf-8?B?RkN0Uk1Rc29vMGJwdGhSMHpFOFFaWGtVVFA1TkVSclBvaEp2Z0c3UkNYN1FE?=
 =?utf-8?B?ekJnNHEyK21EeVN3ZWkwVUp4RmlYMUZCOEZZdzFub05iUllhc1FHRnJocW1Y?=
 =?utf-8?B?VVZucEI1bUZ2V1lqMjRZdHArOGU0S2UwM3BrM21RZitBY2xnc3RMN00vUU1o?=
 =?utf-8?B?UHhORm0rK2t0WldIQkprZmh4aExYN0JTVFpjaDNWd2N6WFZrUWJzQ3dvNlln?=
 =?utf-8?B?TzRmZ01hRFZ3K3o5U3A0cUFxR1g3dnZma0huZE00SW1KVU5rdEl4aVdlTEhr?=
 =?utf-8?B?dGt2dGY3Vy9uQUJWdXJQakR4NFhLcXMwc0VmMlZtazZud3pveW9qSWo3Q3R0?=
 =?utf-8?Q?YAaaLoHwke8ewYJgWQJhNlyiouboH4gUweuQj64Y3BaTN?=
X-MS-Exchange-AntiSpam-MessageData-1: OiBW8JlXI2jcKQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6deecae-997d-4928-c452-08de7d978460
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:51:24.9145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RxxhibqVz1aAEvUVLQnnW5RjCx2JDK9lD4G/Yj8EQXS7bivWrB8JDd/UAYqQBoQyg12T9UW7evhYJoi20mj+PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999098
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
X-Rspamd-Queue-Id: 3D71A233BC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 12:09 AM JST, Alexandre Courbot wrote:
> On Mon Mar 2, 2026 at 4:22 PM JST, Eliot Courtney wrote:
>> On Sun Mar 1, 2026 at 11:03 PM JST, Alexandre Courbot wrote:
>>> From: Timur Tabi <ttabi@nvidia.com>
>>> +impl FwsecFirmwareWithBl {
>>> +    /// Loads the bootloader firmware for `dev` and `chipset`, and wra=
p `firmware` so it can be
>>> +    /// loaded using it.
>>> +    pub(crate) fn new(
>>> +        firmware: FwsecFirmware,
>>> +        dev: &Device<device::Bound>,
>>> +        chipset: Chipset,
>>> +    ) -> Result<Self> {
>>> +        let fw =3D request_firmware(dev, chipset, "gen_bootloader", FI=
RMWARE_VERSION)?;
>>> +        let hdr =3D fw
>>> +            .data()
>>> +            .get(0..size_of::<BinHdr>())
>>> +            .and_then(BinHdr::from_bytes_copy)
>>> +            .ok_or(EINVAL)?;
>>> +
>>> +        let desc =3D {
>>> +            let desc_offset =3D usize::from_safe_cast(hdr.header_offse=
t);
>>> +
>>> +            fw.data()
>>> +                .get(desc_offset..)
>>> +                .and_then(BootloaderDesc::from_bytes_copy_prefix)
>>> +                .ok_or(EINVAL)?
>>> +                .0
>>> +        };
>>> +
>>> +        let ucode =3D {
>>> +            let ucode_start =3D usize::from_safe_cast(hdr.data_offset)=
;
>>> +            let code_size =3D usize::from_safe_cast(desc.code_size);
>>> +            // Align to falcon block size (256 bytes).
>>> +            let aligned_code_size =3D code_size
>>> +                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNME=
NT }>())
>>> +                .ok_or(EINVAL)?;
>>> +
>>> +            let mut ucode =3D KVec::with_capacity(aligned_code_size, G=
FP_KERNEL)?;
>>> +            ucode.extend_from_slice(
>>> +                fw.data()
>>> +                    .get(ucode_start..ucode_start + code_size)
>>> +                    .ok_or(EINVAL)?,
>>> +                GFP_KERNEL,
>>> +            )?;
>>> +            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
>>> +
>>> +            ucode
>>> +        };
>>> +
>>> +        let firmware_dma =3D DmaObject::from_data(dev, &firmware.ucode=
.0)?;
>>> +
>>> +        let dmem_desc =3D {
>>> +            let imem_sec =3D FalconDmaLoadable::imem_sec_load_params(&=
firmware);
>>> +            let imem_ns =3D FalconDmaLoadable::imem_ns_load_params(&fi=
rmware).ok_or(EINVAL)?;
>>> +            let dmem =3D FalconDmaLoadable::dmem_load_params(&firmware=
);
>>> +
>>> +            BootloaderDmemDescV2 {
>>> +                reserved: [0; 4],
>>> +                signature: [0; 4],
>>> +                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
>>> +                code_dma_base: firmware_dma.dma_handle(),
>>> +                non_sec_code_off: imem_ns.dst_start,
>>> +                non_sec_code_size: imem_ns.len,
>>> +                sec_code_off: imem_sec.dst_start,
>>
>> Is it correct here to use `dst_start` for `non_sec_code_off` and `sec_co=
de_off`?
>> AFAICT, these are meant to be offsets from the base of the DMA memory an=
d
>> it's meant to copy into the falcon. But the documentation on `dst_start`
>> says `Offset from the start of the destination memory to copy into.`
>
> OpenRM does the following:
>
>     pUcode->imemNsPa =3D pDescV2->IMEMPhysBase;
>     ...
>     blDmemDesc.nonSecureCodeOff =3D pUcode->imemNsPa;
>
> and
>
>     pUcode->imemSecPa =3D pDescV2->IMEMSecBase - pDescV2->IMEMVirtBase + =
pDescV2->IMEMPhysBase;
>     ...
>     blDmemDesc.secureCodeOff =3D pUcode->imemSecPa;
>
> So it *does* set IMEM addresses (i.e. destination) into these fields as
> well. And their documentation is the same as Nova, which is all the more
> intriguing.
>
> But the reason for this became clear after I figured out that the FWSEC
> firmware was a *mirror* image of what is expected in IMEM. The IMEM
> destination offsets are also the offsets from the start of the source
> DMA object, hence their use in `BootloaderDmemDescV2` - for the
> bootloader, they are the offsets from both the source AND the
> destination!
>
> I've found a couple of differences while reviewing the code though.
> Nova-core did not do the `- pDescV2->IMEMVirtBase +
> pDescV2->IMEMPhysBase` part, and it did not pad the FWSEC start image
> with zeroes up to `IMEMPhysBase` like OpenRM does (to have this
> source/destination symmetry). This happened to work because these values
> are all zero in practice, but we want to align the code to do the
> correct thing otherwise we have a theoretical risk of mismatch.

Thanks for looking into this - the mirrored firmware layout thing helps
explain a lot why `dst_start` is correct to use here and `src_start`
is incorect.

>
>>
>> Also `ucode_start` is defined as `hdr.data_offset`
>> but doesn't add `code_off` from `BootloaderDesc` and `code_off` appears
>> unused. So does `data_off` and `dmem_load_off` for that matter.
>> I find it hard to follow what's actually required but it seems odd that
>> none of these are used.
>>
>> At least for `code_off` should it not be part of the computation of `uco=
de_start`?
>> `let ucode_start =3D usize::from_safe_cast(hdr.data_offset);`
>
> These two appear to be correct, at least if we follow OpenRM. For IMEM:
>
>     // Copy bootloader to top of IMEM
>     virtAddr =3D pBlUcDesc->blStartTag << 8;
>     NV_ASSERT_OK_OR_RETURN(
>         s_imemCopyTo_TU102(pGpu, pKernelFlcn,
>                            imemDstBlk << FALCON_IMEM_BLKSIZE2,
>                            pBlImg, // <-- start of image, no `code_off`.
>                            blSize,
>                            NV_FALSE,
>                            virtAddr));
>
> The `BootloaderDesc` is only used for `code_size` and `start_tag`. And
> it's not strange considering that it just contains the code to load into
> IMEM - the data being the `BootloaderDmemDescV2` that we construct from
> the actual firmware. Since there is only one segment in that binary, it
> makes sense that it starts at offset zero.

I looked into this some more and I believe we probably should include
`code_off` here, even though currently it doesn't matter. First, here is
what I found out about the firmware layout, which might be useful
background so let me record it here for posterity:

In OpenRM, the gen_bootloader firmware in [0], and it's split out into:
- ksec2BinArchiveBlUcode_TU102_ucode_image_data
- ksec2BinArchiveBlUcode_TU102_ucode_desc_data

Which are the image data and descriptor of the firmware.

This script creates the gen_bootloader binary that nova uses [1].

The script writes gen_bootloader.bin here[2]. It creates the
`nvfw_bin_hdr` which IIUC corresponds to `BinHdr` in nova. That would
make `BinHdr::data_offset` equal to `24 + descriptor_size` =3D 48 and
the .bin size `816` (this corresponds exactly to the data
offset of 0x200+data size of 0x100 + the 48 bytes of header, and to the
file size of the binary firmware file, and to the uncompressed size of
the ucode_image + 48 bytes of header). After that it puts in the
descriptor, which corresponds to
ksec2BinArchiveBlUcode_TU102_ucode_desc_data (which is 24 bytes, type is
`RM_FLCN_BL_DESC` in openrm) and includes the code offset field (which
is zero):

```
typedef struct _def_rm_flcn_bl_img_header
{
    /*!
     * Offset of code section in the image.
     */
    NvU32 blCodeOffset;
    /*!
     * Size of code section in the image.
     */
    NvU32 blCodeSize;
    /*!
     * Offset of data section in the image.
     */
    NvU32 blDataOffset;
    /*!
     * Size of data section in the image.
     */
    NvU32 blDataSize;
} RM_FLCN_BL_IMG_HEADER, *PRM_FLCN_BL_IMG_HEADER;
```

So when we read into the firmware in nova, we're looking at a firmware
that is like:

BinHdr
Descriptor (which includes code offset field)
Code Data
Data Data (this is unused)

But, in OpenRM, in
`src/nvidia/src/kernel/gpu/gsp/arch/turing/kernel_gsp_falcon_tu102.c` in
`s_prepareHsFalconWithLoader` it calls `ksec2GetGenericBlUcode_HAL`
which writes into `pBlUcDesc` which is of type `RM_FLCN_BL_DESC*` - that
goes to `ksec2BinArchiveBlUcode_TU102_ucode_desc_data`. It also writes
into `pBlImg`, but that actually points directly to=20
`ksec2BinArchiveBlUcode_TU102_ucode_image_data`.

In `ksec2GetGenericBlUcode_TU102` it writes just the code section:
`*ppImg =3D pKernelSec2->pGenericBlUcodeImg;`. That comes from
`bindataArchiveGetStorage` which grabs "ucode_image" in
`__ksec2GetBinArchiveBlUcode_TU102`. That corresponds directly to
`ksec2BinArchiveBlUcode_TU102_ucode_image_data`.=20

So when it uses `pBlImg` in `s_prepareHsFalconWithLoader`, it actually
doesn't include the header or the descriptor, it just includes the code
data.

[0] src/nvidia/generated/g_bindata_ksec2GetBinArchiveBlUcode_TU102.c
[1] https://github.com/NVIDIA/open-gpu-kernel-modules/blob/main/nouveau/ext=
ract-firmware-nouveau.py
[2] https://github.com/NVIDIA/open-gpu-kernel-modules/blob/df1c9a3de2be4b13=
0f4fc7680f7198193d8ac6ad/nouveau/extract-firmware-nouveau.py#L181


With that out of the way, if we just consider the ucode image part, I
think OpenRM code is wrong to not add the code offset, and nouveau code
is correct to. Even though it is currently 0 in the embedded firmware
in openrm. I think this is less of a problem for openrm because the
hardcoded zero is versioned with the actual firmware which is embedded
in the driver, so there's no way it could get broken later.

So yeah, it doesn't matter too much but to be maximally safe and
correct, I think it should have `code_off` added.

>
> And here is what OpenRM does for DMEM:
>
>     // Copy dmem desc to DMEM offset 0
>     NV_ASSERT_OK_OR_RETURN(
>         s_dmemCopyTo_TU102(pGpu, pKernelFlcn,
>                            0,
>                            (NvU8 *) &blDmemDesc,
>                            sizeof(RM_FLCN_BL_DMEM_DESC)));
>
> Here too it makes sense that we load at offset 0, since there is only
> one data segment (the `BootloaderDmemDescV2`) that we build ourselves.
> There is no other data to place anywhere.
>
> I suspect `BootloaderDesc` (or `RM_FLCN_BL_IMG_HEADER` in OpenRM) was
> recycled from some older (pre-OpenRM), more complex firmware and
> inherited its documentation only serves a limited purpose here.
>
> The comments on `BootloaderDesc` are incorrect for us though. I'll amend
> them.

Thanks. And for dmem_load_offset, it's not used by nouveau either.
I think this one is ok with just a comment and marking it as unused
using _.

>
>>
>> Overall I find the dst/srcs here confusing cos it feels hard to keep
>> track of which set of memory things are in. So, sorry if these comments
>> are nonsense.
>
> The documentation clearly sends us on the wrong path, so good thing we
> fixed it.


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIrgB8FYpmmJOQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:42:57 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A51E887C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C8C10E61D;
	Tue,  3 Mar 2026 03:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RzC+wY6k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011057.outbound.protection.outlook.com [40.107.208.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5E210E61D;
 Tue,  3 Mar 2026 03:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VS+IFk9arnVWHQe/cjNCGX8tb8nxYglIihhJe5rj3o80i/u530BpDkfGmkdpipkWtN79auF7LbtwGeo9ojIa5cnF6Qf6hyu5jxJ1CKZgsTLHRkb99tTEt8+0c63AXUPmsl2u8FylVOtsFzJIw6/zsAWTVO0TAoi3Upf/zV1/j87NwWCLgcAWTTnva3taPjFf+k8gnScFD9DhMEBJZgGRzOk4fBFns/+mBlCP3mVbp005EJa1bo+fIes0XphlQELr9azxya0/36twldSnvSwL/Yw4XhJPh2SyZtW8fqMPV7PP0EHUbmYoSp3ibYmkbthcH8MxKjJ35LyWWdAH5q7UtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPq3Jnxmvt3jjqFYdxjzSTFZ7dxNwBBsDEg0w9P/kUU=;
 b=AtBVBEY1SFlpRW34OgV+xdQPdyMkb/OrtZAjwbGOmtaNZ2v7quVDKEwsKptIijVPNefaJ6cROOgkZJf8t9z8Hgbi/hZ+p3Xrs0oXle7NeZsnobgaRVFEZGJFwJvJ1AblZHFPtOkRE/cM01qQ5yZnu34ZLf4QoOebpPu5ExH1Tsi8xdYMPTeF+UHmFaka6Jc9LcgP9cPOf5t7a3qbKr9WRU6UJDGLfAH/KkafITQg8xs33psntXog7UX9HLP8eoXSgWjTQ3R+0r8VxFrBgjPqxTWX4dXlBO6uVAXX9hHdjI3B/c9lyQElLd+8S3wmbfXG27RDIpL98RzgQiuc34ZM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPq3Jnxmvt3jjqFYdxjzSTFZ7dxNwBBsDEg0w9P/kUU=;
 b=RzC+wY6k/VHSpo23Ps+b6/hTw58K7TLFzO1ZnhgpbGXnbvYe1QT0345az1BFHWI8yQ1KxFNrjCVSjq38rwGK7zizspv8GR/WSXFHGfmo23XTzUhqZrbfTUVQ3AFi5D+/LZidS15E7uFKc9cyTLXHtanMiwtaNygbu1GshFVu+rB3gluFQND83cT8kuU8bhjRWkpM+737MdKWhnhxQvMB1x6EDoJL8VcJ5f9v42YKFlCF7ohs1GrMBVSIBedDa4EMSRtSLqedJiTOovy0yzlApBNnh65QxlQfKmziz3Qk569qwF2DpVEhLlk/4RJs6F94hunHn9qx7uUys1peLinp+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 03:42:46 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 03:42:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 12:42:43 +0900
Message-Id: <DGSU4OC7HM0I.4NKIJ9T7YW35@nvidia.com>
Subject: Re: [PATCH v2 3/4] gpu: nova-core: gsp: make `Cmdq` a pinned type
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-3-c7e16a6d5885@nvidia.com>
 <DGSH65EDC3IH.1F9WMMAOX5P5V@garyguo.net>
In-Reply-To: <DGSH65EDC3IH.1F9WMMAOX5P5V@garyguo.net>
X-ClientProxiedBy: BYAPR21CA0014.namprd21.prod.outlook.com
 (2603:10b6:a03:114::24) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL1PR12MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b557086-1572-4c05-ab29-08de78d6eeee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: gH8NsgUdMh/OAjglyKZjNRdBZgmM9+wISVWlNHsUWchRATj9i1wNiPdrplnIYdgOeirICgEkNLn9WWkUZo+VAy/JOHPQO5nwaNI6yAHaaSPNMRPBwujbkJdCZJ08b5Ptsxm7oRoBcMzy4rn1epmnrpg+GVQ5KNH/s/hkDrEVhxGjBM5/CrqJWC7+JIskLV+7qy3CrSzGlXHpofplQp9ljsDc19lCKHfRwZQ0riNpQ8WIR1MNfNSzRfHVCRKkCec8c6sctdgBvqNLm8jXuZDRHH4uhG4RFgxLljbVlnsaMXxOXmPtSDFJW5Fe5aNe7hgWrslyN37cSMhNUwJ2lW4gXUHTjYH7Xhlri8uCdNP5uhLTKbSFV7uOsr/94EkhKKSCsbgRAajnZZO95aDMEMWXlD+6u4jDZwzkmVKH30rmZbHvB0Dn5lv6Swd5mBAJEfFxgygRAtgmpHOd5jvmuvgV77VaPfsnJhp0895RSBzNvEMX2bPE4KFHx5DEsX8ZB3v327iU5lix+cWMk0AG24IW2fHu2ATll1NaAwMIDXOB/wjF718J/WCfsvvRlFxaruMKyxdEQnUFzkMreqLa0A19WSpk5AIHbrQJ+NMOYTgC9MP2xSq4xS7cpUf9o3u9B3ENZTuzTiz2mcFAlqwFLl5bIcOSHNgj0E8dGv3V07aUQC7Js2dbStBeC2acIhgnsrQxWVFzbmdFP4Qj+iJZuul5lfV+nyxoQ0GhdVHl4WCVmew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjZpNFVhd3Z4R3l3ZnpyN3VrTEoreDZtK3lPYU9qa3puWHJhS21aR2U5WEo2?=
 =?utf-8?B?ZEJxVnFFRzZBSW1DRk1LSHVVeWFqQXNLV2MySE9rRjhXVkk5STZNNnJySXVC?=
 =?utf-8?B?aXBTeTBJZFdEZ2lzNmN6NXdKRU5BVjJ6b0hiZTd0TU9ZWXo2UUhaTldoekxU?=
 =?utf-8?B?elFCY0xFY0FaZnViYWtyVEhOdUZ0dGZjU21mTXRCeGo0VmJCU25XWEQ1SSs0?=
 =?utf-8?B?K2VSaHQ4WVdKTWhlRU4veWJBK3JxQk0xTHQ0WVlxQ1JhQ3ZvYnpKVGtGZHBO?=
 =?utf-8?B?cjhqYWlJS3JydUY2dWV4aHVVWUk1dVdSQ3FVSDYrUHJaVDRrMkVRVFlLbWs0?=
 =?utf-8?B?TG8wL3NVMW52a1hSa1ZNcEZrajhRWkpKVDFLWXZEdHRXY1hmM0tBVyszQnhO?=
 =?utf-8?B?bFI2OGN3UEk3Z3dVWVEvMUQ0MDVKRjNaZi9hcndXbFdzZFMyZ3FRZXRqTVA2?=
 =?utf-8?B?Vm5kQjFESUFzUmRuN1drNXBQVVlUdDhiT0V1ZGRzWmw5SmJabnJsRnJiMDkr?=
 =?utf-8?B?TU9GN0tKMHR5aFg5bThrZ0lNRmtYUGpieFNCaFgwTmhIMXpkdVdKQmtQVlA5?=
 =?utf-8?B?RkRaWGJqUGxKNUFIZndEb3EzYVYwY0NBWm9XWWFWYXNaV3puVmxVNXM2OFM1?=
 =?utf-8?B?SlVwNittWTBITjlNQXJJalJ1UWZnaUl0TWhNVHBlVFlvQU5QeldvcStiMUJK?=
 =?utf-8?B?N1pIUnk5eGgwU0piQVJ0Ryt6d1dTUFVKS2c4dUJrWHlBKzc0TXcvOEdXdjV0?=
 =?utf-8?B?Nkc5Z2l1V2FDWlJKc0Z5cUhLZGp3Y0JxNU84ZlE4WFZEeW9SSVNDbElrbkFG?=
 =?utf-8?B?RmlObXd2WFZHUS9uZzh6a25KSVgxNi9JR0NDWHZEYnNRQm1tdUVvKzlpQktM?=
 =?utf-8?B?TCtmZWZWd2tBUERTNDRXK3ljMmhSS0ZRY1VRMTduZ2o5ZjdRNzJlWkJwTUVv?=
 =?utf-8?B?ZFZ3VzBpQkt2V3IyWkFnaUlkdDNkQUd5SHlGQXg5RldOemdudlpUdXFlSlRh?=
 =?utf-8?B?MFVGVTlXNk45bk9KZEg0dkowc3hHdWQrcFF6VWRFektqM2RnZE94SFhDS1o5?=
 =?utf-8?B?Rjc3K0ZzVzIxUmltUTM0VlkydUNYSGhCYjBjbmd4b3J6VE8xLzdCdUtNZlJv?=
 =?utf-8?B?dWI5V1A4Qk9YRlkyQUR2T2s0bnU2bFlCTGcwNGQvOHpCU0RoMDZJQzFKeUNw?=
 =?utf-8?B?aXA4QkVJbTFsckhFR2xvYWNnRCtaVFZ6MHl0ayswYnJBYW9MZndwcnRraEUz?=
 =?utf-8?B?UVhndzdWK25sZTdMUGhWWFdCL1Jqb3ord2doYmJybkZ4djFUclViOTROMmFO?=
 =?utf-8?B?NTZxbWw4dnRuYmY1OEw0R3VLT2ZZejcvNG5rbnZGNUhobnd2UFE1cG5VMGpQ?=
 =?utf-8?B?Y2Y3TlhFbFljNUkzTFVTSktzQ1Q2RVowT0ZoeENjdUxqNHpDTHhWYlYyMDho?=
 =?utf-8?B?K3V5K3F0aVVpa3hBeTVYQWFpM1dOemp2eWRBOEFBWE9xam9FRm8va2xHTFdi?=
 =?utf-8?B?bHZIcjJsSUlKZVpGanQ3TDNneStOQnFQYWJJRkpselRBdWJkTEtoRnVxK1di?=
 =?utf-8?B?N0RVNVZwMzEwRTREcXJTYlFITllBNG5QYjlEZ2ptY1FBSzByM1R1bzhtTGVL?=
 =?utf-8?B?UWZRT0NHWXhNc3lmSmRROHd1MHNGZ1JHNHRCZmRYT2tpSUYyaXptTjc5SWYv?=
 =?utf-8?B?Smc1ajBwa1pFeEM3Si9YdFMzQjRwa0RRa0swc1JGUTl2WWoyWVplNU1IUUZn?=
 =?utf-8?B?aUlOTk5qcVBhems1SkNHV2d1MzAvL0UyOFh4bmZiZ29FeFBqSW50d3VEKzYv?=
 =?utf-8?B?cmYxQWN1WGpxVCtBVVpCdTdTM1lvZnIvWDNEc2JtUzNmNjRsZ05TN3Z6L3Zk?=
 =?utf-8?B?Z2JqZ3NpN2xuOXNid2lxM2p6c3N4Uzk4a0t6WVhtV1J0RjhqWlFVbXlzd096?=
 =?utf-8?B?blRJemtWK1NRNnhXU2owK0RQWDZqUEdhRms4ZkxwZVRvL3ZMN0hWUnl0N3FF?=
 =?utf-8?B?cWJJT2RGTWFnZ1pqVVRFSDJuVjc1V0xoclJhbTNxakJUazl0UkRWQWhaMnVI?=
 =?utf-8?B?VWRWbFg2Myt5dlpJVGF5c2hPNDNZcmw5V29kK1ZLbXBuck1nSjZsMWFXSWRQ?=
 =?utf-8?B?M1piZEpmQlVVdXFQVnBkK1M0cTRkSnQ0VXNlQjJ3L0NwWnRzLzY0K2l2QlFa?=
 =?utf-8?B?WkxiSXViNUw1Qzh4OUl5UThQZ25mMFk1dWRzZ09wM1dWaWNzbks0U1hTZjNy?=
 =?utf-8?B?NjhrdWFKY3ZGazNQaGdueFVZTEdzNjFBUDVkSng5SksxdjlyQk40a0dtek9Q?=
 =?utf-8?B?blE1SmtwVzUrT2k2VzlETEFIUUdIY3hGMUl4VjFQbW05WGJYRVBsV2RXSExF?=
 =?utf-8?Q?LXXrcCXU1VlvznN7gp3+D07Qieg6Pbn/pnCj0n62eZ7GS?=
X-MS-Exchange-AntiSpam-MessageData-1: cixvUR6MKja2hw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b557086-1572-4c05-ab29-08de78d6eeee
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:42:46.2586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyjW9LdfF3+OZM6pEKK36IKigC23Yydz3p9in6q6egmMI5+lvMctIKFZgTzFxJv2E6idTHKVWlSLW7l5H5SIyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5825
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
X-Rspamd-Queue-Id: 7D4A51E887C
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
	FREEMAIL_TO(0.00)[garyguo.net,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 2:33 AM JST, Gary Guo wrote:
> On Thu Feb 26, 2026 at 2:50 PM GMT, Eliot Courtney wrote:
>> Make `Cmdq` a pinned type. This is needed to use Mutex, which is needed
>> to add locking to `Cmdq`.
>>
>> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp.rs      | 5 +++--
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 9 ++++-----
>>  2 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
>> index 174feaca0a6b..a6f3918c20b1 100644
>> --- a/drivers/gpu/nova-core/gsp.rs
>> +++ b/drivers/gpu/nova-core/gsp.rs
>> @@ -112,6 +112,7 @@ pub(crate) struct Gsp {
>>      /// RM log buffer.
>>      logrm: LogBuffer,
>>      /// Command queue.
>> +    #[pin]
>>      pub(crate) cmdq: Cmdq,
>>      /// RM arguments.
>>      rmargs: CoherentAllocation<GspArgumentsPadded>,
>> @@ -132,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>)=
 -> impl PinInit<Self, Error
>>                  loginit: LogBuffer::new(dev)?,
>>                  logintr: LogBuffer::new(dev)?,
>>                  logrm: LogBuffer::new(dev)?,
>> -                cmdq: Cmdq::new(dev)?,
>> +                cmdq <- Cmdq::new(dev),
>>                  rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc=
_coherent(
>>                      dev,
>>                      1,
>> @@ -149,7 +150,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>)=
 -> impl PinInit<Self, Error
>>                          libos[1] =3D LibosMemoryRegionInitArgument::new=
("LOGINTR", &logintr.0)
>>                      )?;
>>                      dma_write!(libos[2] =3D LibosMemoryRegionInitArgume=
nt::new("LOGRM", &logrm.0))?;
>> -                    dma_write!(rmargs[0].inner =3D fw::GspArgumentsCach=
ed::new(cmdq))?;
>> +                    dma_write!(rmargs[0].inner =3D fw::GspArgumentsCach=
ed::new(&cmdq))?;
>
> Hmm, I don't think the `&` here is needed?

It seems this is needed, and here is the compile error, if you are
interested:

```
error[E0308]: mismatched types
   --> drivers/gpu/nova-core/gsp.rs:153:78
    |
153 |                     dma_write!(rmargs[0].inner =3D fw::GspArgumentsCa=
ched::new(cmdq))?;
    |                                                  --------------------=
------- ^^^^ expected `&Cmdq`, found `Pin<&mut Cmdq>`
    |                                                  |
    |                                                  arguments to this fu=
nction are incorrect
    |
    =3D note: expected reference `&Cmdq`
                  found struct `core::pin::Pin<&mut Cmdq>`
```

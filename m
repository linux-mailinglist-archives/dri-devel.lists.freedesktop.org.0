Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CABA947AF
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C708610E2EA;
	Sun, 20 Apr 2025 12:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t6FpgVjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD0910E2EA;
 Sun, 20 Apr 2025 12:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXhLu+jiu6ZIQZFThgxXeLeU4c4nL9O8Kev/tJ2TvaRC4v5NscqxHEXqXlFSpHkvSHEBSpmHRvsUr8Fj8xNB0tO078rh4hwkRggrcVoGj6MeimnPZvEHMfhhJyddPbjkp56rU6iQtKkGImUpZeuo/gbeyuN3vGOf7Hkfkm6CJxuQFZEqDLpM9SXjbRtDqpbuiHTVoUuYChH+PiM9VHKMLE6Yz4PHL9Hqd+/25fy9bJ+wV+PsJTkjjLYgN1/8oBKf0TNBq5EHx2kXfYrPYj89QbLBWGkxyXYkbnaJ2BxXVhg3r6sY03Ds+hcDDj7g7zSPwYcih6Bs6izf51oK5sUsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8AXLmAd8tujzUv0gLs6/7pbTaWcH6PJlcstTGLqhDI=;
 b=HdYkerB1WdtRAZDCrt5sNAHoPK/fc83gwK3NLNuO4Hw1o83VSgrRz9w5ipUnaz2SNGBDZa3b9j2b1kbLfpcybSoNixnrdBsTr6NVNbCMC9sic9Lva3UnaJPS9w6WHAKh8J6as9caRDrbuqG3zhLROhej6xaMC8OdDLAJ7tkairTJXuVAHKfrBVjM4IWt/pnyZTpHdN6oU2he/CL/FqfshgKyInPdQlOMaqiWs+e3j+MQJ3Jrh+wN5i4RDW5VsssbND6g44BWJlF82xgxsy6mG7Ys7tME9sl2F1MtcfFi0jqTLbCm8/5Qp8/fST+khJaAqKHQm4sZZkFzd322sPasng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8AXLmAd8tujzUv0gLs6/7pbTaWcH6PJlcstTGLqhDI=;
 b=t6FpgVjosXeQ0YfDJP7unq1WCF3uEnHiEBzn14aqKZihvLs9sfHH30mncXW7mDM9Q9awO6/MFGMmPE9bosSZZEtezlIXIpD09Uy1ry3LiVJwsNei1mXVadw5ZlPRGoGeplhqtiv7DgSHsHJFfsK39UhGcNf7StTq5OmTSJxKIv/rnDa2LoWIzO+s7Ns77nX2LiGEQ43QHHz9iyIUrif0wJGbaJYPJ2DA4+xRJUsWe8LPuZjfeVgL28daft7pYaye88cwTiabT2Z46/bSo+abNx8v3hNFHD/G8xiqcZ/4dhU/dC+jvZ1Fn3DOsb6iJIWtmk56m3AZgjg1zAphUcwVCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:39 +0900
Subject: [PATCH 07/16] gpu: nova-core: move Firmware to firmware module
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-7-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f318cf7-85cc-4066-ae1c-08dd8005b44a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUcvT0NQVW8wa2tudGljckRWTVN5QytnSmNsVWRnRVVNTHpKS3plR3FqemFz?=
 =?utf-8?B?VzlGcWswZ05YOGlaZjRXT1FYZExtQ3U5WlAvRXJ6bVNoR1phYklmMG05OEQw?=
 =?utf-8?B?Y0NxY1ROVWd0Q01ZaTVWTDlCK08yQStWa2pvZmdPRUtacUYrZWRwUTAwcmpR?=
 =?utf-8?B?TllBS2ZhVVlmQWxYTHJSNURsMDczT1grdjROc0NDZk9aZmlkeWx6OE5HRjJl?=
 =?utf-8?B?Q0c1VkZscHhObCtxYm5keE9qbHNEN3A2M2dDTWN2a3cwZUo1NWFqRCtPeUZZ?=
 =?utf-8?B?d1NuR1lLV3lnOVFwbGtuUExxNXl3anZTVjEvWVhhSmpSVjVEbjN0WGlVeDJJ?=
 =?utf-8?B?N0d5YjgvbEdFeUxORUs2cW9ydm1Sam94bFlEcVN3b1BINTkxRm9lQkd6Y011?=
 =?utf-8?B?aWM3amVIa0VCR0Y5RWFUVERpVWk0bmVVcXd4MjR1angzcnpoTkRaUS9Mdm5m?=
 =?utf-8?B?T2t1TGdKQUtlbFhQK1lkV01ETm41NUxobjkxek5hdmtqQlo2NkhJMlZCY01W?=
 =?utf-8?B?MVpkMWRyYUoyeVZQN3YxcTJ0UzI0eXlKMGRoVHNuT0ZnVW95MTQ4V1ZlRGl0?=
 =?utf-8?B?dWg1L1dzOW5ySXBLT3h6RU9XbmtmU0QxaHJDc2V5cVpkZ0NOQUdFckZ5WGVH?=
 =?utf-8?B?ZkpQV0U1cEN6RWVKWXBJVlZoekVid3hlNFFxYkhjcERHUTlBWExRRnVQWW9X?=
 =?utf-8?B?VUdLZ1htQ1hsSWhDKzY5WkN3Z3RJQVlkT1N0ajh5RTZVUk1JZEh3dnMxM2N5?=
 =?utf-8?B?SndUY0RET1VOWktMNklGN1ZzZStYOVJGckVlckVQeHJjK1lpZ0NjOS91MW03?=
 =?utf-8?B?L2NvWlcxcFlyLzZ5eXh5OW1nMkhQYkVsQkxkTGhTOHlMbDJ4QXNKMFp2cmNG?=
 =?utf-8?B?VnZyQ3R6SWcydnhYNEFJWmNGOFVtTStRYm90RjVwUitaektHMzJocFlpTmNR?=
 =?utf-8?B?TkNBZkRYRFViNTZhb2p5cjhiQjhqVGM1SWEwY2xBZjVoUmR6ZlpnSkdueTlk?=
 =?utf-8?B?NmVHNlo1TmI5ak5TNUltV0gyWXBmQzNvZ016V053cmJqRWxuSlp5QnNmWHN5?=
 =?utf-8?B?RUFPWXpScHc1bk03cVJwSGw2SHkvbFZCaHZKTlhrVlZJNHhGSjBSelcwY0ZJ?=
 =?utf-8?B?VlJVVHhaV1ozbVdoaTBjRDBUcTVoeER3Y1lQcG43RU8xS1hGVGt6TlM2RVk2?=
 =?utf-8?B?VmJ1OWprV0V1b1ovc0lFYW9Lbmx5eWJZUTg5NTlNR0UvZGlldnNrbTBFdUNG?=
 =?utf-8?B?bG1pQWZ3eUQvYjFZMFRrdmdiSGFTT0s3blltQjJVM1V4U1RlbDQxaVN3ckpH?=
 =?utf-8?B?M0NnZ2k2SzFzS083WG5ZZHpuOUE4b0F4d1g2MnVJb3JDY1NISk5Ja2ltbHo5?=
 =?utf-8?B?RHpvaEJPbW1KQzRXODhNRjlQYithUExrNHhtRnV3NW01dUhGa3dzOElYbXBv?=
 =?utf-8?B?RzZUZlYrNjhZZ21ZTjN6cmFEajlzRG9MaGw5V3Z5NlpLMjRJNS9zMzNWY040?=
 =?utf-8?B?dEJDU2Zha05RdENVU2xFWTFmZmZNN0xNejdFVFFIS0FOL2NkQ2w5bWZyMGlY?=
 =?utf-8?B?MTRYNGhOclpHZjY1UElBY2FPWEFkLysxY2toTEpFc2JnRnEzWmpsMmNlZHY2?=
 =?utf-8?B?d3YvSmE0ek1DbjVYTWhkVC9aYzc4YUJpamtVOUZhOWM1U1Z5SWNJYTRIWjVy?=
 =?utf-8?B?UXZ6L2ZpckIrZlJueEl1Y3h0NlB5VThIOTQybEFEK2FERHo4ZHZmdG40b2M2?=
 =?utf-8?B?RFBTYldWN3AwaFRRWWVydzR1TG9jYUtvOUtqUVZvU2RTanZzcnVZZ0ZKdENi?=
 =?utf-8?B?bUt0bncwNTdjR0JjQnNNRys3RnVOSm1uUU5DNTNDbENmeHM5bDNvNnlxTHMr?=
 =?utf-8?B?R0JUdzZHbzNXL1l2QlF3Q3FwaVpKV3kvUmdRUEJWems1ZXYyeXN3Zm02ZFNq?=
 =?utf-8?B?T2lHeDJSOXIwZWF4Sis5eTljeDI3YlhrbGptZW1ibFZCMG5ONFI2NmtRRlEv?=
 =?utf-8?B?OW9rRUtsZ2NBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yjl0V0lVTEYyWkFZcTBPdFM4TTJSSXQxQkRVR1lZOFJ2UWZabVExNmxxVzhj?=
 =?utf-8?B?dUM2c1FuMnlUVWdCVlJZTVkrbEx5clU0QUhMRUZlVlREclZTa1BwbU14NXcz?=
 =?utf-8?B?VUY3ZGZMWXphUWVWcExmaUJyNGJQbVJJWTEvaWFrdDFLR3JLaWt1VkYzOUx5?=
 =?utf-8?B?cmhpUTdIWlZ6bTRyRVdVL3RtOTVta280REVaVEFHSEEvc2VENmJ1ZUJwdklU?=
 =?utf-8?B?a3U4WEZXeVdrdGZhS2NUbk9jaVBGL1QyanZFRU15U0RiYWRlRlRJT2RmSGFV?=
 =?utf-8?B?VURiQUQ4R1pqUlQ1Mk5FYmlhVTFuelIxUDMwUHE0UHM2d0NyYUErb0F6dHlz?=
 =?utf-8?B?S05oK1g1TldFWjlySTJ4ellQUFZzaDlkVy9wUEd1WXlzcGp4eThxWFVPWGNV?=
 =?utf-8?B?RkYvTUtxcGdiMnl1aHg0cjBEU0I4TGQ4NzNZTzN2SGkvKzB1ZXR3djJoYmpF?=
 =?utf-8?B?ejh5ZjU1Z0NPRVF2bE94MEdLbEJnWHBXSDlVWEZhZkV4SGVlS09OUzZCNUgw?=
 =?utf-8?B?Smp3LzFaTndMR0Fsb2tmK0dtdzRtQkdIcTdkMWhGWmdDc1NFaUF4WXBqNThj?=
 =?utf-8?B?WUdaMWNYTVlUdHZpdUZ2cDZuTHc5ejdDUHhFNHFlZVRDTGMycU1Ud2h0dkNw?=
 =?utf-8?B?Q08vSm1hQzhnZHVWK2U0TlRKQkZSSkN3OHJIN0lmWHRDN0pEWWRrUkdSbUo1?=
 =?utf-8?B?bnJmaW01TFV4NUNBOHlFWHRHeEw5am4yZnZCL3FCN01sL3ZHb3prM0tDL3Fq?=
 =?utf-8?B?Y1BYajVxWUd4NktCdUthNHN2ZHZnN0preDFkQ2hlWHFWU2JDYUIrSHhMK2h0?=
 =?utf-8?B?ODA1WkEzdWVyYWgzS3h5Tkw5VXdiNmhqc1E1djliNDBsUEdRWlAwUnY3UXRY?=
 =?utf-8?B?bExBMGhJbTBZZzNLRGl3dUQ5TFJwTXNPa29MdWJBU0NmNjFDQWdiZCtRcHBt?=
 =?utf-8?B?RTgzb0RkaGxPRjJsMDZCbm04bnNWVFc3dHNja2h0NUE4M3d4VU5FeHZwb0I2?=
 =?utf-8?B?MnJNbXpmMmJHOWJ6amV5WmNMeHhhWXFsdmVHb1JqUTdmeVN3eStSc1RLeTR6?=
 =?utf-8?B?TDQ1UFk4MHBHZnlHd2s2OXQxMGlIdHZJT2t3UHdSeWlxMnhkbTJ4R1VEeEpy?=
 =?utf-8?B?T2pKdGVyV3poaTMzdFRoN05peC9uUFdVU3ZMNTNJSVdxZDFVWkZvMjVqd21P?=
 =?utf-8?B?M25GZUZyWCtaOGZ4ZFQ2N1I1RU9hRWpHSHMxeCthdnpkLzI4YnB6SThxdVFV?=
 =?utf-8?B?ZEZCK2tBd2lpRHdEajJsYmorYlpUMjZnRE5SSUlLeURpOWJCMzMzaTRWVEti?=
 =?utf-8?B?ZzlLSHVwTUNIUmZtRk9xNkVab3J4eTliMEVoaTQ1aTRaSmFDK3ZXQTlHdVc2?=
 =?utf-8?B?S2NlRWdDcEt2RjRpQ2JrTWRJZ3U3c2I3dHdRRldLL2RHY0Uvd2JRb0gzOHZi?=
 =?utf-8?B?TWp4YUtoWDNnb0ZMb01ObHJLZkxObXBuM0V0VDNaeWxka1BiMmM2TStiSGhL?=
 =?utf-8?B?d0tnT25PMGdWVVd3V082cjlIMSs0VGlZRDZKbGZqcU54WTRLTTRwU0h1VFhZ?=
 =?utf-8?B?ZE5kTUpPZ1FTWUczN1poWUNOZmhKTVVZaVlvOUgvZTZEQjFlbVBTcVowRVlq?=
 =?utf-8?B?bmJaUWNqMjcrKzhxQlpWQnhUZFMrODI2WWZlVlN1aEw3K2xGUmZCdVA1MlhT?=
 =?utf-8?B?a3V1VTFaWWJkYVZ0ZGs4UVM0WDVpT3RudFA4eHFxaVFFOC91b0o5amRwb05K?=
 =?utf-8?B?UnpvMVlaOFpraTVSNEg5MWcrT1hsRFdkcU1TYm1mWnlua0o4OUl5aVNlUUFX?=
 =?utf-8?B?S05HNG1VN0V3VHBCYzIvZ3FCNjRKTmtXekFUdXdvekNNMHV0TnNZSGgrNm1N?=
 =?utf-8?B?VEZXTkJKNXhhcEFEODM5ZVZiOURDUEg2QkNjWkcvYXZ6c0prdUxaZldzSGpl?=
 =?utf-8?B?UE44aFhKRUU5aUxrT2lET01VWVEzQUNVNnJwOWJZYk8vdDZVZFVSVmJqUEdE?=
 =?utf-8?B?SThjTmE5S1lmV01zQVdtZTBqSHZIV2g5N1lKL0dNM0hoSmNwV0dmT1A3dHo5?=
 =?utf-8?B?NWI3QVBDclEwdERDak9yVjlBNzFrZU1Ca29hcEtFRm5PWEV0d3JLdkRlYkU0?=
 =?utf-8?B?M3dTUUo1UDZGV1MyVEhjMnRGdnhJYWdXTFpNdDN2dDZxdDExN1l5ZHA1Smpt?=
 =?utf-8?Q?WvmjFDBu6ajinTXTBFHCGTLVau3cQI3SIp8h11Mb4GKJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f318cf7-85cc-4066-ae1c-08dd8005b44a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:14.5737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KIQkKHuZ0DKobpuLUsYaWJREJ/a+MSYQWINhnwj5we0UIJ4E/WHvXypprNGyMQZbSAxNNLxqWHs2h0wTjr7APA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

We will extend the firmware methods, so move it to its own module
instead to keep gpu.rs focused.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 42 ++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu.rs      | 35 +++-----------------------------
 2 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6e6361c59ca1ae9a52185e66e850ba1db93eb8ce..9bad7a86382af7917b3dce7bf3087d0002bd5971 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -1,7 +1,47 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::gpu;
+//! Contains structures and functions dedicated to the parsing, building and patching of firmwares
+//! to be loaded into a given execution unit.
+
+use kernel::device;
 use kernel::firmware;
+use kernel::prelude::*;
+use kernel::str::CString;
+
+use crate::gpu;
+use crate::gpu::Chipset;
+
+/// Structure encapsulating the firmware blobs required for the GPU to operate.
+#[expect(dead_code)]
+pub(crate) struct Firmware {
+    pub booter_load: firmware::Firmware,
+    pub booter_unload: firmware::Firmware,
+    pub bootloader: firmware::Firmware,
+    pub gsp: firmware::Firmware,
+}
+
+impl Firmware {
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &str,
+    ) -> Result<Firmware> {
+        let mut chip_name = CString::try_from_fmt(fmt!("{}", chipset))?;
+        chip_name.make_ascii_lowercase();
+
+        let request = |name_| {
+            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
+                .and_then(|path| firmware::Firmware::request(&path, dev))
+        };
+
+        Ok(Firmware {
+            booter_load: request("booter_load")?,
+            booter_unload: request("booter_unload")?,
+            bootloader: request("bootloader")?,
+            gsp: request("gsp")?,
+        })
+    }
+}
 
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 891b59fe7255b3951962e30819145e686253706a..866c5992b9eb27735975bb4948e522bc01fadaa2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,10 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use kernel::{
-    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude::*, str::CString,
-};
+use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::driver::Bar0;
+use crate::firmware::Firmware;
 use crate::regs;
 use crate::util;
 use core::fmt;
@@ -144,34 +143,6 @@ fn new(bar: &Devres<Bar0>) -> Result<Spec> {
     }
 }
 
-/// Structure encapsulating the firmware blobs required for the GPU to operate.
-#[expect(dead_code)]
-pub(crate) struct Firmware {
-    booter_load: firmware::Firmware,
-    booter_unload: firmware::Firmware,
-    bootloader: firmware::Firmware,
-    gsp: firmware::Firmware,
-}
-
-impl Firmware {
-    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmware> {
-        let mut chip_name = CString::try_from_fmt(fmt!("{}", spec.chipset))?;
-        chip_name.make_ascii_lowercase();
-
-        let request = |name_| {
-            CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", &*chip_name, name_, ver))
-                .and_then(|path| firmware::Firmware::request(&path, dev))
-        };
-
-        Ok(Firmware {
-            booter_load: request("booter_load")?,
-            booter_unload: request("booter_unload")?,
-            bootloader: request("bootloader")?,
-            gsp: request("gsp")?,
-        })
-    }
-}
-
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu {
@@ -187,7 +158,7 @@ pub(crate) fn new(
         bar: Devres<Bar0>,
     ) -> Result<impl PinInit<Self>> {
         let spec = Spec::new(&bar)?;
-        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
+        let fw = Firmware::new(pdev.as_ref(), spec.chipset, "535.113.01")?;
 
         dev_info!(
             pdev.as_ref(),

-- 
2.49.0


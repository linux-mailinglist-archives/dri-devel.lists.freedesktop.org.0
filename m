Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD115A9A490
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 126A210E75B;
	Thu, 24 Apr 2025 07:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f8jWkrFt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2081.outbound.protection.outlook.com [40.107.96.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94CA610E75B;
 Thu, 24 Apr 2025 07:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZTurg77bjZl6YidjfOk0Vl6sEt1/A1+32P2l+pH01a6MnbvNUB1ore+jS3uSyZbu7js7woxO+YguCAqDczhmwVsfurG00+5zYdkWG4i6jv351UAF/jCBA/B5o5lYwa2M/ugrepNpWBrtyP+z7p6frfP2Pev87frDLU+j5lgCp0Zf2j4srgXlWo2pITa9dO/cxqUFOYZEJYo7vyjPaF7SS9nFEJYBJ9e3zaaoPQJpu6i8DhwJ6Y4/c6pzXvHyxcHtkejT5wLWRs+LTTqlRs5f8sb+HmK+/jVAK7+BS7fm7E/8zd59bNcPx7JkWbACprCknofkjgdKqUWAY8KPcKADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yizEYc7oNBQDUad+59uJgO3QNYiOxufMbyXOIlFRpN0=;
 b=LrMuAtzybXukmd5HM98F0IU52uRyAO0hU9NDw2SMGR9GR1r8pN+ARz3C8x7ILH2/u1ix2AL//SDWczk0zD287cOCHrMemk5441AErYBr7/1/t3gGS5q/oanA9uQqYW4XmGME9WpbgIeeq5GXeK3tuDGVBZNVJ/00cv4I2hMdntJYEVfrDAjO+bEiwvFxIUvl5trzpC/xnjEuLKq1RPDNHgrDDbXbuQHmlTb6b04by9SfO9YhLzyWOtrBc/PUR8jqx0BMAvzIcarO62Y7X19tjWLA9N4vaLxQZRgPGkRXBbTMHE7YZAr4Yk0AnjyGcPS8AXHgle8Aqj9UjnnNbRRTAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yizEYc7oNBQDUad+59uJgO3QNYiOxufMbyXOIlFRpN0=;
 b=f8jWkrFtO9/ZWdESoMpoyobwINeK6RVfPWzBWT8rUECQHl/zCFs2MZZu6i9QQjeMG6yAiNBYTTP+PuV+pdaUVhumkQxyfqzjFYEoZOlEtjHb+PYTSwz2I8ByXYo8ZiYEEvqFYo/pgkBh4eZdHotyyAhxy/ErJDdH693Mc/j1AcH/M5ykFdTWCXaQ4kaAyZjDSFDV48lYhNu7UC7uInN4gA+wizAfaD1RrQ/heaWFfNO3HynU4vBC7jmTzBJC3OGFydzhy26O3O5VMDt7IjkHWBy9WPXqNFxO105hPQg+BTWxwcpct7PKnsITOuEGc8/TS1rz+lAKAgpdrM8DJTqySQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 07:46:00 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 07:45:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 16:45:52 +0900
Message-Id: <D9EPABWOVVYD.2H8WXZNM0BE60@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "Shirish Baskaran"
 <sbaskaran@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [5/6] gpu: nova-core: Clarify fields in FalconAppifHdrV1
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <D9EH1WXQOIO7.3RHFKYSFPBXE4@nvidia.com>
 <174546399398.876.3516508778193165894@patchwork.local>
In-Reply-To: <174546399398.876.3516508778193165894@patchwork.local>
X-ClientProxiedBy: OS0P286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9d::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9e99ca-7436-4238-ed56-08dd83040c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFBvb2piQTVQU09PdWwvdXN0VlppYkM3WlU2MW43VU85b2tzV29qR0FWWHps?=
 =?utf-8?B?M1NOaTZPNkpHWHpkZWVWTFVRQ3Z2UEFsdlZhbVJxZStvT3JNa1Z4NHpUVGZP?=
 =?utf-8?B?cXRvYXowelFWRytuWmpGZFQxUm1HUGxjVnNUU1FNc3NFejZVVStUS2NPZzYz?=
 =?utf-8?B?amo0UTZtZ1hEOXhlMVk5Vk5RMm5FSGoxY3BoNElDV1cvR1NMTjREVkF1ZWxS?=
 =?utf-8?B?bllqZnEzazRQRXdBWkVjVUovQ2hZRit5djNCQzk0dmttS0Y3U21OOEY3TjVk?=
 =?utf-8?B?OGU2MC9UNTQ0djc1c2srU0dMSElDNi82YkhxUG90YUJGQWV4dGtTWXgrQ1Nl?=
 =?utf-8?B?WGVXdGw4c29VRE0rTWE3WEh1czF4RTQyVGpSMEVzMVJwTTV5NDkrdVRjUXRr?=
 =?utf-8?B?M2pzSkhnZzRWR2hTTkJJQ1BhU3Ywc2Jnbm1TNWk3YnRFSk13cUNGdW9ycGlv?=
 =?utf-8?B?N2UvdCtycjgxYmFTSVdRUU1LVHRmL2tDZDJub0JOWUk2NUVrS0EzbHNNODJJ?=
 =?utf-8?B?Njc3eVpIOW9mL1VXZUxZZE44alAxMU13OHUzS2Z3QXJkNGtmdUtib2l6MUQ1?=
 =?utf-8?B?NTU1M2lueS9rV2k1UUp5ZkY1WFNJc01UR0V2SGRHRGZFRi85bFg3UnpRcFRp?=
 =?utf-8?B?Tmc3K09iTEFURTRrRGVYaFNsbHg3eCtmcjhRek1yVTFZbHV3ZzdCcHNnZUJF?=
 =?utf-8?B?VHAxb0xCbkZlSjVVRVlQRyttK0MvUHVFak9qUHZ6b3pFY1hoSnR1djlGYmtu?=
 =?utf-8?B?TjB3Q0M3a0hRMXZac0dmNGUzT1VuKzIwaml1WXhadllHRWE0M0FoSjZPeHJG?=
 =?utf-8?B?bFdCU0ZaRi9TbWt4V0R1QW5SZEt4a3JBS2JGT3I5aGw5OWNUaVRBL1FkbnNG?=
 =?utf-8?B?YUVsVDdBOGNuaCtLQXU4dlR3SldlNXhOU1k4SStmRkw3N2NTbnJ3WjIrVzlY?=
 =?utf-8?B?ZUt2WVVqL1Fud29qS2ZiZEVGR2JOM2VTRUVORGVWTUdibVR2YkhaTmhPd2hT?=
 =?utf-8?B?VVQ5eFdqSHhIZWhYa2prbGw5MGRsUE5HYWpCY1cvWHBFeG53eTFqZnp6WlR5?=
 =?utf-8?B?TzVVK3ZjY0lzK0x2TGhUZ3dJMGVEc29KWTZzRzIzcGdzQkt0NTJWV1l5T1pZ?=
 =?utf-8?B?NDJvQ3dkaHdrQzAvcVVtb3IzWXNBUStnM3ZObWFudUxRZ3U5b20xVjNNSUtt?=
 =?utf-8?B?SDJ1Q0FXaElzNTYvQ3VnMjhRNStuYUo5ME9pN015STA0UzdadFpqM2dRUHB6?=
 =?utf-8?B?RFU3TXIrUU15dVlvQkVnUHFzN0VjM1NBTU1kcVg4eStNQzcrUFM2aVM4R1h2?=
 =?utf-8?B?UG5zbkorK0ZiQklVcFVaeTNtaU1QU05LVUZLdGFYcDhkUDFwVlRsSXJ5aDRp?=
 =?utf-8?B?MHZOTTZ4cXNpSENmUU5rdHFuN2U1bVVBdVo4cHVpQ2IxU2FMZ1hia1hXRW1P?=
 =?utf-8?B?UHpBdEp5d0xWd2pTU3pvSE5QbkJMeEU1R2Q1OS9MbFlTNGpvNCs1UlMrYXAv?=
 =?utf-8?B?ODA5MHRud1JXQUJwNWhuMWdQb3l4dmJnQmgxUE5TN0lneE5XSXpnUkw2UVdO?=
 =?utf-8?B?NXRzdkpHaS9land1MVpIUEo4c0hCeUI4MlEzQ1lnaG9ReE9MeXNBZ2kxL3NV?=
 =?utf-8?B?N1RNQjA2Z2NxK1d3OFZSMVd6aXJYUE5veVBmckROOC9EejNTYnAxLy94enhT?=
 =?utf-8?B?TTVteGZCSDdRTFdEOWdSRDJFMklwMTUycDZlNEJKL1I0bzFuZVpYZW5VaFhi?=
 =?utf-8?B?RGloU3hRamcvblJsUGtSRDdtSmE1eDM5UXJTanBoTi9BdE1aTkpJVFlpVDUr?=
 =?utf-8?B?UkUyU1JhSzF0U0I1TmZVbjBWUWp2aW9MVWFyU2xPM3NjR255TGpEcEt0Tm5o?=
 =?utf-8?B?RThrK2l5bVloeUwxMlc0djB6bVVwZVhwbGcrdkEyTk9rQWZRNWZKd2R6RTMx?=
 =?utf-8?Q?xJfrHcTVEMg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yi9jUCtKRHRPbWdiL0Y5OHpsTTRtY3hMVXpyUkJuQnZ1MVVkdVNQTXd0WTNm?=
 =?utf-8?B?dmszdHFKSkt2b0lTZFo1dkxLZFYyN2ljNzBMbUVMejhaT2habjlWUURISnBk?=
 =?utf-8?B?dVQ2T1lRdlR2cDJsWlpIN2FldFo2ZWhOenE1NTNKZlhNcHNPcjVrTjB5Q1Az?=
 =?utf-8?B?UWF5NXVhdldGSXF3cVlMcDRuZnB1aVFDVkE0enRxamorQkcwdjdmM0U3RHFr?=
 =?utf-8?B?N2R0UVBGWkJ5MEtZZkZnL0tkd0JVZkl2MTVEZVo5RWdBRnFVQmsxYWllS3ZD?=
 =?utf-8?B?ckk1SWllR01VZWFBSVlJeElNWkhyLzVLdTRKNkgwNUVteXZ3RUJTdFVoWGJR?=
 =?utf-8?B?Umt5dnEra3NDMXFVbkdOSUxxQ0cvSEdSZDBoNVQ1QWJFUHlvTWhvam9ERW5a?=
 =?utf-8?B?ZHYrcEdCUFpmeTd5cHVkREFVa09IUy9uYlZ6clZNZUs5T0w2cUFSVWtXR2dL?=
 =?utf-8?B?VmplbTlvd2tHb2QrelZIZE5mZnFZR1lIU3lEYmNFSHVaVldscjQ3UkJJOGpU?=
 =?utf-8?B?L0dwVzZRSFZqTXdVVzhCSlNBekc5c3JIZzJ4V2RmQXltbzc1YkxTWkpsS1JI?=
 =?utf-8?B?SUswYTdLTGlNY2FaYVdsMGtNT0p1Rk90OUhOQ1JnYlZ1OGIxVUdLSFJQdzlQ?=
 =?utf-8?B?YlFxU2h4TjZiT3R6enh2TTNWeGhPVnBJTTAwbzdTbStrOTY3SWJHU1dYL09U?=
 =?utf-8?B?RVBmZkx0NnJhU1c1Z0hUbWJhc3FKTTR4VkIwU29iY2xmY1FnUmVaeWVCUXg4?=
 =?utf-8?B?d1ZQTGJhK0hOdVYxbVd5di9ZV0hkdFdSZmJSajl1K2Y1Q2hVLzErYjB4OW5n?=
 =?utf-8?B?NXlxSFZ5eXdRTldvZDBieHM5SWk3Q0M0VFZXRUt1YkxIQkx5ZjE2WnpIRnlk?=
 =?utf-8?B?bEZpSGdLdGtBejhEcllzUk53MDlrT0QvZWRvM0RQbklwdVVzOHFoVzA2Y0dq?=
 =?utf-8?B?dy9FSlRham5NUklhRWdoenZCMmhSTjJINFpWYkJYamlPSnpnLy9iYmVEWjls?=
 =?utf-8?B?M0xid0lEcEU1Z0NoV010bUxpZHRDbjh2ZXJESWRndm0rbk1pcTdJN0Q4ZzRE?=
 =?utf-8?B?dG1vUXJCYXc0YkJ5MjdPdjc5V3poWUgxbUZOVUVoKyswQ3ZwcWdObVVSQ0NY?=
 =?utf-8?B?MDFtWCszQm9TMGplRUo1NWxlaEFIR3ZIUndjMmFCclRPdjh5emowTFhQbUdx?=
 =?utf-8?B?RldNTzQ0dHhjT0VXaWF4MXdUOWhJVTg5NnU5WGZpUWdhWlRpSHI4SmJ1MDdn?=
 =?utf-8?B?YldGZUJnQ3RDVXJnZ0RETituR1dXRVJJSlAwcmVDNC9qaWYyQm14RDlWdGxG?=
 =?utf-8?B?VUdrcTMxRmd0a1hrWnpzcUtPTzVsNXJCcURiU3M4T0NaR1VOQWw2am5YZWIv?=
 =?utf-8?B?YzJBS3JaWmFzRWdJRmhwc1NtclBGUEUwV2NrUGFsaERDVGRaSWtIdGJYYU5R?=
 =?utf-8?B?aGVNWjFuT09Tdm5sZVZSZlNMcE9OMnlyeTl3M3FvU0lvMURCd0xCRG05b0dB?=
 =?utf-8?B?dzEzRDg5NmVENG4rOVV0T3FaMHA3aTEyQkpJSWM4dDJmQVJIK2hIbi9mM3hB?=
 =?utf-8?B?UW4wQ0NBMVRzWmthd0R4MlQxa3ZTMlBHMXFNL2F2RlFHenlLVUQvc3hZWlIr?=
 =?utf-8?B?ZVNSRGFhemFVNkc0ZTAzSzBiT2w0TkdJMFhzbFdTYTN4NzZ0ditMMVZuR1F4?=
 =?utf-8?B?YXFpRE9zQVhkb1JyTmgvS3VqSFErL3BycjdPcE9xM3dZL1E2bGVVNVVqRWxx?=
 =?utf-8?B?cnhEYkp1dDJEV21XMndaOGpNcFdmVXJ4cGI0VDU5Z21wRFRENmxPOTFtWjh1?=
 =?utf-8?B?ZTVWL3Bsa3g2TnZDd0swWHpPTWQ1ZlZadmwwVTIvQmR5ZzF5dlFrRmo4OHFq?=
 =?utf-8?B?aENtNGtQWTIxdDkvek5QbVFzeFUxMkxMaHJLN3RHMWxDb0JyeUdVWU1lcUNE?=
 =?utf-8?B?QW5VUU5RVFJWR3E1c0pLd213alplOHF3WGNBS0pYWVJhc0lJdVo5SGtEcVJX?=
 =?utf-8?B?cVpYSjkvMFJnd1RDWVQ0ZEphdmtMNGRoTzhkb0ZaTFNEcG1WdFpXQ2RBNVF4?=
 =?utf-8?B?amppSUNkcGFuaVBhbkJWNmlCQjNEMG5Qb280NUVvRDcySUM3a0dKNnluU01Y?=
 =?utf-8?B?UnZaU1FYUGNyTE9iUGUxR1YxRC9VZEgwUDh6djd2TlpGZFdYdnZ3ZENZUHkx?=
 =?utf-8?Q?yzs26f4is37xcGzg95ZOmRRkL6G0C51DOS/Yl6KlHCBW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9e99ca-7436-4238-ed56-08dd83040c8f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 07:45:59.7481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VEqMH1gOZtQECfD3LJlOLIo27V59D09SgQLtYzNS8reWWUIZ+vm9Sju7EiNid9q/SF+mGsjwIj/DzccOrMGVrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035
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

On Thu Apr 24, 2025 at 12:06 PM JST, Joel Fernandes wrote:
> On April 24, 2025, 1:18 a.m. UTC=20
> Alexandre Courbot wrote:
>> Since this just renames fields, would you be ok if I squashed this one
>> into the relevant patch of my series, alongside a
>>=20
>> [joelagnelf@nvidia.com: give better names to FalconAppifHdrV1's fields]
>>=20
>> ?
>
> Yes, sounds good to me. Thanks!

Ah, but since the documentation for FalconAppifHdrV1 references
fwsec.rst, which won't exist in my branch, I will only squash the new
fields names - please make sure to carry the FalconAppifHdrV1's
doccomment into another patch!

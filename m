Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE97BAC5B6D
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 22:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F294310E065;
	Tue, 27 May 2025 20:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HifTPvvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2052.outbound.protection.outlook.com [40.107.212.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ACB10E065;
 Tue, 27 May 2025 20:38:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bX61XFp1RQDwdoxMesrPKUe6pY092BSiDbtEtTmjClfRn7pvfX7qh9GPT2ubGJ3xft3gfL0u+ia3GEYKI9VginN7qaI3Ruhu2cgaq8RhS6MEO7JtBfmMSFYbT0wWapxy+YtxOXOR+76Td2bd4lpeX1C/x1zNeJMx/yuSFWiF9qlpIqk+hAFvtv4oviFiFORwquwB6kflaJ9QYhzINrqwR9k583Tw0ESSYTYpCrtgyTO3D+/LfEs9YVrFb0lODcOuQxRrVJlYa1jYv9k6bdTgArIplkRsBkbpmxvAHQYVeoRscQ7QYeMh85clsqSP4ETufyq/nDTqbGUMoF3wd2xQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PE1J96z5HypmTSxFSay3tfGLUWPIL2ubzY7gPpVMJN0=;
 b=PlV2e1U3iqnmrspVSpZ/sTY1gwCRy1EObW0LxyVfaMOrkrUkYgy5yAoyzFmSmkmM9NSemVsDVDaF197IUqyWkpMbgFA26Hda1LMXleJLXlXQ/tf3YHEZti8iinUF9g9FBNTJv30JLspUETEcWnxi7Iw74w7RJllvYCafXef4kCeX7jY7LCtNWBhwKLZ6iWS9iDdB/WJOURFeDKU4B/J7RgqnE37WtXO1K/r1k+S9bw6qHYMx3GIqqC7l/Gv6IpHa1rRRUDc08ETDT+P9D6JSmZrne6m61ghFcsv2+w4VXGOJ5eHp5Z0rt3RVW7rDASKueMajPSuISSQsWqjkI+bKcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PE1J96z5HypmTSxFSay3tfGLUWPIL2ubzY7gPpVMJN0=;
 b=HifTPvvH7LfWCKfNuDaa6rv6p4zWmve+OHqk6IV0OXuqU2gIjqccmeeaNYfMHxT6UunDoeuU1+lGPfqTgx9oQnx+znB9HVTZ5JKA7y2t97h4zEUZbpLfLzqnhOIZ/XmZU1Scbrtzg1OjeDGtqwBGAMPgZd7CrhqTcb2eER+5zmh5oQnqCaJuCa1XZW8r/fni4UGWeYskVKhK7TMjT34/BJkbP0Wp3ViwClaER+v9qjXv7aKBUH5TTq3DqA4fX/fFZhI+Rj22AdHOt1tlTLLgpAfyhUXfKpERt3HPps+xKjhGVi3ckXYjXmzxFt49yVPIPh+LS0gPIwwZ/awDBvXZDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW6PR12MB8950.namprd12.prod.outlook.com (2603:10b6:303:24a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 20:38:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 20:38:17 +0000
Message-ID: <ab30d5f1-d2fa-4e75-8153-b2d3870a70a1@nvidia.com>
Date: Tue, 27 May 2025 16:38:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/20] nova-core: Add support for VBIOS ucode
 extraction for boot
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Shirish Baskaran <sbaskaran@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-16-05dfd4f39479@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:208:329::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW6PR12MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 632da996-f65f-43c3-62a4-08dd9d5e68cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V214WDQyb2hHRkxtckFTemIwdWZRSzJ0WEZBc09Bd0NqaGpheTBDTWVxN1cz?=
 =?utf-8?B?ZklFMW5WbmJOampPTWZFaVExdWpaNlpiQjcyTE9rRWdHY1RJRWVYQjhUSWdU?=
 =?utf-8?B?K1Qzb3M4ek15RjZhbFhSbzlua3dBYjJsRnowWWwyTUNDRkU3Y2c1enptUHVD?=
 =?utf-8?B?WDNXZWYzWkdES1QyOFBKSHQwb3lXM3BhbkNOeDdodVZ3STRVdW12UDBoa1dX?=
 =?utf-8?B?SU00SEp4Z0hHZm9pYTFVdEQ4VEMyZ2psdllPK0ZKU1Z2ZFNXekJMVlh5bFI1?=
 =?utf-8?B?WTRKeDFiTXdXZTgvMFMvVjJYZkh3eWp6OFBGVmNzZ3NTcWJmeWNqeERselJB?=
 =?utf-8?B?M0pSejBxQmlLR0RLMFJGczlPeVB1UndtY3hHdFdZSnArQ0xjeHFPbTh6ZlBt?=
 =?utf-8?B?dHR1NEFRVTVQbTBDcUdUMTgwRlRhVXFDWDJuZGFBeGJyTzU1cHBLRFdaVzRa?=
 =?utf-8?B?Z3o1R2s5bERiZDdpdldhTzNDcHBDWUJXdmNwTW1xUGlIRis0Q1B2cTIrMXBC?=
 =?utf-8?B?ZHpES2o1SFIxb3k5Z1hCN2VnZENsbjEwbkxZTWZUTnZBYUdvUkFobVh2ZjJL?=
 =?utf-8?B?TVJ2T1RPSStDbjFvQkJ5U0Q5RWpld2J5eEwrRVpIRjVvUE14eUNwcFpxeGgy?=
 =?utf-8?B?VFVCcTM2VGRsanZnRnRXbXowcHhvUThDRm1HUnljcTEyelF5S3Q4eFNYUzhL?=
 =?utf-8?B?TjhneEJsRFB5VDlzeEI4Vk5UZFVTd0tvVktRQzR5Z0RQSVdKSUxhRno5c1la?=
 =?utf-8?B?bm56NHdTTG1OblhYek5MM1dOMUo0N3JWSHhaSVdka3k0NXpWTnNrNU1Jd1By?=
 =?utf-8?B?b3VlUVBJNDdwK041YmFvUmhCaXZJbzNmMGJ4dURNeVFyN0FpeTFBQ3JPb3VU?=
 =?utf-8?B?UGFhOU5lcHh2ZjkvNS9nNnQ1dmVwWGVwV1pCQ3ErTjh4TGZZaXNSZW9HZjh3?=
 =?utf-8?B?cllhYnFpT29BREhBbHpQOG43ODkvKzhKVHM0alFZZEplU2Q3K0JaV01hVWJI?=
 =?utf-8?B?WUsyYWhyUUZhVGNtMU5ZVUVPclR0MHBBVWtQbTlYeTlNMUlCMHZLbUN0dHFG?=
 =?utf-8?B?VFg2cGtGTFhsS3A2NUR1NWRMY1MvZnllRFNWMmRJVkY5SGRCNTdzaXNkRDcz?=
 =?utf-8?B?cndCQXhlL0ZnUnlCQUJGUm9oSkthaSt4d2NJMUtqS25XVlFXSmJkK2RCSE1u?=
 =?utf-8?B?OWFIL1hXS0VMR3Z5T0xabDUyK08rNVRWMmRITVdTbm04Vm8yMEY1UW9QckdI?=
 =?utf-8?B?MnErb2IzRFN0QUlURTNBWVRtSzUxYjZaSHBYODhvUnFjUGxrN0JUREtGV3pN?=
 =?utf-8?B?eHU4YXlNOWFRa2pDcUIzdlNaSGhYekRjbHh4SlM0cXBjbmJsS0lrN0FWcTdk?=
 =?utf-8?B?RzdmaHJ4UlN6Wlh2djFOQm1UTURGTzN4WUFwVG91am1neW5kUkZDOWVZVUpm?=
 =?utf-8?B?NkwyaFQxdDlCc1FSUzU2allBaUtWR3BSaXlaak1QSVc3eVFTSzFPbi95Nm9p?=
 =?utf-8?B?ZlYxMVNaSXE3RHExZHpENW8yYWo2eGpHVkpsazBIUDl5cFN4QmovSGIxL0lv?=
 =?utf-8?B?UHNraWxXYzZkbFI2SStGVURlajB3akMzYmFDeDlPSmpDVlFKcyt1N2UzRDZX?=
 =?utf-8?B?WDZmQWJxZkw5SWpteGYrTGgwTHNtOWRjcTlJWUJWWVB3NWgyODZjT21wYkhn?=
 =?utf-8?B?aTFlcVQ1THJPQjh3REFuM2tkRFBkS1cyRmU3TGFseVVmd01kdzBaY0xqcDdF?=
 =?utf-8?B?UndmcHA5ZEd0U3BUR0ViY0pYS1ZrZit3S2YyNlBhUmpSeFMzM1hWZi9TalBC?=
 =?utf-8?B?d0FjSjlyaUcyZXBWOWtXQVd1YkpUakJSelNDWVNObFFYWWZIOUl3MUpROXJz?=
 =?utf-8?B?dUE1K0d4NjQwQWhEUHlMR0luL3JpMnpQRFIzVWpTenNsenc1V1VHY2kzdDVN?=
 =?utf-8?B?czExVnJTQy93cllEeXk0V0lKMWdMTE1PbkllOW1NRExIcW9nZGJyeUs2TE43?=
 =?utf-8?B?bDJpdnIya0hnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUpUYW50ZWxkUytud003K2tFbXlsak0rM0VaeElCQmI1UGRKb3hLaHQ3NjVH?=
 =?utf-8?B?Yk9mMXNhUmMyUCtnQ3Q2RXZvMDBOMVJHQ29tTTNzeFdEeFgwRGQyYWpHbVRi?=
 =?utf-8?B?Y0NLaFROeitOUjdjck1BNGVIRjJhamE4MlV5SXNtRkJVOGY3dE9SOVhzODNK?=
 =?utf-8?B?d3FiaGNsWDR3NDIwek1nVGd3VWtUcGNPd1FpeUFOTklpTzRqcUoySlRhMWJW?=
 =?utf-8?B?dnRWczRlVERXMndlWDNINHU2dS9pU2ZNMGtHaDI4NWFRS3l5QUhkSlB2SHJZ?=
 =?utf-8?B?YU84NWQ2THpwSkViakhNOHBTdnh4dnFJeGhJa1lqU3RhZHkzQVl4OGg5bDAv?=
 =?utf-8?B?T2NYZjlMOWJRYmRYUCtEVE9ZTXMwNVorMlc4RnlDL2szRkZEK21oSGVzS210?=
 =?utf-8?B?SEIvbDM0ZnNKQURSQnhRcmJ2bnlrUStDNU1xT2k3TEZhNmtmWHVicHczWnU2?=
 =?utf-8?B?VVdob0tTTzBwRmFvc3pTOWp3V1IxL2Qrb1FSWVhvNXBkNHFaQ1NLdW1DVml4?=
 =?utf-8?B?TG53cFNvNDhFcy90TVdKVFRkNHdPbkNZQ3Fmc25qUXVlbGhkNXRYRHF0SFJN?=
 =?utf-8?B?ajQ0ZHpDMXlXNzdZLzhUczBaTnNzeFNKT3dDWGoyaE1uMnFuVzZoazVqVWdu?=
 =?utf-8?B?NmxjSmdzMmdZRzRoL0tkMDZuZzVOVzVSSGY0elRvUlM5VHc3M2pQdmJWQ1ZX?=
 =?utf-8?B?MDBCUkp1K08rWHRxQkM4MkFvMFhEK1pOZktHRFJiSHBISS85bXJ4dm5hYmJL?=
 =?utf-8?B?amp5ZzNTNVRZMTJrVERSanc1c1BVdkxseUZ0N0dveGVnR0RUb2pieDhabitn?=
 =?utf-8?B?QndvMXRJRW0ydzdtampDNHlaMndQYkNyc2RTaXZKT1E1Y3p6RWVwaGVKOGlo?=
 =?utf-8?B?TDBjemt6cnllQXl1WElRckZJbnVxTVlpYnk4emE0UVNES2lja0FkNmRUSFpn?=
 =?utf-8?B?MVJmZ2txMUREUEExZ2JsOTExb3NDWmRxSExYMTRlUXp5OUNmN01MRHZ3WkRr?=
 =?utf-8?B?WjRoRUpuaGNMUDE2bzJQM2pTVkpnV2R0M3kwZmFNRTdTN3doTHFDN0J1Vkly?=
 =?utf-8?B?NkIya3NpNUlwbUthT0xjN00wQnFBVStDV2xiQmp1U1B3SEF6NkMvZFhlcU04?=
 =?utf-8?B?SUlWZld3cHpYcGZ4cUUwSEpmNEJwWktVMTR1WkJlLzAyU1hDZlFubGNtTVlD?=
 =?utf-8?B?MU9DK1JiOTVmLzBBZG9oNEdlTEhVajJDNUd3MkNGOWZyUFljRllIa1BKbFNY?=
 =?utf-8?B?a0VmYUt2TlJ2Um91dVNCTlI5RStkbWhUa3ljVHBIenRES0VlK1hFaHBxaEwz?=
 =?utf-8?B?YXdKamQ1R2xOTW1nbSswZDhmczExZ054dW9ZbVJBUHd2eVNZamRycFlLTDlH?=
 =?utf-8?B?QkZuaWU3OVoyUWQ2d3ZuVmxINjhSeUc1OFd2NzdRMWlUOTBOVHd3Q29NelZ0?=
 =?utf-8?B?dldkMUFyRm1iRkM3VnZHZ0FnNGQ0ZVlkOExKZmVpN2hSK1ZJSE5GNE16T1hQ?=
 =?utf-8?B?STl3d3VNVlBId2hTSHhLNjVtNzNqak9wN1Z2SVowNi9OODlxWEt4SkFtc05U?=
 =?utf-8?B?SHk0ME5JUUt2akNLbUdVa1JsekdlcTFSOGVDRk5CQUdnSWpZUU9EVThaYTlp?=
 =?utf-8?B?YkpDN1c0OGhUUzN6NFB1RWlNY3d5eW1DYW0yRUpuYnpmcU8vQVJIaE1LQ2RG?=
 =?utf-8?B?dnZOQkJRbHh4NGhLdkovOTJUL3NiZjRFM3Y0b29nejlVZTN2T0Nia0w1a1cr?=
 =?utf-8?B?ZmdmdkZPUmdVRlp1LzVSN0J4UWpKMGtIUWpLajJ2SGhvTjYramJDOVAram0r?=
 =?utf-8?B?UlNBQmNUaW0zZWcyMVlmb3lySWR0aThvZVdXbWZrR2JVR3ZTM1A3QkZlVVhF?=
 =?utf-8?B?Z2RhcVg3YnlUVS92bzZ6OTkwMXNTQUdkVVBjdktzdmx5T05RTFJUWEN4KzhF?=
 =?utf-8?B?WEtCVnlCandaMlZycm52em1rTHFoS1ZGQytSVzZNRmVKNWc5L1FHcmFRRlZD?=
 =?utf-8?B?WGU5cnBHUzhEMUZYQUxReWpycnRWVzF6VjgvS1VDOWNvREdjK01DQUgrOG83?=
 =?utf-8?B?QnQzR09GU2hNQStMTmlScnJyVWtJMW83eFQ5M2dHbllYeGlLd2UyZE56Q2FW?=
 =?utf-8?Q?CQqNTCt5eICugebu2LQmAr1XV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 632da996-f65f-43c3-62a4-08dd9d5e68cd
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 20:38:17.0166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QefQivhixnW1PJrNCJPPEowejYp0KWlR/k7JaMAGglIXC9WGkxCHF6U50xF38TJYr28LfEsCGgI/MjBtUUUaRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8950
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

Hello,
I split this particular patch into 3 patches:

gpu: nova-core: vbios: Add support for FWSEC ucode extraction
gpu: nova-core: vbios: Add support to look up PMU table in FWSEC
gpu: nova-core: vbios: Add base support for VBIOS construction and iteration

It is code-wise identical. Alex/Danilo can you pull these 3 for next posting or
applying?

git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
tag: vbios-for-alex

thanks,

 - Joel


On 5/21/2025 2:45 AM, Alexandre Courbot wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Add support for navigating and setting up vBIOS ucode data required for
> GSP to boot. The main data extracted from the vBIOS is the FWSEC-FRTS
> firmware which runs on the GSP processor. This firmware runs in high
> secure mode, and sets up the WPR2 (Write protected region) before the
> Booter runs on the SEC2 processor.
> 
> Also add log messages to show the BIOS images.
> 
> [102141.013287] NovaCore: Found BIOS image at offset 0x0, size: 0xfe00, type: PciAt
> [102141.080692] NovaCore: Found BIOS image at offset 0xfe00, size: 0x14800, type: Efi
> [102141.098443] NovaCore: Found BIOS image at offset 0x24600, size: 0x5600, type: FwSec
> [102141.415095] NovaCore: Found BIOS image at offset 0x29c00, size: 0x60800, type: FwSec
> 
> Tested on my Ampere GA102 and boot is successful.
> 
> [applied changes by Alex Courbot for fwsec signatures]
> [applied feedback from Alex Courbot and Timur Tabi]
> [applied changes related to code reorg, prints etc from Danilo Krummrich]
> [acourbot@nvidia.com: fix clippy warnings]
> [acourbot@nvidia.com: remove now-unneeded Devres acquisition]
> [acourbot@nvidia.com: fix read_more to read `len` bytes, not u32s]
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Shirish Baskaran <sbaskaran@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs  |    2 -
>  drivers/gpu/nova-core/gpu.rs       |    4 +
>  drivers/gpu/nova-core/nova_core.rs |    1 +
>  drivers/gpu/nova-core/vbios.rs     | 1161 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 1166 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index f675fb225607c3efd943393086123b7aeafd7d4f..c5d0f16d0de0e29f9f68f2e0b37e1e997a72782d 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -76,8 +76,6 @@ pub(crate) struct FalconUCodeDescV3 {
>      _reserved: u16,
>  }
>  
> -// To be removed once that code is used.
> -#[expect(dead_code)]
>  impl FalconUCodeDescV3 {
>      pub(crate) fn size(&self) -> usize {
>          ((self.hdr & 0xffff0000) >> 16) as usize
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 3af264f6da8025b5f951888d54f6c677c5522b6f..39b1cd3eaf8dcf95900eb93d43cfb4f085c897f0 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -9,6 +9,7 @@
>  use crate::gfw;
>  use crate::regs;
>  use crate::util;
> +use crate::vbios::Vbios;
>  use core::fmt;
>  
>  macro_rules! define_chipset {
> @@ -238,6 +239,9 @@ pub(crate) fn new(
>  
>          let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
>  
> +        // Will be used in a later patch when fwsec firmware is needed.
> +        let _bios = Vbios::new(pdev, bar)?;
> +
>          Ok(pin_init!(Self {
>              spec,
>              bar: devres_bar,
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index b99342a9696a009aa663548fbd430179f2580cd2..86328473e8e88f7b3a539afdee7e3f34c334abab 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -10,6 +10,7 @@
>  mod gpu;
>  mod regs;
>  mod util;
> +mod vbios;
>  
>  pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
>  
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..d873518a89e8ff3b66628107f42aa302c5f2ddca
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -0,0 +1,1161 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! VBIOS extraction and parsing.
> +
> +// To be removed when all code is used.
> +#![expect(dead_code)]
> +
> +use crate::driver::Bar0;
> +use crate::firmware::FalconUCodeDescV3;
> +use core::convert::TryFrom;
> +use kernel::device;
> +use kernel::error::Result;
> +use kernel::num::NumExt;
> +use kernel::pci;
> +use kernel::prelude::*;
> +
> +/// The offset of the VBIOS ROM in the BAR0 space.
> +const ROM_OFFSET: usize = 0x300000;
> +/// The maximum length of the VBIOS ROM to scan into.
> +const BIOS_MAX_SCAN_LEN: usize = 0x100000;
> +/// The size to read ahead when parsing initial BIOS image headers.
> +const BIOS_READ_AHEAD_SIZE: usize = 1024;
> +/// The bit in the last image indicator byte for the PCI Data Structure that
> +/// indicates the last image. Bit 0-6 are reserved, bit 7 is last image bit.
> +const LAST_IMAGE_BIT_MASK: u8 = 0x80;
> +
> +// PMU lookup table entry types. Used to locate PMU table entries
> +// in the Fwsec image, corresponding to falcon ucodes.
> +#[expect(dead_code)]
> +const FALCON_UCODE_ENTRY_APPID_FIRMWARE_SEC_LIC: u8 = 0x05;
> +#[expect(dead_code)]
> +const FALCON_UCODE_ENTRY_APPID_FWSEC_DBG: u8 = 0x45;
> +const FALCON_UCODE_ENTRY_APPID_FWSEC_PROD: u8 = 0x85;
> +
> +/// Vbios Reader for constructing the VBIOS data
> +struct VbiosIterator<'a> {
> +    pdev: &'a pci::Device,
> +    bar0: &'a Bar0,
> +    // VBIOS data vector: As BIOS images are scanned, they are added to this vector
> +    // for reference or copying into other data structures. It is the entire
> +    // scanned contents of the VBIOS which progressively extends. It is used
> +    // so that we do not re-read any contents that are already read as we use
> +    // the cumulative length read so far, and re-read any gaps as we extend
> +    // the length.
> +    data: KVec<u8>,
> +    current_offset: usize, // Current offset for iterator
> +    last_found: bool,      // Whether the last image has been found
> +}
> +
> +impl<'a> VbiosIterator<'a> {
> +    fn new(pdev: &'a pci::Device, bar0: &'a Bar0) -> Result<Self> {
> +        Ok(Self {
> +            pdev,
> +            bar0,
> +            data: KVec::new(),
> +            current_offset: 0,
> +            last_found: false,
> +        })
> +    }
> +
> +    /// Read bytes from the ROM at the current end of the data vector
> +    fn read_more(&mut self, len: usize) -> Result {
> +        let current_len = self.data.len();
> +        let start = ROM_OFFSET + current_len;
> +
> +        // Ensure length is a multiple of 4 for 32-bit reads
> +        if len % core::mem::size_of::<u32>() != 0 {
> +            dev_err!(
> +                self.pdev.as_ref(),
> +                "VBIOS read length {} is not a multiple of 4\n",
> +                len
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        self.data.reserve(len, GFP_KERNEL)?;
> +        // Read ROM data bytes and push directly to vector
> +        for addr in (start..start + len).step_by(core::mem::size_of::<u32>()) {
> +            // Read 32-bit word from the VBIOS ROM
> +            let word = self.bar0.try_read32(addr)?;
> +
> +            // Convert the u32 to a 4 byte array and push each byte
> +            word.to_ne_bytes()
> +                .iter()
> +                .try_for_each(|&b| self.data.push(b, GFP_KERNEL))?;
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Read bytes at a specific offset, filling any gap
> +    fn read_more_at_offset(&mut self, offset: usize, len: usize) -> Result {
> +        if offset > BIOS_MAX_SCAN_LEN {
> +            dev_err!(self.pdev.as_ref(), "Error: exceeded BIOS scan limit.\n");
> +            return Err(EINVAL);
> +        }
> +
> +        // If offset is beyond current data size, fill the gap first
> +        let current_len = self.data.len();
> +        let gap_bytes = offset.saturating_sub(current_len);
> +
> +        // Now read the requested bytes at the offset
> +        self.read_more(gap_bytes + len)
> +    }
> +
> +    /// Read a BIOS image at a specific offset and create a BiosImage from it.
> +    /// self.data is extended as needed and a new BiosImage is returned.
> +    /// @context is a string describing the operation for error reporting
> +    fn read_bios_image_at_offset(
> +        &mut self,
> +        offset: usize,
> +        len: usize,
> +        context: &str,
> +    ) -> Result<BiosImage> {
> +        let data_len = self.data.len();
> +        if offset + len > data_len {
> +            self.read_more_at_offset(offset, len).inspect_err(|e| {
> +                dev_err!(
> +                    self.pdev.as_ref(),
> +                    "Failed to read more at offset {:#x}: {:?}\n",
> +                    offset,
> +                    e
> +                )
> +            })?;
> +        }
> +
> +        BiosImage::new(self.pdev, &self.data[offset..offset + len]).inspect_err(|err| {
> +            dev_err!(
> +                self.pdev.as_ref(),
> +                "Failed to {} at offset {:#x}: {:?}\n",
> +                context,
> +                offset,
> +                err
> +            )
> +        })
> +    }
> +}
> +
> +impl<'a> Iterator for VbiosIterator<'a> {
> +    type Item = Result<BiosImage>;
> +
> +    /// Iterate over all VBIOS images until the last image is detected or offset
> +    /// exceeds scan limit.
> +    fn next(&mut self) -> Option<Self::Item> {
> +        if self.last_found {
> +            return None;
> +        }
> +
> +        if self.current_offset > BIOS_MAX_SCAN_LEN {
> +            dev_err!(
> +                self.pdev.as_ref(),
> +                "Error: exceeded BIOS scan limit, stopping scan\n"
> +            );
> +            return None;
> +        }
> +
> +        // Parse image headers first to get image size
> +        let image_size = match self
> +            .read_bios_image_at_offset(
> +                self.current_offset,
> +                BIOS_READ_AHEAD_SIZE,
> +                "parse initial BIOS image headers",
> +            )
> +            .and_then(|image| image.image_size_bytes())
> +        {
> +            Ok(size) => size,
> +            Err(e) => return Some(Err(e)),
> +        };
> +
> +        // Now create a new BiosImage with the full image data
> +        let full_image = match self.read_bios_image_at_offset(
> +            self.current_offset,
> +            image_size,
> +            "parse full BIOS image",
> +        ) {
> +            Ok(image) => image,
> +            Err(e) => return Some(Err(e)),
> +        };
> +
> +        self.last_found = full_image.is_last();
> +
> +        // Advance to next image (aligned to 512 bytes)
> +        self.current_offset += image_size;
> +        self.current_offset = self.current_offset.align_up(512);
> +
> +        Some(Ok(full_image))
> +    }
> +}
> +
> +pub(crate) struct Vbios {
> +    fwsec_image: FwSecBiosImage,
> +}
> +
> +impl Vbios {
> +    /// Probe for VBIOS extraction
> +    /// Once the VBIOS object is built, bar0 is not read for vbios purposes anymore.
> +    pub(crate) fn new(pdev: &pci::Device, bar0: &Bar0) -> Result<Vbios> {
> +        // Images to extract from iteration
> +        let mut pci_at_image: Option<PciAtBiosImage> = None;
> +        let mut first_fwsec_image: Option<FwSecBiosPartial> = None;
> +        let mut second_fwsec_image: Option<FwSecBiosPartial> = None;
> +
> +        // Parse all VBIOS images in the ROM
> +        for image_result in VbiosIterator::new(pdev, bar0)? {
> +            let full_image = image_result?;
> +
> +            dev_dbg!(
> +                pdev.as_ref(),
> +                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
> +                full_image.image_size_bytes()?,
> +                full_image.image_type_str(),
> +                full_image.is_last()
> +            );
> +
> +            // Get references to images we will need after the loop, in order to
> +            // setup the falcon data offset.
> +            match full_image {
> +                BiosImage::PciAt(image) => {
> +                    pci_at_image = Some(image);
> +                }
> +                BiosImage::FwSecPartial(image) => {
> +                    if first_fwsec_image.is_none() {
> +                        first_fwsec_image = Some(image);
> +                    } else {
> +                        second_fwsec_image = Some(image);
> +                    }
> +                }
> +                // For now we don't need to handle these
> +                BiosImage::Efi(_image) => {}
> +                BiosImage::Nbsi(_image) => {}
> +            }
> +        }
> +
> +        // Using all the images, setup the falcon data pointer in Fwsec.
> +        if let (Some(mut second), Some(first), Some(pci_at)) =
> +            (second_fwsec_image, first_fwsec_image, pci_at_image)
> +        {
> +            second
> +                .setup_falcon_data(pdev, &pci_at, &first)
> +                .inspect_err(|e| dev_err!(pdev.as_ref(), "Falcon data setup failed: {:?}\n", e))?;
> +            Ok(Vbios {
> +                fwsec_image: FwSecBiosImage::new(pdev, second)?,
> +            })
> +        } else {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "Missing required images for falcon data setup, skipping\n"
> +            );
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    pub(crate) fn fwsec_header(&self, pdev: &device::Device) -> Result<&FalconUCodeDescV3> {
> +        self.fwsec_image.fwsec_header(pdev)
> +    }
> +
> +    pub(crate) fn fwsec_ucode(&self, pdev: &device::Device) -> Result<&[u8]> {
> +        self.fwsec_image.fwsec_ucode(pdev, self.fwsec_header(pdev)?)
> +    }
> +
> +    pub(crate) fn fwsec_sigs(&self, pdev: &device::Device) -> Result<&[u8]> {
> +        self.fwsec_image.fwsec_sigs(pdev, self.fwsec_header(pdev)?)
> +    }
> +}
> +
> +/// PCI Data Structure as defined in PCI Firmware Specification
> +#[derive(Debug, Clone)]
> +#[repr(C)]
> +struct PcirStruct {
> +    /// PCI Data Structure signature ("PCIR" or "NPDS")
> +    signature: [u8; 4],
> +    /// PCI Vendor ID (e.g., 0x10DE for NVIDIA)
> +    vendor_id: u16,
> +    /// PCI Device ID
> +    device_id: u16,
> +    /// Device List Pointer
> +    device_list_ptr: u16,
> +    /// PCI Data Structure Length
> +    pci_data_struct_len: u16,
> +    /// PCI Data Structure Revision
> +    pci_data_struct_rev: u8,
> +    /// Class code (3 bytes, 0x03 for display controller)
> +    class_code: [u8; 3],
> +    /// Size of this image in 512-byte blocks
> +    image_len: u16,
> +    /// Revision Level of the Vendor's ROM
> +    vendor_rom_rev: u16,
> +    /// ROM image type (0x00 = PC-AT compatible, 0x03 = EFI, 0x70 = NBSI)
> +    code_type: u8,
> +    /// Last image indicator (0x00 = Not last image, 0x80 = Last image)
> +    last_image: u8,
> +    /// Maximum Run-time Image Length (units of 512 bytes)
> +    max_runtime_image_len: u16,
> +}
> +
> +impl PcirStruct {
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        if data.len() < core::mem::size_of::<PcirStruct>() {
> +            dev_err!(pdev.as_ref(), "Not enough data for PcirStruct\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[0..4]);
> +
> +        // Signature should be "PCIR" (0x52494350) or "NPDS" (0x5344504e)
> +        if &signature != b"PCIR" && &signature != b"NPDS" {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "Invalid signature for PcirStruct: {:?}\n",
> +                signature
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        let mut class_code = [0u8; 3];
> +        class_code.copy_from_slice(&data[13..16]);
> +
> +        Ok(PcirStruct {
> +            signature,
> +            vendor_id: u16::from_le_bytes([data[4], data[5]]),
> +            device_id: u16::from_le_bytes([data[6], data[7]]),
> +            device_list_ptr: u16::from_le_bytes([data[8], data[9]]),
> +            pci_data_struct_len: u16::from_le_bytes([data[10], data[11]]),
> +            pci_data_struct_rev: data[12],
> +            class_code,
> +            image_len: u16::from_le_bytes([data[16], data[17]]),
> +            vendor_rom_rev: u16::from_le_bytes([data[18], data[19]]),
> +            code_type: data[20],
> +            last_image: data[21],
> +            max_runtime_image_len: u16::from_le_bytes([data[22], data[23]]),
> +        })
> +    }
> +
> +    /// Check if this is the last image in the ROM
> +    fn is_last(&self) -> bool {
> +        self.last_image & LAST_IMAGE_BIT_MASK != 0
> +    }
> +
> +    /// Calculate image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        if self.image_len > 0 {
> +            // Image size is in 512-byte blocks
> +            Ok(self.image_len as usize * 512)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +}
> +
> +/// BIOS Information Table (BIT) Header
> +/// This is the head of the BIT table, that is used to locate the Falcon data.
> +/// The BIT table (with its header) is in the PciAtBiosImage and the falcon data
> +/// it is pointing to is in the FwSecBiosImage.
> +#[derive(Debug, Clone, Copy)]
> +#[expect(dead_code)]
> +struct BitHeader {
> +    /// 0h: BIT Header Identifier (BMP=0x7FFF/BIT=0xB8FF)
> +    id: u16,
> +    /// 2h: BIT Header Signature ("BIT\0")
> +    signature: [u8; 4],
> +    /// 6h: Binary Coded Decimal Version, ex: 0x0100 is 1.00.
> +    bcd_version: u16,
> +    /// 8h: Size of BIT Header (in bytes)
> +    header_size: u8,
> +    /// 9h: Size of BIT Tokens (in bytes)
> +    token_size: u8,
> +    /// 10h: Number of token entries that follow
> +    token_entries: u8,
> +    /// 11h: BIT Header Checksum
> +    checksum: u8,
> +}
> +
> +impl BitHeader {
> +    fn new(data: &[u8]) -> Result<Self> {
> +        if data.len() < 12 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[2..6]);
> +
> +        // Check header ID and signature
> +        let id = u16::from_le_bytes([data[0], data[1]]);
> +        if id != 0xB8FF || &signature != b"BIT\0" {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(BitHeader {
> +            id,
> +            signature,
> +            bcd_version: u16::from_le_bytes([data[6], data[7]]),
> +            header_size: data[8],
> +            token_size: data[9],
> +            token_entries: data[10],
> +            checksum: data[11],
> +        })
> +    }
> +}
> +
> +/// BIT Token Entry: Records in the BIT table followed by the BIT header
> +#[derive(Debug, Clone, Copy)]
> +#[expect(dead_code)]
> +struct BitToken {
> +    /// 00h: Token identifier
> +    id: u8,
> +    /// 01h: Version of the token data
> +    data_version: u8,
> +    /// 02h: Size of token data in bytes
> +    data_size: u16,
> +    /// 04h: Offset to the token data
> +    data_offset: u16,
> +}
> +
> +// Define the token ID for the Falcon data
> +const BIT_TOKEN_ID_FALCON_DATA: u8 = 0x70;
> +
> +impl BitToken {
> +    /// Find a BIT token entry by BIT ID in a PciAtBiosImage
> +    fn from_id(image: &PciAtBiosImage, token_id: u8) -> Result<Self> {
> +        let header = &image.bit_header;
> +
> +        // Offset to the first token entry
> +        let tokens_start = image.bit_offset + header.header_size as usize;
> +
> +        for i in 0..header.token_entries as usize {
> +            let entry_offset = tokens_start + (i * header.token_size as usize);
> +
> +            // Make sure we don't go out of bounds
> +            if entry_offset + header.token_size as usize > image.base.data.len() {
> +                return Err(EINVAL);
> +            }
> +
> +            // Check if this token has the requested ID
> +            if image.base.data[entry_offset] == token_id {
> +                return Ok(BitToken {
> +                    id: image.base.data[entry_offset],
> +                    data_version: image.base.data[entry_offset + 1],
> +                    data_size: u16::from_le_bytes([
> +                        image.base.data[entry_offset + 2],
> +                        image.base.data[entry_offset + 3],
> +                    ]),
> +                    data_offset: u16::from_le_bytes([
> +                        image.base.data[entry_offset + 4],
> +                        image.base.data[entry_offset + 5],
> +                    ]),
> +                });
> +            }
> +        }
> +
> +        // Token not found
> +        Err(ENOENT)
> +    }
> +}
> +
> +/// PCI ROM Expansion Header as defined in PCI Firmware Specification.
> +/// This is header is at the beginning of every image in the set of
> +/// images in the ROM. It contains a pointer to the PCI Data Structure
> +/// which describes the image.
> +/// For "NBSI" images (NoteBook System Information), the ROM
> +/// header deviates from the standard and contains an offset to the
> +/// NBSI image however we do not yet parse that in this module and keep
> +/// it for future reference.
> +#[derive(Debug, Clone, Copy)]
> +#[expect(dead_code)]
> +struct PciRomHeader {
> +    /// 00h: Signature (0xAA55)
> +    signature: u16,
> +    /// 02h: Reserved bytes for processor architecture unique data (20 bytes)
> +    reserved: [u8; 20],
> +    /// 16h: NBSI Data Offset (NBSI-specific, offset from header to NBSI image)
> +    nbsi_data_offset: Option<u16>,
> +    /// 18h: Pointer to PCI Data Structure (offset from start of ROM image)
> +    pci_data_struct_offset: u16,
> +    /// 1Ah: Size of block (this is NBSI-specific)
> +    size_of_block: Option<u32>,
> +}
> +
> +impl PciRomHeader {
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        if data.len() < 26 {
> +            // Need at least 26 bytes to read pciDataStrucPtr and sizeOfBlock
> +            return Err(EINVAL);
> +        }
> +
> +        let signature = u16::from_le_bytes([data[0], data[1]]);
> +
> +        // Check for valid ROM signatures
> +        match signature {
> +            0xAA55 | 0xBB77 | 0x4E56 => {}
> +            _ => {
> +                dev_err!(pdev.as_ref(), "ROM signature unknown {:#x}\n", signature);
> +                return Err(EINVAL);
> +            }
> +        }
> +
> +        // Read the pointer to the PCI Data Structure at offset 0x18
> +        let pci_data_struct_ptr = u16::from_le_bytes([data[24], data[25]]);
> +
> +        // Try to read optional fields if enough data
> +        let mut size_of_block = None;
> +        let mut nbsi_data_offset = None;
> +
> +        if data.len() >= 30 {
> +            // Read size_of_block at offset 0x1A
> +            size_of_block = Some(
> +                (data[29] as u32) << 24
> +                    | (data[28] as u32) << 16
> +                    | (data[27] as u32) << 8
> +                    | (data[26] as u32),
> +            );
> +        }
> +
> +        // For NBSI images, try to read the nbsiDataOffset at offset 0x16
> +        if data.len() >= 24 {
> +            nbsi_data_offset = Some(u16::from_le_bytes([data[22], data[23]]));
> +        }
> +
> +        Ok(PciRomHeader {
> +            signature,
> +            reserved: [0u8; 20],
> +            pci_data_struct_offset: pci_data_struct_ptr,
> +            size_of_block,
> +            nbsi_data_offset,
> +        })
> +    }
> +}
> +
> +/// NVIDIA PCI Data Extension Structure. This is similar to the
> +/// PCI Data Structure, but is Nvidia-specific and is placed right after
> +/// the PCI Data Structure. It contains some fields that are redundant
> +/// with the PCI Data Structure, but are needed for traversing the
> +/// BIOS images. It is expected to be present in all BIOS images except
> +/// for NBSI images.
> +#[derive(Debug, Clone)]
> +#[expect(dead_code)]
> +struct NpdeStruct {
> +    /// 00h: Signature ("NPDE")
> +    signature: [u8; 4],
> +    /// 04h: NVIDIA PCI Data Extension Revision
> +    npci_data_ext_rev: u16,
> +    /// 06h: NVIDIA PCI Data Extension Length
> +    npci_data_ext_len: u16,
> +    /// 08h: Sub-image Length (in 512-byte units)
> +    subimage_len: u16,
> +    /// 0Ah: Last image indicator flag
> +    last_image: u8,
> +}
> +
> +impl NpdeStruct {
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        if data.len() < 11 {
> +            dev_err!(pdev.as_ref(), "Not enough data for NpdeStruct\n");
> +            return Err(EINVAL);
> +        }
> +
> +        let mut signature = [0u8; 4];
> +        signature.copy_from_slice(&data[0..4]);
> +
> +        // Signature should be "NPDE" (0x4544504E)
> +        if &signature != b"NPDE" {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "Invalid signature for NpdeStruct: {:?}\n",
> +                signature
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(NpdeStruct {
> +            signature,
> +            npci_data_ext_rev: u16::from_le_bytes([data[4], data[5]]),
> +            npci_data_ext_len: u16::from_le_bytes([data[6], data[7]]),
> +            subimage_len: u16::from_le_bytes([data[8], data[9]]),
> +            last_image: data[10],
> +        })
> +    }
> +
> +    /// Check if this is the last image in the ROM
> +    fn is_last(&self) -> bool {
> +        self.last_image & LAST_IMAGE_BIT_MASK != 0
> +    }
> +
> +    /// Calculate image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        if self.subimage_len > 0 {
> +            // Image size is in 512-byte blocks
> +            Ok(self.subimage_len as usize * 512)
> +        } else {
> +            Err(EINVAL)
> +        }
> +    }
> +
> +    /// Try to find NPDE in the data, the NPDE is right after the PCIR.
> +    fn find_in_data(
> +        pdev: &pci::Device,
> +        data: &[u8],
> +        rom_header: &PciRomHeader,
> +        pcir: &PcirStruct,
> +    ) -> Option<Self> {
> +        // Calculate the offset where NPDE might be located
> +        // NPDE should be right after the PCIR structure, aligned to 16 bytes
> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
> +        let npde_start = (pcir_offset + pcir.pci_data_struct_len as usize + 0x0F) & !0x0F;
> +
> +        // Check if we have enough data
> +        if npde_start + 11 > data.len() {
> +            dev_err!(pdev.as_ref(), "Not enough data for NPDE\n");
> +            return None;
> +        }
> +
> +        // Try to create NPDE from the data
> +        NpdeStruct::new(pdev, &data[npde_start..])
> +            .inspect_err(|e| {
> +                dev_err!(pdev.as_ref(), "Error creating NpdeStruct: {:?}\n", e);
> +            })
> +            .ok()
> +    }
> +}
> +
> +// Use a macro to implement BiosImage enum and methods. This avoids having to
> +// repeat each enum type when implementing functions like base() in BiosImage.
> +macro_rules! bios_image {
> +    (
> +        $($variant:ident $class:ident),* $(,)?
> +    ) => {
> +        // BiosImage enum with variants for each image type
> +        enum BiosImage {
> +            $($variant($class)),*
> +        }
> +
> +        impl BiosImage {
> +            /// Get a reference to the common BIOS image data regardless of type
> +            fn base(&self) -> &BiosImageBase {
> +                match self {
> +                    $(Self::$variant(img) => &img.base),*
> +                }
> +            }
> +
> +            /// Returns a string representing the type of BIOS image
> +            fn image_type_str(&self) -> &'static str {
> +                match self {
> +                    $(Self::$variant(_) => stringify!($variant)),*
> +                }
> +            }
> +        }
> +    }
> +}
> +
> +impl BiosImage {
> +    /// Check if this is the last image
> +    fn is_last(&self) -> bool {
> +        let base = self.base();
> +
> +        // For NBSI images (type == 0x70), return true as they're
> +        // considered the last image
> +        if matches!(self, Self::Nbsi(_)) {
> +            return true;
> +        }
> +
> +        // For other image types, check the NPDE first if available
> +        if let Some(ref npde) = base.npde {
> +            return npde.is_last();
> +        }
> +
> +        // Otherwise, fall back to checking the PCIR last_image flag
> +        base.pcir.is_last()
> +    }
> +
> +    /// Get the image size in bytes
> +    fn image_size_bytes(&self) -> Result<usize> {
> +        let base = self.base();
> +
> +        // Prefer NPDE image size if available
> +        if let Some(ref npde) = base.npde {
> +            return npde.image_size_bytes();
> +        }
> +
> +        // Otherwise, fall back to the PCIR image size
> +        base.pcir.image_size_bytes()
> +    }
> +
> +    /// Create a BiosImageBase from a byte slice and convert it to a BiosImage
> +    /// which triggers the constructor of the specific BiosImage enum variant.
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        let base = BiosImageBase::new(pdev, data)?;
> +        let image = base.into_image().inspect_err(|e| {
> +            dev_err!(pdev.as_ref(), "Failed to create BiosImage: {:?}\n", e);
> +        })?;
> +
> +        image.image_size_bytes().inspect_err(|_| {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "Invalid image size computed during BiosImage creation\n"
> +            )
> +        })?;
> +
> +        Ok(image)
> +    }
> +}
> +
> +bios_image! {
> +    PciAt PciAtBiosImage,   // PCI-AT compatible BIOS image
> +    Efi EfiBiosImage,       // EFI (Extensible Firmware Interface)
> +    Nbsi NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
> +    FwSecPartial FwSecBiosPartial, // FWSEC (Firmware Security)
> +}
> +
> +struct PciAtBiosImage {
> +    base: BiosImageBase,
> +    bit_header: BitHeader,
> +    bit_offset: usize,
> +}
> +
> +struct EfiBiosImage {
> +    base: BiosImageBase,
> +    // EFI-specific fields can be added here in the future.
> +}
> +
> +struct NbsiBiosImage {
> +    base: BiosImageBase,
> +    // NBSI-specific fields can be added here in the future.
> +}
> +
> +struct FwSecBiosPartial {
> +    base: BiosImageBase,
> +    // FWSEC-specific fields
> +    // These are temporary fields that are used during the construction of
> +    // the FwSecBiosPartial. Once FwSecBiosPartial is constructed, the
> +    // falcon_ucode_offset will be copied into a new FwSecBiosImage.
> +
> +    // The offset of the Falcon data from the start of Fwsec image
> +    falcon_data_offset: Option<usize>,
> +    // The PmuLookupTable starts at the offset of the falcon data pointer
> +    pmu_lookup_table: Option<PmuLookupTable>,
> +    // The offset of the Falcon ucode
> +    falcon_ucode_offset: Option<usize>,
> +}
> +
> +struct FwSecBiosImage {
> +    base: BiosImageBase,
> +    // The offset of the Falcon ucode
> +    falcon_ucode_offset: usize,
> +}
> +
> +// Convert from BiosImageBase to BiosImage
> +impl TryFrom<BiosImageBase> for BiosImage {
> +    type Error = Error;
> +
> +    fn try_from(base: BiosImageBase) -> Result<Self> {
> +        match base.pcir.code_type {
> +            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
> +            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
> +            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
> +            0xE0 => Ok(BiosImage::FwSecPartial(FwSecBiosPartial {
> +                base,
> +                falcon_data_offset: None,
> +                pmu_lookup_table: None,
> +                falcon_ucode_offset: None,
> +            })),
> +            _ => Err(EINVAL),
> +        }
> +    }
> +}
> +
> +/// BIOS Image structure containing various headers and references
> +/// fields base to all BIOS images. Each BiosImage type has a
> +/// BiosImageBase type along with other image-specific fields.
> +/// Note that Rust favors composition of types over inheritance.
> +#[derive(Debug)]
> +#[expect(dead_code)]
> +struct BiosImageBase {
> +    /// PCI ROM Expansion Header
> +    rom_header: PciRomHeader,
> +    /// PCI Data Structure
> +    pcir: PcirStruct,
> +    /// NVIDIA PCI Data Extension (optional)
> +    npde: Option<NpdeStruct>,
> +    /// Image data (includes ROM header and PCIR)
> +    data: KVec<u8>,
> +}
> +
> +impl BiosImageBase {
> +    fn into_image(self) -> Result<BiosImage> {
> +        BiosImage::try_from(self)
> +    }
> +
> +    /// Creates a new BiosImageBase from raw byte data.
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        // Ensure we have enough data for the ROM header
> +        if data.len() < 26 {
> +            dev_err!(pdev.as_ref(), "Not enough data for ROM header\n");
> +            return Err(EINVAL);
> +        }
> +
> +        // Parse the ROM header
> +        let rom_header = PciRomHeader::new(pdev, &data[0..26])
> +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PciRomHeader: {:?}\n", e))?;
> +
> +        // Get the PCI Data Structure using the pointer from the ROM header
> +        let pcir_offset = rom_header.pci_data_struct_offset as usize;
> +        let pcir_data = data
> +            .get(pcir_offset..pcir_offset + core::mem::size_of::<PcirStruct>())
> +            .ok_or(EINVAL)
> +            .inspect_err(|_| {
> +                dev_err!(
> +                    pdev.as_ref(),
> +                    "PCIR offset {:#x} out of bounds (data length: {})\n",
> +                    pcir_offset,
> +                    data.len()
> +                );
> +                dev_err!(
> +                    pdev.as_ref(),
> +                    "Consider reading more data for construction of BiosImage\n"
> +                );
> +            })?;
> +
> +        let pcir = PcirStruct::new(pdev, pcir_data)
> +            .inspect_err(|e| dev_err!(pdev.as_ref(), "Failed to create PcirStruct: {:?}\n", e))?;
> +
> +        // Look for NPDE structure if this is not an NBSI image (type != 0x70)
> +        let npde = NpdeStruct::find_in_data(pdev, data, &rom_header, &pcir);
> +
> +        // Create a copy of the data
> +        let mut data_copy = KVec::new();
> +        data_copy.extend_with(data.len(), 0, GFP_KERNEL)?;
> +        data_copy.copy_from_slice(data);
> +
> +        Ok(BiosImageBase {
> +            rom_header,
> +            pcir,
> +            npde,
> +            data: data_copy,
> +        })
> +    }
> +}
> +
> +/// The PciAt BIOS image is typically the first BIOS image type found in the
> +/// BIOS image chain. It contains the BIT header and the BIT tokens.
> +impl PciAtBiosImage {
> +    /// Find a byte pattern in a slice
> +    fn find_byte_pattern(haystack: &[u8], needle: &[u8]) -> Result<usize> {
> +        haystack
> +            .windows(needle.len())
> +            .position(|window| window == needle)
> +            .ok_or(EINVAL)
> +    }
> +
> +    /// Find the BIT header in the PciAtBiosImage
> +    fn find_bit_header(data: &[u8]) -> Result<(BitHeader, usize)> {
> +        let bit_pattern = [0xff, 0xb8, b'B', b'I', b'T', 0x00];
> +        let bit_offset = Self::find_byte_pattern(data, &bit_pattern)?;
> +        let bit_header = BitHeader::new(&data[bit_offset..])?;
> +
> +        Ok((bit_header, bit_offset))
> +    }
> +
> +    /// Get a BIT token entry from the BIT table in the PciAtBiosImage
> +    fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
> +        BitToken::from_id(self, token_id)
> +    }
> +
> +    /// Find the Falcon data pointer structure in the PciAtBiosImage
> +    /// This is just a 4 byte structure that contains a pointer to the
> +    /// Falcon data in the FWSEC image.
> +    fn falcon_data_ptr(&self, pdev: &pci::Device) -> Result<u32> {
> +        let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
> +
> +        // Make sure we don't go out of bounds
> +        if token.data_offset as usize + 4 > self.base.data.len() {
> +            return Err(EINVAL);
> +        }
> +
> +        // read the 4 bytes at the offset specified in the token
> +        let offset = token.data_offset as usize;
> +        let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
> +            dev_err!(pdev.as_ref(), "Failed to convert data slice to array");
> +            EINVAL
> +        })?;
> +
> +        let data_ptr = u32::from_le_bytes(bytes);
> +
> +        if (data_ptr as usize) < self.base.data.len() {
> +            dev_err!(pdev.as_ref(), "Falcon data pointer out of bounds\n");
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(data_ptr)
> +    }
> +}
> +
> +impl TryFrom<BiosImageBase> for PciAtBiosImage {
> +    type Error = Error;
> +
> +    fn try_from(base: BiosImageBase) -> Result<Self> {
> +        let data_slice = &base.data;
> +        let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
> +
> +        Ok(PciAtBiosImage {
> +            base,
> +            bit_header,
> +            bit_offset,
> +        })
> +    }
> +}
> +
> +/// The PmuLookupTableEntry structure is a single entry in the PmuLookupTable.
> +/// See the PmuLookupTable description for more information.
> +#[expect(dead_code)]
> +struct PmuLookupTableEntry {
> +    application_id: u8,
> +    target_id: u8,
> +    data: u32,
> +}
> +
> +impl PmuLookupTableEntry {
> +    fn new(data: &[u8]) -> Result<Self> {
> +        if data.len() < 5 {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(PmuLookupTableEntry {
> +            application_id: data[0],
> +            target_id: data[1],
> +            data: u32::from_le_bytes(data[2..6].try_into().map_err(|_| EINVAL)?),
> +        })
> +    }
> +}
> +
> +/// The PmuLookupTableEntry structure is used to find the PmuLookupTableEntry
> +/// for a given application ID. The table of entries is pointed to by the falcon
> +/// data pointer in the BIT table, and is used to locate the Falcon Ucode.
> +#[expect(dead_code)]
> +struct PmuLookupTable {
> +    version: u8,
> +    header_len: u8,
> +    entry_len: u8,
> +    entry_count: u8,
> +    table_data: KVec<u8>,
> +}
> +
> +impl PmuLookupTable {
> +    fn new(pdev: &pci::Device, data: &[u8]) -> Result<Self> {
> +        if data.len() < 4 {
> +            return Err(EINVAL);
> +        }
> +
> +        let header_len = data[1] as usize;
> +        let entry_len = data[2] as usize;
> +        let entry_count = data[3] as usize;
> +
> +        let required_bytes = header_len + (entry_count * entry_len);
> +
> +        if data.len() < required_bytes {
> +            dev_err!(
> +                pdev.as_ref(),
> +                "PmuLookupTable data length less than required\n"
> +            );
> +            return Err(EINVAL);
> +        }
> +
> +        // Create a copy of only the table data
> +        let table_data = {
> +            let mut ret = KVec::new();
> +            ret.extend_from_slice(&data[header_len..required_bytes], GFP_KERNEL)?;
> +            ret
> +        };
> +
> +        // Debug logging of entries (dumps the table data to dmesg)
> +        if cfg!(debug_assertions) {
> +            for i in (header_len..required_bytes).step_by(entry_len) {
> +                dev_dbg!(
> +                    pdev.as_ref(),
> +                    "PMU entry: {:02x?}\n",
> +                    &data[i..][..entry_len]
> +                );
> +            }
> +        }
> +
> +        Ok(PmuLookupTable {
> +            version: data[0],
> +            header_len: header_len as u8,
> +            entry_len: entry_len as u8,
> +            entry_count: entry_count as u8,
> +            table_data,
> +        })
> +    }
> +
> +    fn lookup_index(&self, idx: u8) -> Result<PmuLookupTableEntry> {
> +        if idx >= self.entry_count {
> +            return Err(EINVAL);
> +        }
> +
> +        let index = (idx as usize) * self.entry_len as usize;
> +        PmuLookupTableEntry::new(&self.table_data[index..])
> +    }
> +
> +    // find entry by type value
> +    fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
> +        for i in 0..self.entry_count {
> +            let entry = self.lookup_index(i)?;
> +            if entry.application_id == entry_type {
> +                return Ok(entry);
> +            }
> +        }
> +
> +        Err(EINVAL)
> +    }
> +}
> +
> +/// The FwSecBiosImage structure contains the PMU table and the Falcon Ucode.
> +/// The PMU table contains voltage/frequency tables as well as a pointer to the
> +/// Falcon Ucode.
> +impl FwSecBiosPartial {
> +    fn setup_falcon_data(
> +        &mut self,
> +        pdev: &pci::Device,
> +        pci_at_image: &PciAtBiosImage,
> +        first_fwsec: &FwSecBiosPartial,
> +    ) -> Result {
> +        let mut offset = pci_at_image.falcon_data_ptr(pdev)? as usize;
> +        let mut pmu_in_first_fwsec = false;
> +
> +        // The falcon data pointer assumes that the PciAt and FWSEC images
> +        // are contiguous in memory. However, testing shows the EFI image sits in
> +        // between them. So calculate the offset from the end of the PciAt image
> +        // rather than the start of it. Compensate.
> +        offset -= pci_at_image.base.data.len();
> +
> +        // The offset is now from the start of the first Fwsec image, however
> +        // the offset points to a location in the second Fwsec image. Since
> +        // the fwsec images are contiguous, subtract the length of the first Fwsec
> +        // image from the offset to get the offset to the start of the second
> +        // Fwsec image.
> +        if offset < first_fwsec.base.data.len() {
> +            pmu_in_first_fwsec = true;
> +        } else {
> +            offset -= first_fwsec.base.data.len();
> +        }
> +
> +        self.falcon_data_offset = Some(offset);
> +
> +        if pmu_in_first_fwsec {
> +            self.pmu_lookup_table =
> +                Some(PmuLookupTable::new(pdev, &first_fwsec.base.data[offset..])?);
> +        } else {
> +            self.pmu_lookup_table = Some(PmuLookupTable::new(pdev, &self.base.data[offset..])?);
> +        }
> +
> +        match self
> +            .pmu_lookup_table
> +            .as_ref()
> +            .ok_or(EINVAL)?
> +            .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
> +        {
> +            Ok(entry) => {
> +                let mut ucode_offset = entry.data as usize;
> +                ucode_offset -= pci_at_image.base.data.len();
> +                if ucode_offset < first_fwsec.base.data.len() {
> +                    dev_err!(pdev.as_ref(), "Falcon Ucode offset not in second Fwsec.\n");
> +                    return Err(EINVAL);
> +                }
> +                ucode_offset -= first_fwsec.base.data.len();
> +                self.falcon_ucode_offset = Some(ucode_offset);
> +            }
> +            Err(e) => {
> +                dev_err!(
> +                    pdev.as_ref(),
> +                    "PmuLookupTableEntry not found, error: {:?}\n",
> +                    e
> +                );
> +                return Err(EINVAL);
> +            }
> +        }
> +        Ok(())
> +    }
> +}
> +
> +impl FwSecBiosImage {
> +    fn new(pdev: &pci::Device, data: FwSecBiosPartial) -> Result<Self> {
> +        let ret = FwSecBiosImage {
> +            base: data.base,
> +            falcon_ucode_offset: data.falcon_ucode_offset.ok_or(EINVAL)?,
> +        };
> +
> +        if cfg!(debug_assertions) {
> +            // Print the desc header for debugging
> +            let desc = ret.fwsec_header(pdev.as_ref())?;
> +            dev_dbg!(pdev.as_ref(), "PmuLookupTableEntry desc: {:#?}\n", desc);
> +        }
> +
> +        Ok(ret)
> +    }
> +
> +    /// Get the FwSec header (FalconUCodeDescV3)
> +    fn fwsec_header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
> +        // Get the falcon ucode offset that was found in setup_falcon_data
> +        let falcon_ucode_offset = self.falcon_ucode_offset;
> +
> +        // Make sure the offset is within the data bounds
> +        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
> +            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
> +            return Err(ERANGE);
> +        }
> +
> +        // Read the first 4 bytes to get the version
> +        let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
> +            .try_into()
> +            .map_err(|_| EINVAL)?;
> +        let hdr = u32::from_le_bytes(hdr_bytes);
> +        let ver = (hdr & 0xff00) >> 8;
> +
> +        if ver != 3 {
> +            dev_err!(dev, "invalid fwsec firmware version: {:?}\n", ver);
> +            return Err(EINVAL);
> +        }
> +
> +        // Return a reference to the FalconUCodeDescV3 structure SAFETY: we have checked that
> +        // `falcon_ucode_offset + size_of::<FalconUCodeDescV3` is within the bounds of `data.`
> +        Ok(unsafe {
> +            &*(self.base.data.as_ptr().add(falcon_ucode_offset) as *const FalconUCodeDescV3)
> +        })
> +    }
> +    /// Get the ucode data as a byte slice
> +    fn fwsec_ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
> +        let falcon_ucode_offset = self.falcon_ucode_offset;
> +
> +        // The ucode data follows the descriptor
> +        let ucode_data_offset = falcon_ucode_offset + desc.size();
> +        let size = (desc.imem_load_size + desc.dmem_load_size) as usize;
> +
> +        // Get the data slice, checking bounds in a single operation
> +        self.base
> +            .data
> +            .get(ucode_data_offset..ucode_data_offset + size)
> +            .ok_or(ERANGE)
> +            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
> +    }
> +
> +    /// Get the signatures as a byte slice
> +    fn fwsec_sigs(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
> +        const SIG_SIZE: usize = 96 * 4;
> +
> +        let falcon_ucode_offset = self.falcon_ucode_offset;
> +
> +        // The signatures data follows the descriptor
> +        let sigs_data_offset = falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
> +        let size = desc.signature_count as usize * SIG_SIZE;
> +
> +        // Make sure the data is within bounds
> +        if sigs_data_offset + size > self.base.data.len() {
> +            dev_err!(
> +                dev,
> +                "fwsec signatures data not contained within BIOS bounds\n"
> +            );
> +            return Err(ERANGE);
> +        }
> +
> +        Ok(&self.base.data[sigs_data_offset..sigs_data_offset + size])
> +    }
> +}
> 


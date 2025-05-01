Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D00AA60C3
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 17:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3DFF10E86E;
	Thu,  1 May 2025 15:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gg+wP0hD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F41C10E86E;
 Thu,  1 May 2025 15:31:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmVk+ai4lPV7H252kxzpHaftr9EH3H9RLYSg7SHmJQo/84Mj3BBFPLlM3paTkH6QkRE+mNoy5BPLAEzW+JV85+1X0AiWjIOhj6JavbfnAimlDwrG8YNPNVuVgeH+8Vi7D3A9uv3zVP5zP/zORGq/t/4GKp0hSmjvotiNGH/UV9SQHmjr6/x4BKjz/dCX2R8sPFpIh3ugWbUyPiXSMMvkE/dVEdZdgPwzchps0Cwra/vHS1U0x6NYYkICp062f0ytp71yZ4J2Hr/TtKL9s6wi9rpdL5Qa3e8taPJkry1slS7Dg/8UsxrMxF1lHlrj7o82hc50pFq6LK9Zg1hl7A8tHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZIIkzooTiDp+CoznhNhcquERiEvuu/B0PynFeynXLc=;
 b=E/LnADrQlkajMkS4g5u2Z3XIX2sRTnQ9nLtdzDa+utL6X6YRKWR/rbfCjDTC/JvnhtEsRrLuLQnsdZCm5V01wTsh7TQ27gWx6xN+MqVbk8roPylpo/rE63sIXjFCUBxBsXvybRvAXdLO4FRr2bl7+mUCK+KpMJ0vgns41/2ah974pdOYWSMcY8WIqBgekCO+4jFv6b/TQhbq3hJTQHLy6jgjcftuVfiuVliKOrpLcri3u3putn622qkrH+Jt2HJhwtcSG6xQdeAGmQLVp6HTpheuz0kyR6fyw9mkSUNCFcQKrl+jtnA67oasYmoMTdJwb5wm3UUIGtxXf/jHwUlmWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZIIkzooTiDp+CoznhNhcquERiEvuu/B0PynFeynXLc=;
 b=Gg+wP0hD13mmdRX8uTUli5QIOwVfB3KM+oAcyr5eaG899IV6/6zZIBAQ3BW48Q4zKoVKHHRbAPRk5r2D0F21VZhysKVVHSqK7852zhKWGFec9bOpGiwrMdZR+UpSQooBLvMJudzK3sOd61y4vrVbdqthFs0lQmsqTtuz+LCZT3ulg7L90aiWtC6f4DvQrIcK4vkrrtUZLLvU5vYoV5wFD89lWKlrixHnuXjNrByjnIDssqiUO+qcl0nxefSgNVpnnavVvT7vjt23tHJ0EOwJ/vfacHdjXuLK6Smqp5H94YznaP/MhMeSx//jrChEB79qBIsYQfdAEcwU/DzQHI3lGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB7014.namprd12.prod.outlook.com (2603:10b6:303:218::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 15:31:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Thu, 1 May 2025
 15:31:37 +0000
Message-ID: <9bafd604-b38c-4a72-a6ee-3f741cb96d6e@nvidia.com>
Date: Thu, 1 May 2025 11:31:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
To: Timur Tabi <ttabi@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "gary@garyguo.net" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alistair Popple <apopple@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
 <7481f03b-3fb0-499e-b200-b3366334adc2@nvidia.com>
 <86ea2eea2a3671e955b4199dab320a41ec695ebc.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <86ea2eea2a3671e955b4199dab320a41ec695ebc.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: b00715e5-c30a-4c37-128c-08dd88c542d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTY2OE8zNTFnaG55Y3VzSFdyVExrM0pGUjUyeTJ0Y0EwcVZFS0hZMjZvRFZJ?=
 =?utf-8?B?NVZsOGR6b1lDZDlYWGl4QUFNeFZtdFZUZjYycW93OHg2YjhjbEkwRUJmM3NX?=
 =?utf-8?B?OVlmdURkYzNNaStTaVVraVV5amI1OHRxOThRWEZBMFFBcVFGeGFHVGdmVmwx?=
 =?utf-8?B?UFB2TXBqNGhpSnNiZHV3REU4VDB5a25nVXc2RHZGeTNZTHlGN2QxekF2amtt?=
 =?utf-8?B?ZTJkVHNHTmdpSDdXT09Kai8vS3hXM1ExVlJ1UThUTUVMTXM0Mmp0dzJDRzVG?=
 =?utf-8?B?TGdhaWlUb1FTYmZMOXQ5bkVZYkVhUHY5TTJsTld4M1o3UzhCaHI2ZlJsOGtZ?=
 =?utf-8?B?ZmNuWGhtQmNuTGU2SXRsU0J3S0Nhd1NDMDhKUXRMZExBVTh5c2ZwSGFMV2I5?=
 =?utf-8?B?NkNiWHZtMlJrYk5FR3FhL3BMTmN5SjVtalFVUDVua3AzWkNnWmZZSmFiRGxQ?=
 =?utf-8?B?d0hWTzN1QzVlQ1BqYU40UFhZZnpsNFQwVFl4QmFIaVRkTXdSalBSRWlRTXhQ?=
 =?utf-8?B?UUhtNStCenJ5MjVFenJLeU40N2RCY1NSWVVxRllxZzRnZzFxVkVZV2gyeSs3?=
 =?utf-8?B?QTl6d2lYTWRxd0k2dlZsemxwUFZSNVBEZmM2anZtTkY0TCtMQ29ScGNPZ3BR?=
 =?utf-8?B?SUo0MjZKekV1eGRaQmpMNnMwa2NuWm9BU0FvUkp6UzB3WHdwUEJsTXQzYWxx?=
 =?utf-8?B?cEt5US9kV0JuV2d3OVdvRitHVGY3Tmswdm9NVlV0OHBxQnM2VWV1emdkRXcv?=
 =?utf-8?B?V2JVQ2F0S0cza3RjeW9nb29tOC80UFJJZW5FTUFSakp1cWRJdXVnalpzZFA5?=
 =?utf-8?B?a2txejZJNUwrRVBOeG5kaGdsdzduZGdlZnlmdS94SmsyU09JWU1aMEZoemFi?=
 =?utf-8?B?eC93WEdMQW5MUHhsclR0UG1uZGExRUVSVnFrUmxYOUUxd2JmcnpkaDh3Nld5?=
 =?utf-8?B?Q1NWM0k1UityaklUSnlZb3FwZWdocFFiNFc4T25IZEcyV0ZrZmkvNGRuNmRy?=
 =?utf-8?B?WjJpT3YrTDQ2ZFVpNVo3emhpRHJMYVRlWlF6bXcvdyt6dENCaHk3NXZUSUFw?=
 =?utf-8?B?UFZ1WGFBc3NjYkkyMHo1d3R1MXp3VmR5OXhFWjRJajZGMmFLWDhiQ1dJSDFE?=
 =?utf-8?B?MFphbHBWSG9MaC9BTzZxSDlOelFkSDJBR1ZNVG1nN09WL042K0g1SG5jSWpH?=
 =?utf-8?B?VGZpV0dBZkVQUHdmZHI0bHBTZWZoRmJmN1lHbnR5VnRScEdjZmRQOGNYS0Z2?=
 =?utf-8?B?VU9nTlc5bC9IQzdIdjNsL0ZiM2JmbktyYmdCYjV4ZDVSU3U2VGNjUExxVVRa?=
 =?utf-8?B?Vm5EZjY4dzJPZ20zQVdld0MySTkzcitOQU5ndnE1SWlPRmZ4ZUxLNitHWHdi?=
 =?utf-8?B?ZVNnTDg4N0lTdVJTQ0FTdE13QUxMWVF1cHdTQkJhaVpEbUdrWFRHMG1jYnBm?=
 =?utf-8?B?VlFyeW9ENzhlRFRBQVdBUkRGRjFScnh4b2w3bHpzdUZVelRhT1JEaEwxMXR1?=
 =?utf-8?B?YUc0MVpLUnA1QmZldE1VcytiQTAzdG93VXNCMzZ5K3JYN0xhL2JOS0pMekda?=
 =?utf-8?B?V1B4QnpRVEtuVVlqQXQ5dUNPWXhFZ1dTR1Y1RmJZYjRPNzFhU0JEZGNRdWEy?=
 =?utf-8?B?dEVhSm1VOXNaWkxveWxDLzRWTUVTemd6ekhtTUtJUTdsbHNNazdybk1wYjhO?=
 =?utf-8?B?WVJQSmNDN21Pd295ZndLUFp3dENJT05kWG1nY1JWbVFmTHE3cXY0WUl6UXBI?=
 =?utf-8?B?RWhnSlRsQmYya3ZVb0liNTh6OUhsSktOUkRleHJYNjlQLzd3anEzaEY3K0k4?=
 =?utf-8?B?dzNJbVlkaUVraDBLUi9PUU4rMktqS3dXd3lYR2t0VFZjZDdObmlBbGRXc3Fo?=
 =?utf-8?B?ZC83WU9EZ3RLOXV2RU8vK1o1US9leDRHSXk2NW1rdzBuT1M2dWlvalVacXFW?=
 =?utf-8?B?amU1VVZRZURpUCs5cVk3VFg4SG00L3Q3T2hJcW5JZk1JOTdZRVNoQVloeC9E?=
 =?utf-8?B?RWQzcTlUVmtnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2lta01wRHB1ZnVIZVY4dGJ0VWlwZ3FPZWwzWFdwMmROa29kYnRPQUU1NVVn?=
 =?utf-8?B?STR3Q1BaL2NPSzArWWI5ZXMzMkZxeDQ0ZmVkQUlWbVAyZHJBYzl3UzdjVFBk?=
 =?utf-8?B?dEJTOWRwNk1YYUFIZHJEQVF4cm9qaSszRDI2NGlDR0FSNFE1TW51Wi9qWTd1?=
 =?utf-8?B?L25OWkhReC91NVRUd3psdWw1cVZ4YWpFMDFtZmtCMlp4NmRNWXNBdG1sRlM2?=
 =?utf-8?B?bThmVjh4TzhJcnl3OW1VMWQzZk9QbENNZnlBeG5jSUVuczV6M1ZQRFYwT3gr?=
 =?utf-8?B?YndRK1o1T0Nodit0UmdqeS9BSElkemNRT3dlMXZpTG44a1BmaTh2V1A3Z0E5?=
 =?utf-8?B?dGdteURRczhXc1BjKzRGaVU0MlN5aE1BdFkzZGxkczJQeEt1SEZTQUxQNEZJ?=
 =?utf-8?B?TGZ6bG5zVW82OUlRQ2dzMGZlUkd5WjIyNFlzN1o3VEFoS1VRVllhS3FBU2Vi?=
 =?utf-8?B?dm5EQ2UrbWNEQW1lMlVFZ1RJNE9iQ0d2WE5aa3N3Y2t2cUtmRmhFZTduMHRj?=
 =?utf-8?B?MTkweWpOVXVYSVJQODFiREwzUk5IUU5hR0MwM3RPS2xZczVvV2NrM2RaYjU1?=
 =?utf-8?B?UlR1Y2EyK0l4RmM1eTRWT0tLcnhzVUlzN2R5SkNUakYwWW56YmZmSDhIWE90?=
 =?utf-8?B?NjFxOGhRamllaW9zUUthVmMrY1VlV29kWEVVWjdnNTlNSVNodkpka0xQK0tK?=
 =?utf-8?B?Y1lPTlRjY0QxOHFsaC9mMkhacGcwSng4TWVVcTdFNmkxU1Z5SVA5NXZpb1pF?=
 =?utf-8?B?V0w4d0pNT2dKY3ovVTdRQUZaR29WcmpyQ1RxaGdyQ1pCd0l0QnltNGE1RFN1?=
 =?utf-8?B?MTdHdlFKSFh5STFRS0tJMUl2RGhWbkFjTEFxWXNPTzZDNVhlZ3BkMWdrcW1z?=
 =?utf-8?B?YTNxcGpsdC8xRHFCLzg1WmxJK3BuSkQweDdZSVJ4U1duMXVEcVFNSENBMlFt?=
 =?utf-8?B?Tk14cW5XRHloQ1QvbkJHakhzdXFJV0hwRmhYSG5rM0l5bXpoUlNLQmRadFZr?=
 =?utf-8?B?NzJKc3RpaUkydmNsT252aWw0RTI3cldwSjBiOGhXMjdLa1RNT3pZRVVZMDAv?=
 =?utf-8?B?QXRNNGlqZ1ZLVTI2V29xU3Rtd0ZuSmRMY0tJcFV2ZUNaYlpkcFNGU0l0UWdy?=
 =?utf-8?B?aE1reW1mTWJPd0U1c253dnRCTHhWcGtwL2xxZFFQM1loS1cxaWZmNEJpTU8w?=
 =?utf-8?B?enA4MHUxOThiUGNvR1ZVazU5Ym5qeGNJa3ROSW5qTVpnOUlHT3RRTGRGMTBG?=
 =?utf-8?B?RzFsK3lvTTVVSmN6eVZaYWZlYTFtZ2NmdnV1NlNaY093bXVKaVZ3OVRLa2RG?=
 =?utf-8?B?OHgxVU9ZOWdhTEEyUGY0cFFXTU9sSVdaQ3d4NmV6SEhWeDg0eXNydjJmZWh0?=
 =?utf-8?B?WUo1bXJkSWtRSlcvS3BsR2RQQXJoOHlRNUg0bXR6UVlWWWI0WXdYYmxoRzlI?=
 =?utf-8?B?VVJ2Mms2eTZtb2t0d3dXS0s1NDZaZWtGNXJzeHFUbit5OHBxNHI0QkhGVkVL?=
 =?utf-8?B?WGhMaGU2Y0NQUXdCeGZXcVp2NldKWitnbmdxZXhUanRSRkY1MHZEdlIxME9X?=
 =?utf-8?B?bmZscFNvUEJpNG4zcEo5MHlKYWhVajVRbElCS2I2UVFiZUFrYVhjeTNnOGZq?=
 =?utf-8?B?WUF4a0JUb096YW5zT3A1eWRWWGhLN1NwK2RzYlZDY3J6L0ZFWE1jdGJvU2tL?=
 =?utf-8?B?NTNOUGYrQVZYL01XbzZYcm9VREdJSm01V3RZQjBkamJ1TUVxZUo3a2E1Rmw2?=
 =?utf-8?B?d01iZmgySy9Zak01ZlVXZEd5bGZQRXpEQ1c4SjBCZmw1WWNJdStLV2RLSVJ6?=
 =?utf-8?B?Rjh1V0taSWJ0MmtWWmVRRXZoYzNFMjJkYkJ1aTFhTTc5RkpKcW9oSFpjdXJH?=
 =?utf-8?B?ZCs1VTFFUHhEajdvZTJrYXU2S3VBTUl4U1k0L3J0OWtGWThWOGxERERLenE1?=
 =?utf-8?B?VWpZVWVVdWE1akNtMDErYXh2RjNpcTNMTzFkOXJ2cVU1czFNaU1kdU9ETTJw?=
 =?utf-8?B?aW10dWxGRGN5RUtxYnFlNGhlT3BjNkphY3BmVXZzejF1a3dZRDJlVk14ZFRG?=
 =?utf-8?B?bjZ3MjgrcXc0d3dPMDA1TEhLNkUrY1dweVJ5bEVrc2RYYnYzekYvVGd1Zkg3?=
 =?utf-8?B?U1RZUFNvOFFmaTd0VVlyaHlYY2cvOHpLV3JCa2M5VHFsMTlXNTBaNTc0VFJ4?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b00715e5-c30a-4c37-128c-08dd88c542d9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:31:36.9378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQr5E9ZrwW1aErvUzfX9/QhgT5kfh7MpZIaVpkhBpoAkDM3xGYOC4VOJSRt18CRjmdckRd6n2IDZ7uNuamgHWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7014
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



On 5/1/2025 11:31 AM, Timur Tabi wrote:
> On Thu, 2025-05-01 at 11:22 -0400, Joel Fernandes wrote:
>> Also not mutating it like that matches the pattern in the rest of this file
>> so
>> I'd leave it as-is.
> 
> Oh I see now.  One version changes a variable, and the other returns a new
> value.

Yes, exactly! Thanks.

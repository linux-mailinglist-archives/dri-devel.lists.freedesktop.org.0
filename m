Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70012AB8E67
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 20:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8724910E93F;
	Thu, 15 May 2025 18:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A1OQ1JB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3602110E93D;
 Thu, 15 May 2025 18:02:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRPllMTtScATIS5+vBHCHoH2shFIY0hfbrXzwVpr7towpy2Yrnsv481IGqmbcTzKTZABe7xjhz6xITM4nF0LD28aRq5JRsVeYim8KqYJCOUXw03SfbsUAmXeXrzelkW6Yq7H2a5VDWEJ0sFWCOd7e0z980Ky4vR8bQFUxRFYa9RVj7bL8JZqrCSrdOJNFW8mhvvua6EtPzAEjE+6T0u3mCRFl2HoaOr0kZyu4WX37m9opjOlkjTNOYaQuRe+rvCG2/NfUGEt3mvUrwU0AzQAx0GvJ2meIiRP12LIFnFRMO7dZVLa+hXwRw+zeIAZ6iPUESi2XgQ03cC3oyvdqEVWPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ze75Crc4QJqUUSaZcnDGEzNwBKiCtJkYGt98RlWcAu0=;
 b=R3/Nkoop2EHv4U9hdjEAk9jnX9mStDTFRRsvJ+N7xjleoOKRFaWkR77F56aD6VB7XR0rldQB9bv/v0bhAW1ET6VdizbIbktkbuCgJTCdzOfWW+eKUjQvryna+ZPVy3gPYyEJeQGfCSQWeigNoiC3nciv62XMLYvWTeEpMlSxoY+LH9rc5gd7/q/aEHImKA7om00dj5xGdjKhO26UFRhJF06NXePncNSeHnkijNKR/BbIvZbDWIJL8rJe9rA0/QMAdsYjEfjcd0Ew1grqsvXUyMYpGnd6xd/iwwMueu7Bjmv5Rm5lTRUUS8QWtjEhV/dpioOMn5xnBn/KvLYd3/iM8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ze75Crc4QJqUUSaZcnDGEzNwBKiCtJkYGt98RlWcAu0=;
 b=A1OQ1JB/SeWnGeGTMsSgJ7htSNEHBZJQvz0pfbfbgg0pU5ozKIQl1mreeg5jUsmRliE2VlD0D0PK7fqspnCzzXD794xVvabpjxTW53N0Po1tTbr2vZunuqQFhekRHGpBXuJD70OLr5oGMpMivPqVUP1xPPylcoeFISV9dRrrjD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB7934.namprd12.prod.outlook.com (2603:10b6:806:346::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 18:02:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%6]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 18:02:07 +0000
Message-ID: <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
Date: Thu, 15 May 2025 14:02:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Daniel Stone <daniel@fooishbar.org>
Cc: Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 Misyl Toad <misyl@froggi.es>, Xaver Hugl <xaver.hugl@gmail.com>,
 Ribeiro <leandro.ribeiro@collabora.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0310.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::18) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 28ed941a-2d16-4946-17ad-08dd93da9b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmpxY3BqN1JCS2R0Mko5bDNSQytsc1RwZHV0QTEzWE4wUGhWQUp2V2lxTjdN?=
 =?utf-8?B?c0lnbER0eUdNL01kZ09nbFo0QkVjaXQyWVEyZFBudkxUVWhSS0lUby8zL3My?=
 =?utf-8?B?ek9KU0R6T2Z1TUpHU3R6YURLVS9IRkN2dEFLZW45c3RDTXB2dkU5UDMzVisy?=
 =?utf-8?B?RUkxdElpbXlSZWtZSzQ4M09EczZOOXh2azZoVDV0YkI4bG5naDlHeW9WUGox?=
 =?utf-8?B?eUpyTzJhRlNWcks4cVJId2JUSDdNSVFuRXp3N0pPbUZvcmtFZGZvRXk2dVNu?=
 =?utf-8?B?VjQxU2txaE9pdG96Zlk5VVNSQ3JRUng0SzBQbzhoOVorZWxsWVoyeW5rcXV2?=
 =?utf-8?B?UytMWndPVVhrUHZ6YWRSdjB3L0QzaytxajRGMDg1YlV2MmpyZk1JeVRwVVQ0?=
 =?utf-8?B?OEh6dE1lZ1hDWWFSNTNaa3NWNXJ2NjBBOU84cWVCTnczTzArZTRrTFVxNjVj?=
 =?utf-8?B?QjE3WkYzMmMxcHpYRlVnZXdFTWdCaWRKcXkwSk1sZTR3QXdnZ05GYVBqczVy?=
 =?utf-8?B?NUhrSDNrM1VTNXpDb1hQOTFqTml2YnN6T3pYeTc3cERlTC9XbzRDdnFKeXFD?=
 =?utf-8?B?NXJLNk9nTUZCbi9Fb2tqeGtrVXhORlJnOWdqNjYyT1Z5V1BhUkdKbjcwcWRu?=
 =?utf-8?B?OTZUcTVoeURPYUZJOTg4U2FXQVNnTkZBZkNGZUJmNUZ5Uk9IdE5QUkhDM3Zu?=
 =?utf-8?B?Y3krbFpKd09iczZNbjZENmhjZmlCNG5MWGdYbHZGWXEwbGplTHNoQUVEL0wx?=
 =?utf-8?B?UUVhSFVnUDhDV25BOVRhMXVBZEJicDdTbGl1OTdVSXUyK0RtdDJ0MmZSVk5X?=
 =?utf-8?B?a2VmNmxCRDBIWnptUVVqR1ZyZjRONHRrRWtHZmZlU3JVQ1VsMUZqTXkxTHpY?=
 =?utf-8?B?UkZPZHFXY3dhMmJTQVBxZGg5cXBXUTYxQVc4Z2Z6aU84bkdONGpGSU9kSVpS?=
 =?utf-8?B?WEQ1d3dXSmNXL1ZHK25jTzlBK25zUGUyMWI2MVQ4U1E3YldneUJOUGJWNzhu?=
 =?utf-8?B?Wmlsa2FiakxWVVp2THp1RkNxMkxhSElBVmV3Ry9Pb09RblA1Wlk1aFVXU05X?=
 =?utf-8?B?OWFqRDAzQ0orZFBMWUplVFVIdGpFNjIzNDdmbWF4Y3ZyNjcxRGxZQWZpWmYy?=
 =?utf-8?B?eHJCeUJQTjFHanRKYmt1SjlEOEROSzl4VkRVSG1iN3dQUmt2ZDZWV0tUUFpO?=
 =?utf-8?B?NjBSNytqNWoyZEpvRVV2MlFPek9rWUNGSHVacVQvaThIM3l2VjYyR1YrT2lq?=
 =?utf-8?B?Y0NGaTkyMGdFNzhISFgwK0VCdm1FSytTWTFhOWhab0xlTC9RYXRrZTd0Ui9E?=
 =?utf-8?B?bUlxL3NmRkoyazR0UXNGd1k4dzdSRi94alppdVVadjBoRGNhcThEMzR5cGhw?=
 =?utf-8?B?R0o5TkU3Z05TQ1R3TU9Ic2t5ZWd1ZGVrblhkeXRSeHVTZ0VBRXV4QnJLdTVi?=
 =?utf-8?B?bDcyUXRQYVc2MWU3MWNVbkdKU0dhbTN1M00va2xZdVpFNWtBN2lrS0hPVlQ1?=
 =?utf-8?B?c0dWdlU3RkFVem5YQ0E3b1dycytmK0NlWUZvNXlRSUxKM0J4aUN5ZURROVZO?=
 =?utf-8?B?dXViMlBBaENsTnhhWGIzZ0VXcndJWEpIckVLemJ1WDlvVFpZeEVXYVhOaDJD?=
 =?utf-8?B?L0NNVTVJQWh3M3NEYlVQMjE5YXBGTUM2MllWREFrYmNrQkRqM0dnUVFDeHJY?=
 =?utf-8?B?REQ1cXdYMHA2Y095ekpUSXh2a1FIUkdYZnhHMC80NWNKMWxuVTVPNy9OeDA0?=
 =?utf-8?B?THI1UExCci9LeXJQTE1nZlNYQVhQUUtqSmxmUHpsazE3WXYvUm9xZG1JdDJ5?=
 =?utf-8?B?Tkw2cFlLUEdGdlhOVTdTZUE5TUpCLzJpcW50MzFFMitBNmdCODNTTWs1UERI?=
 =?utf-8?B?Q0RTbm5sRklDMVdpSVpMZVRkS21mNGN5UTY3S2FJZWpKTlA1dFEzVnNYcHdQ?=
 =?utf-8?Q?ckdSDpWbvqU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlZsRWpmb3FleFMxWnUvS0ZEZ013QmpqcWc4azRkNDc2ZHcwWnMwSEd1UlBF?=
 =?utf-8?B?V0lqSDFMa0lTVm1KbUhVcFBZRmJBbVpuYUtaTWVtaS9SaDQ1REJxSlJkT1ZM?=
 =?utf-8?B?cWp0dFBMNk0xV21KdWlCTk5ZaUQ5RXVJWmpKMXhlVXh3Uzl4Nm4zazFOdFlU?=
 =?utf-8?B?TWttZ1lGeDA2YTNQRzRQbWsyUVB4aWtPY2o2dk42a0s5U0xkd0ZvRWYyd0w4?=
 =?utf-8?B?UUtFYkg0KzYvOSthQlNUbGtVUTQ1NTlLa2tzUTRYV0J6dStFcXdvaEFaVmZ4?=
 =?utf-8?B?UEpRQk94YzQzL25Xamx6SmhlUVN1Ukx5Nm0yVzVoSDhDNmo4QVA3K09xNXVw?=
 =?utf-8?B?bmtDL2Exb0xwNzBibk5jQ2VLOFEyUEJiN2UzNkxFOU8rMzVqSW9laU9xOXJk?=
 =?utf-8?B?VUlBQ29qT1dkanNxOEQ2cXJRdmdWcWJ6MzdGbmdwRGt0dkR1Q3BlOHBBNGky?=
 =?utf-8?B?U1RGZ1I5QlhZOWVUMFFHeUNjS2dMUjgxdUVuaWxQZzdQZmpoMXNOZzJtbTBP?=
 =?utf-8?B?aGEybHBPM2VPcVAvNktWdWRuSGpEaWJzVDlHeEQxN0dhdlU0WE1QRzk3R3ls?=
 =?utf-8?B?V0ZNNlI5cjVIdmdIcEdLL3M0RHRVY3kyMmR1bjVaakRMSEF2eUxkeGFSdUJI?=
 =?utf-8?B?aldOcWxxRnRwY2dTbXptTzRGMWVZdTZqWFB5VjNNMTRjSU5XVEhsaXNDUjE3?=
 =?utf-8?B?ZkYwS29HeVEzKzUyNGMwbkszU00rQUZEcnd2QXhIMlpDRWJsczhpRkNtYmVJ?=
 =?utf-8?B?bkdORlg2WktMK1FpVmdaZzlBajlVa2RuVFkrcUZ6R21VUTQ2NUZtZnNqaVUy?=
 =?utf-8?B?UUdiM3RUVXI3OTlFa1lOOGQvNWtWUmx1NlFzckpTZ1Y5Z1d3dDZmbElyRzFB?=
 =?utf-8?B?TjJlcUtaMlJZMVZ4Mlh6d0RhR0lJUnlrMVlWdm8xTjZTdTlVWjBhMnZJSjIr?=
 =?utf-8?B?bUhoTzlWRFBQWlE1c091NnZ5eENrbURlOVdvT2YvK3hYZmhHNzFvTEFWbVFp?=
 =?utf-8?B?UVFEbGR4VnNxcVBlVkVPMnVFN0cwcGZCOWhIVVIvSmg1NlNoT3pqSU1kOWtp?=
 =?utf-8?B?cWppZk5rYWg4VEtFblJlVzh2YXZyYzJ4WjM1OXB2NkNpR3lhYStQUit0VjQz?=
 =?utf-8?B?TFYvM21jNjJLazFtSnVSNHFWYmVkaE9EdjVHZ09GeGl2RzN1UmowdTIvZjNT?=
 =?utf-8?B?TExlR094NFEzVGUvR1N6aWtuU21ieGRBTzdHWVQwK3VSeHEzQ0tMTW4yUytu?=
 =?utf-8?B?b05sQ2FMRXI1THdBQ0I4bko2WVNqTzg4SHBsR2kzb1U5ZWo1dTJqaUlPVG5z?=
 =?utf-8?B?MXEzQzRDSXl3bUdHZVNZaFZudUdPdEtxaG1XWmE1VUlzZ1ZIRGlsbHQ4elNa?=
 =?utf-8?B?Zy9tTkREMGRWQm1ZUFQrMFpLcXcwNmpyMGErWEgvUEhkV0ZrZG1SVk1qaUVq?=
 =?utf-8?B?Ry85eU1oZ25uN1ZFYk5kVUpYeXkwbUJBU2E4Y0hQc1VlZmllR2Z0d0dwekk5?=
 =?utf-8?B?bkZuZTkxTlh0WUdORXpHY3hKU1hjeTVRTTZUeDIvVTU2WXVGZlkzNDFZOWpy?=
 =?utf-8?B?ZC9YSHA2K3gyWFc5NEJRa1NaOUk0aUlGRk0rRzlkY3QrZ09QTEhEN0dDWGRy?=
 =?utf-8?B?ZlhCWjRZTndlRHFQL2pqT2hnT2Q4b0dWUTVxSEZ2TkdFaFdlcW1leEROVEhw?=
 =?utf-8?B?VmZxdk5NZXpEQjZId0h4WGhVQWRTb2tWSVNra0lIVVFHcXkwRWdXL2tkWjJD?=
 =?utf-8?B?NnlJbkRDZ0t0dGxwbXZLWXRCWUlHUHRmL0xwZWZwanpHMWc2Mm53cWdEei9L?=
 =?utf-8?B?dHR4aklrOEF5QkNVaVNnMGU1S0VtaEZtNlZ0dFJTUFpUKzJia04rcGI3OThn?=
 =?utf-8?B?NkhTQWJlSkRLWWw3NlM1VEhJOW9uV2o4ZC9hVWdUTkNiU1FTN1J5VE1KTTVW?=
 =?utf-8?B?a0htNGkvK3lvOWZCOFk3dnJFaVRhRkx5SjBjYWQ3SnNoSGp3M0FUL2tLcEYz?=
 =?utf-8?B?VXdYQzIvdWZsdVBhaTZnOE9OS0tUMEhLeFZZSVd0eTRSOGdoYUlQZlJFWXZF?=
 =?utf-8?B?bWlPNXk1NEx0azdaeEZPVnFaL0FEYkpJYUVpaGlQZE1qZGdDRWp3R3lVaFR4?=
 =?utf-8?Q?D3joRe4E9ZyKUu6t1Kfg9eO+o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28ed941a-2d16-4946-17ad-08dd93da9b33
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 18:02:07.4292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8y/mXfgiQg7CMaczTsCqDzjOxOshHNhh2eCm4nA0w/zPEYY8uQT+JizQh6OSYu48CKsCm0nL9t1DOdZbL5TmCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7934
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



On 2025-05-15 13:19, Daniel Stone wrote:
> Hi,
> 
> On Thu, 15 May 2025 at 15:11, Harry Wentland <harry.wentland@amd.com> wrote:
>> On 2025-05-15 05:45, Simon Ser wrote:
>>> I've reviewed all of the core DRM patches :)
>>>
>>> Have there been updates from user-space implementations?
>>
>> I know Leandro has been working on Weston to make use of
>> this and last year Xaver had a prototype in kwin.
> 
> Yeah, the Weston patches are marching on. We've still been doing a
> little bit of cleanup and prep work in the background to land them,
> but we also can't land them until the kernel lands. None of that work
> is material to the uAPI though: as said previously, the uAPI looks
> completely solid and it's something we can definitely beneficially use
> in Weston. (Even if we do need the obvious follow-ons for
> post-blending as well ...)
> 

We can't merge kernel uAPI without canonical userspace that uses it.
To move forward we'll need a userspace to at least publish a branch
that shows the use of this new uAPI.

Do you have a public branch for the Weston work for this?

Harry

> Cheers,
> Daniel


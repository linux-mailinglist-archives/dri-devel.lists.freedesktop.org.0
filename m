Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B8B021C1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 18:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D595B10E3A8;
	Fri, 11 Jul 2025 16:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fN4Og9fi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C2A10E3A8;
 Fri, 11 Jul 2025 16:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fm6c/YRtMpW+shIW58h5UPD/kS7dNiYCX9aR0JyUS2ep5vRg+yu/LA3pBw98fJ2LfkED/444MLrn8M10JFoS37K0FMAOKUQDBpC9mNQwzA4YuMOoxrxgVqdnCltvdK7ML+sBfbZWcd4nLge5myqALYQoQCffZz2tVgHzchWaZUhxstrjaGB+AV0W2JRK9uLNN6uXB+/qGnjCL6ZeeKWTqw/gAOWy+JKaq6FzD5bwlw/S9xtMgZzVxyXu02D0vLHBkkVjlMfIlHP1PdmGAP5dD4CVnTpsLBchKlnZX23o3qVRBV8zUd7BqYQ56LaZ1McY+iqH/6znQmbOEJw5Wo6OYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwLEW059rT9mu5KUQg1tzaES4Np6C7cFjZi8gsY5lHs=;
 b=BasXj8z3dH8Tn7BXd+5Nhu4cJ/V16bE2u9fsRI6T4FOSchQOhYy0qOZzJbfepJ/1s1rvTrdSwG7O1XpPsDFZm0OurEqL3NN5YhB7m/xSa17OH587DNjuMV1hFilUwyH9EyJdZxGtpoZ1oq4xkj4EHX5YOnOkisVuvSe7iyybDktruQHBRczOmX1blthbIg6OC2y5c/UoH2mGivyc1t06Ffvtq1eqwc87s7YE9qqQK+dIcN3PH4mvOQuqRkJLKn7g9MUmQG7cjyJsQc6+1V8b1kCBer85H5erl29t5BTB0Y2fg57v1yPvf1QSXryUvMkeD9P7sm7PJXeZCReAqVPeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwLEW059rT9mu5KUQg1tzaES4Np6C7cFjZi8gsY5lHs=;
 b=fN4Og9fiJM+uFmMend8pXr6vWnNDUyYEwF2YPFxF0sA4D9bfumPRAwBGklvgUUwXYoibvtHk5yb2nSTasL1pqONuVTnHoxnLj5FcP5dn5GjmlolWYeZrEH0yWQShy7aZlzAcwJgt7wDJYrdlbbbpXsRe9zaBeMPablpu6U1NO+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 11 Jul
 2025 16:29:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 16:29:00 +0000
Message-ID: <9e116b0d-c46c-41f5-a953-7d17d22c98c5@amd.com>
Date: Fri, 11 Jul 2025 12:28:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
To: Simon Ser <contact@emersion.fr>, uma.shankar@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 arthurgrillo@riseup.net
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-34-alex.hung@amd.com>
 <Mk2DCOdpZ75QLmGiZYM8GfnoMHRIGsx2S0_gzq2ryBHKEfLQMP5ArB3s94s8NYyci5xYBPN1md01QaUOqqlwKb3KxJIBRxMLO9yjoitMVJc=@emersion.fr>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <Mk2DCOdpZ75QLmGiZYM8GfnoMHRIGsx2S0_gzq2ryBHKEfLQMP5ArB3s94s8NYyci5xYBPN1md01QaUOqqlwKb3KxJIBRxMLO9yjoitMVJc=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MW6PR12MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: 11202738-945f-4542-138f-08ddc0980ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3hlMVV5WitDd1NyaklrU1N6anRvbFI1M0FEZXpJYUZReWZ6TnRvNzg0alhp?=
 =?utf-8?B?a1pEK1pELytGSHJwYjc2RnVJYXNtZjVEQTFXenNuVlRyNnFSa0lNT3NydzZ2?=
 =?utf-8?B?NytvRUo4V0UrMzFGNWZkWDFhblB2WmtoNEQ4b05NQlZmQkxLeHFaKzFzNXBq?=
 =?utf-8?B?YzhiRE5QZ1UwL1RvMGV5a3U1K0NHdnZrK0FoLzl2cm5FT3dvckxjRGFVR0Zi?=
 =?utf-8?B?NHJ6YTVqeGNwQUkwZHJqTGxnV2lKaFpjbTRSSmJ1aGp0STB1Unp1eHBVTmRw?=
 =?utf-8?B?RVpMeHArNEsxOHpPNTdGUWI2emcyWlRZQ3I1NmM5dUlhZWV1c2lPK0Yyb1Iw?=
 =?utf-8?B?andlMk1lUExDTXhuM05FMi9scjZ6bkd3OWJ3TWdVVmxwUnppWTRmMlNiWHRF?=
 =?utf-8?B?TkJHckR5L1o0UnZWak1XRjVnV3RNK28xanB5d1FJMTc0MDNvUFM4dUtlaW5p?=
 =?utf-8?B?Vit1TlhSN3RVczJDNlI3QXZLMVg2QWg0dUptSzQzUi9xTk1Wb0ZNM2NqaTVP?=
 =?utf-8?B?ZU84N0w2NGwrcVJ0SkxkSUtlZnFleUNFRk5sU21GUEpZc3FvRCtzOHRKclJM?=
 =?utf-8?B?aGlCbCtaNHpKYTZxZkxMdi9weVFDTU44K3p3MHNsZStrWGdoTmtUYnpGbkw5?=
 =?utf-8?B?MlllaExCNUZ2WHZkNmdrUmpIZU5PelI2clYzejdtMTJxZ0dvbDl1aUI4Y2J2?=
 =?utf-8?B?OWgyUUVJRHJxQ0tZS3h1T1BoSTRUUGY3YlZFKzFLMG5GMGlnY1hkVGJUbiti?=
 =?utf-8?B?K3VQejVUM1NNTVdydWhFWXNEUjE1SnRkT01HYXE2RW9Jdzljc0Jvd1RtaG02?=
 =?utf-8?B?VnR0akJVSXpxY3VpNmdZQzFUYklHMHJKcGN0VzBRN09iQUYyODFjL2FPbFVR?=
 =?utf-8?B?MXpMOHVxdnNkT2VPMlc0UFJWcmhVZ3hNNHZDeWg4YkRTR2tnaDkvNG41OWow?=
 =?utf-8?B?MzErcWFkeERxMlRuOWlFbWFBaEtqMzdzMTl2aTM5SnM2cVlOTS8zUjQzR29z?=
 =?utf-8?B?RWUwUjkwanF4R09yUnBXKytpSVZYZEkveWxDZ0ptNlhJSWxmSzNRWlVVWVlk?=
 =?utf-8?B?bVBqa3ZSQjBwaWZ6R0MrTlBWQytvMjZqMC9aV1RGQStTR2pQV3JFWWJQS0t3?=
 =?utf-8?B?ZXNzWkdoWTQwKzNHalVITjh4TWNJTWNXRzZWUWRQaEZHbnk5TkJrWEpRUlI4?=
 =?utf-8?B?UDBYaFk5RHJlTWZzanhJK0ptL2svRmVPRG5QOGxwdEprc2hla1FWeEVHQ21Z?=
 =?utf-8?B?T2liUXBDeHZTQlhDV1Z2Y3pBQUE1SFdTQlhNNmZYNGp2T2V6TnRuaDBxeFJk?=
 =?utf-8?B?ODFOUS9CaEpEY2tZN1NyM0xhZGxyU2pvM25rYy92VW41OEMrVEFjWjNsV3FM?=
 =?utf-8?B?eWpMc1Y0UVVjLzJoWGZOU0xWak1yUE0zcy9ObGFQSzV4VEVhVVZkRmx3L2hV?=
 =?utf-8?B?MFE5VGpXWXpoaEFnUnViMmRML2RpSTFLa0ovbC9RcEpUclVPenRBZmpzMUFB?=
 =?utf-8?B?ZmtDdjhTZWxRRTdWd1VTaDBscnUvczQveUxpTTVRRlB4SHB6YkRpVjFQTk5D?=
 =?utf-8?B?eEpwbys5TnVndlZzMUdwR1V6QW96cHFJYjdTZHJ0c0pHWWx0UThyUDJZektz?=
 =?utf-8?B?MEcxcXp1aGJJbHJQSEFpRyt6V011MDJZQmRoNFgybG91WGNCWi8vd3JnWlFx?=
 =?utf-8?B?QjdFUHFpZ0QwMHFOVGk2QVNxN1I5R1Z5TWJtblJaWXYrQ3hGQmhxL0ZCTEl6?=
 =?utf-8?B?N0k3dXNhckpPMlh5WHlyaERXc0tKNFNLOGlVMWQ0dU1VaEpDbkcwNzhmb2ZS?=
 =?utf-8?B?ZFJWMGtFaEtSMSs2cHF3dFFMU2NOU3hONk82ZFQ1dTUvdXFlSU13Mm5KNk45?=
 =?utf-8?B?bmpVN0dmelBmb1FFK1hmMFZBV2loN3BpdEt1YWNMVktmOG9UQURnU1pVV1Jp?=
 =?utf-8?Q?DqPgFwLnQeQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2tKTVdUMEJEbXR1N3p2YWFqZWJsbEptckdTUmRqdGhhbkN6UmlLSGZMT2NR?=
 =?utf-8?B?S0Q4bVNERnpFd0VmRFJPZ09RY2VFVlBmNEh4VU9ZT0p0cHE3Y2Jtd0luYzJl?=
 =?utf-8?B?MHdmU3BPK3EyWjNNbEUyYU1Va1J1QUZjTTdiNVRvSTVDbVZOSC9uWmVkWXc1?=
 =?utf-8?B?NzU5MUdGMnZPV0R0Q1dDdWlvZUJ4dXBHLzRtTGtvaVpGZ0dZRTRyWTQ1dkph?=
 =?utf-8?B?MVl1anJ2WHZucTRmZWVlYnFJRzE2Y25DOWoyYVA0V3pydjZZd2doOW5KRTZF?=
 =?utf-8?B?UUZISVpRa1RUYjhJWi9oZExyVWszSUhyTFhwOW5Mc0lvTmFMeFJTRXJwaDJZ?=
 =?utf-8?B?VWFlMUxjVlVxeWpzb2ZiNFRZMmhVTndQd25mWTU1eldrUVpsQTgwRGZ4cHo0?=
 =?utf-8?B?cmdlVTk5NDc0dGE2VGJSb3ZyL041emdyR2hSdFptQ3VBbjNQWHNCNUVKbzZy?=
 =?utf-8?B?SzNvTlBuRldZMmJUSnVJQWVhMlArMC9tL3lZN2hBRFNkb29ZYjlwcE5lcGJC?=
 =?utf-8?B?MnVXOXl4TmdsMVM0ZHRqZTcvdVB4NUJFTEIyZGNaQmV0aWVCUmxWdEdiYURv?=
 =?utf-8?B?MnNzTlA2Rm05MUxXcFBmcmNvaW1TbDZrNGk5WnNCNSt4VjlLSW1YTGFQVEMx?=
 =?utf-8?B?aUVvTG44c2xXZXhhZjE2ak91czE3R1pOQTZsVFQzTXhRRXBhRm9rQ1YxaXhz?=
 =?utf-8?B?cGRGT01ubkJIU3FUQ0NWS041Y2lBN0xNU1pGdWJZbEhKWW1JUmxPM3NNWkx6?=
 =?utf-8?B?d0NsS0VJWitPMXdBT1BFNSt6d3NwMHA4KzBZNThIV25uUWhzR2YxQW5Jb3cw?=
 =?utf-8?B?UllxSGY5M1R5WWJEK3RmMVNzVHdNOXVsL0Fqd1Q4R0J1Kzk4c2h0YVYrRmJM?=
 =?utf-8?B?QStBeEVaa2Q3MGQ0aHc3RytIWGtlR3V1K1h4R0pYOVQ5ZzJuR016OWVpV2du?=
 =?utf-8?B?NW5la3gwSlR1NnI3eDhjM3NPK1dNOHhWZ2lLNU9RUU9BdWtOZ3NUdC9qZzY5?=
 =?utf-8?B?YzY4Z2tIWTFhTGZ3eEwwbjVRVEMxSkJqZG5mMGt1WDdWUTdwZ2poK2MrR3BE?=
 =?utf-8?B?c0lXMTE0TUZzSDFvSWcyQzdTN1JwRTd0S3FWQlZ1MDJ6aHRQOEN0dlRuNVFz?=
 =?utf-8?B?cnc3bFRQbmtCaUJ5dldFRURydVlaTVZXc1YwVjh0aEhZSnRQRmVEOXVnNVc3?=
 =?utf-8?B?bVpOOVNXR0VxZ3puVUMxS2RLSE80Um9DaGNBS2FuZnpxRnpxejZzdEMwYmJE?=
 =?utf-8?B?cDZ6ZjN1enlseWpJcVRiMzhYL1lXUSs0R090ekFtanpFdStXaW9hVzhKNzBv?=
 =?utf-8?B?ZDhhUG81NDIzdXQ4cTVpNmxvODcxMlQ5V3R3YnF5L0hMcUpyUklxZFJBT1pS?=
 =?utf-8?B?YjU5RU1FMGlyRkR0dUJKUm9DRk1naU5GdmFyRHE5Z0k0TEpCTWtaZ3krUzE2?=
 =?utf-8?B?VFpncXdzQ0JlbUpEU1VaYWJVei9NOGM3R2xlaWU2SzQweVJnQmRRb05ZcGpU?=
 =?utf-8?B?bzJmWWxNWjAyV3NSM2pNeUF2QXd3aFU2QzFZQ3RnSWl5ZFBlcTgvTm5oYW9i?=
 =?utf-8?B?RmRyVnBwQWxYUGl2dWRvZlFMbHFXYThIRDVrMTJNeTRWdGtCRjM4OVpRR1Rr?=
 =?utf-8?B?eXNhM2IrUC9za1E1bFpSbWdnUDlKYnVtRjQ1c09VRjJzUXBJNXNoNEVpMTl5?=
 =?utf-8?B?UVA0S01CdjZnQ01yOTRTYXpFZmQzQ0JNQ21ZSDFaekFJMzE4SW1ZMnZpT05Z?=
 =?utf-8?B?dDVYRjdRL2dDQ0pMUElLUDErUXFkdlBDSzBJMUtBcGV3NkdBcURNTlJqb1pU?=
 =?utf-8?B?aG85cmVJa0FuY0hnT21Yd3dhdHF5Y1Z4MjFDUHlBTEY3Snh6eEhIVFF5cVJC?=
 =?utf-8?B?eUxOTEJ6WUJ5Mnh2UE1VS0h6aEV6L3JaR0ZNUWV1aFhNekpmVVc2WlBnQ1o4?=
 =?utf-8?B?aWxHR0F0TDg4anhXZnlQdlBaMkpSVnMxQmhTNGJ1MTdzTERQaUcxU3d6WWND?=
 =?utf-8?B?dDc1R2hZdk1WQ0k3ZTBnd0wvT1ZDWkIxUysvRThRejFPUE80Vk43bmpUMmYw?=
 =?utf-8?B?azR0cExGS3RwMmhtSmF2THc2RTUyOFF1M043ZTdyVTNIdlNoVkhpQTRJNmlp?=
 =?utf-8?Q?Xdak+2B4qLHtCLupaK24ATx27?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11202738-945f-4542-138f-08ddc0980ab7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 16:29:00.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA68QNkFOuiFh6SFJsgJdm8rIgy1cSADDeZWB6/y5zlAuGuVdkiQ7FOoLF3bYXxEe1YZNUMWxMqCGWlIQyNd3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914
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



On 7/8/25 11:10, Simon Ser wrote:
> On Tuesday, June 17th, 2025 at 06:26, Alex Hung <alex.hung@amd.com> wrote:
> 
>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>> index 651bdf48b766..21bd96f437e0 100644
>> --- a/include/uapi/drm/drm_mode.h
>> +++ b/include/uapi/drm/drm_mode.h
>> @@ -872,6 +872,16 @@ struct drm_color_lut {
>>   	__u16 reserved;
>>   };
>>
>> +struct drm_color_lut_32 {
> 
> Subjective nit: I would personally prefer "lut32" over "lut_32", but that's
> very deep into bike-shedding territory. Feel free to ignore.

I think it's a good idea.

I got this from Uma's patchset. I will sync up with him to avoid future 
conflicts.

> 
>> +	/*
>> +	 * Similar to drm_color_lut but for high precision LUTs
>> +	 */
> 
> Instead of this code comment, would be nicer to have a proper doc comment.
> In doc comments, "struct XXX" is enough to create a link. (struct drm_color_lut
> doesn't have a doc comment, but has been introduced ages ago.)
> 
> "high precision" is a bit subjective, proibably "32-bit precision" would be
> better.
> 
>> +	__u32 red;
>> +	__u32 green;
>> +	__u32 blue;
>> +	__u32 reserved;
>> +};
>> +
>>   /**
>>    * enum drm_colorop_type - Type of color operation
>>    *
>> @@ -879,6 +889,7 @@ struct drm_color_lut {
>>    * and defines a different set of properties. This enum defines all types and
>>    * gives a high-level description.
>>    */
>> +
> 
> Nit: probably this extra newline should get dropped?
> 
>>   enum drm_colorop_type {
>>   	/**
>>   	 * @DRM_COLOROP_1D_CURVE:
>> --
>> 2.43.0


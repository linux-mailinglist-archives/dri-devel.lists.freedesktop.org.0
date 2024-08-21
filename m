Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F0B95A62D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681D910E6E2;
	Wed, 21 Aug 2024 20:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="udxbQnKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2058.outbound.protection.outlook.com [40.107.100.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AE910E6DD;
 Wed, 21 Aug 2024 20:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abh/IwH8agruMzLbNmajckiaS+wrJ4H8E7HTGpWtXWIr5Zu1ZxTu2XibVjTmhJlOwFcpnrw1ksqVVJsnPvAqtIw8QjTM8XGR8zUnx+vQZW8O+Tj8COcxche9VUkZbXT0qBR/LWMDO0o6DaUx1qXFVkWKNsiHcE2FvXLmgp7twwWSA0IZ8qw8ZolesEXdSAJb5pq/D0+Onx+HdU+EpUm8FHVfTVYYbYNOv6M5TAG/VeDwf9E3oHSBQXZpjX7Mc3U1VcynaIfMOb/TWBG0YkUHyjBThNMJ48Lomkx7uigmh15P8GgZIVnaLAsc1B6eD19Yq7gzoVLhK6QDVb8skMigmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q311TkYJa4SFFh8IpaLJS6ToBf8V1m3vRxNYOYRB6UI=;
 b=stC2dTgdvr+JWNVWq72zicRVAU6YqQJ12rVRASLh/bbrkSW7+mqZmfDY521XKQKoIHeotY4mpJFYICZjsl5nCY00CPUeDoltpPnatwirpvcAX9OQRJcApYewqr1Dq3Ocd3/3kuTu7c8dPQEVmMhjZN/aFzheHk91B+MHI2uNFg9Tkz3o1RqK+PAt0GzCEwvB0RABsQJbbfhI6v/VVFieGmP+wUCoQnWUI+yFVzVZ2VqZfU2D8IQzfDmjRR/7LoZSJQC9VIbrQr/kWwMl2EdMmP8yfUKbG6vGQyOW7UoJeRMNZ0IL49jZBfXFvfJO3vMZfoRKN8hG92y7o5l7Yn7Ugg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q311TkYJa4SFFh8IpaLJS6ToBf8V1m3vRxNYOYRB6UI=;
 b=udxbQnKCEaDSnwSFZ50GFSNNxjyfhGxzSCrRcCbbi6/caq8bNMv9koo1RGb839liWlmfFXeGyeKEzbYuypMFq8Tx73ey35MnafT1p8oBzdKo0ncHFbl1ZX3FxQbCXKU3oVUol6/FM/U3b2bLdJFGPzAQcN7tiA0DMcMdM3j4Kt8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MW6PR12MB8707.namprd12.prod.outlook.com (2603:10b6:303:241::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 20:54:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 20:54:07 +0000
Message-ID: <269b2e72-2f93-4415-a56e-77536f373b22@amd.com>
Date: Wed, 21 Aug 2024 15:54:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] drm/amd/display: Add support for minimum backlight
 quirk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>,
 Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>,
 linux-doc@vger.kernel.org
References: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
 <20240818-amdgpu-min-backlight-quirk-v5-2-b6c0ead0c73d@weissschuh.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240818-amdgpu-min-backlight-quirk-v5-2-b6c0ead0c73d@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN1PR12CA0093.namprd12.prod.outlook.com
 (2603:10b6:802:21::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MW6PR12MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: acc68d30-cd61-4533-5b9c-08dcc22365f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGFqUyt5Q3BtbUlDemtGbFNNb1NyOHBtUmtjMXlFcW5ZcHhTVXVXVmpYTU5F?=
 =?utf-8?B?WTlueTl1ZmN2SmlaV2U3cVF6T3RvaHZpakxEWDBoc0ZKYk9XbkV0bE51Zmdt?=
 =?utf-8?B?TTM3dnBRVDFYZlZRZWd1d0ZLQnpwT1RqMmxSYjJlMlIvMlczQjIzRkQ0MCtz?=
 =?utf-8?B?R1lldG5oOFZyRndCVzR1alJkNTBzREZZWVdqT2xIZ0ZWZ2dVbld1bWxVU1lL?=
 =?utf-8?B?ZDBabUJ1NlhBTXVpYmtFRTg4UWhlcDJEK0k2RjNwL1NDUk50bXo5Vnkrd2o1?=
 =?utf-8?B?bzR4cHRnWHM5RE81Nm1YS3hGcUlXRlc1Y1QrelpjWDc4S1dldGNGSzhTQkhK?=
 =?utf-8?B?aTVNeVM2V0kzSlNsb0NxQWJROXp3WWViSzErdEptZUNTeEdPZWdqeVMzZnJ6?=
 =?utf-8?B?Q1RPRGNCRDl3enhudmVnNEh2UWRLdlM5QThDRnVpNEg0VGRBeG5oS1dZWmtn?=
 =?utf-8?B?MVdpSGQyb3gvbmpYU2o5OXJReG9TeG9GSUM1cUpxd0lHakFvUlJleGdZQk5O?=
 =?utf-8?B?S1hmWURkbUtTWEJKKy9lb2pQTlVqcGhRTU9MSHpHM1dkaUYvWXFPQkJjbVdE?=
 =?utf-8?B?bGVaM2Z1bWZZV2ZJZEZKUHNJSGRRUEVBUEpXZlROeUNWNlZuNm8vT1FHMEtq?=
 =?utf-8?B?RE8vUzRoYkJMQ3doby9OSEFVTW1FWXF4dWR0NW5haEZvRWwweUxxcGVWTkNW?=
 =?utf-8?B?eEJVeUp0ZDJnVHF0UmQwOWprNThHQUdXYWlZSVQvK09zNUxmdnNKekhGb05q?=
 =?utf-8?B?cXJvb1RlSlpTdCtyS1NVT3d1UVNUaW5DYi93cmtCOHIxaEMzeUpxTjZ1MHlv?=
 =?utf-8?B?QnQrMlZTQkpyeWxFZnpIMlIxNG1xL2xNZHRTK05kbW5RSEpFQXNmanA1TUh0?=
 =?utf-8?B?SFIxNWVLZDVXSHV6cnpsbEFXNHZnOHpkeWhUK0NDQ3k2KzBsSjMzM0xQRFRp?=
 =?utf-8?B?SU9XbXRRaFZkTGJjYlpTN2Zyenl0WDZFMk11azVXbEVKSXlzUEpTaUFqaWlG?=
 =?utf-8?B?c0xuaVBBTTFNNTFYVkRSUmRXRkdHOGtsV2J1U2hvR0tNSU9jMFlXdkdiZGRv?=
 =?utf-8?B?MkE0dFhhc0ZxTUNMMVpPTW9hQmFPM21xT3JLTVJXMG13bnFnMTVFTlRSQzFs?=
 =?utf-8?B?UTBCMzVhNVoxRk9UNHpkVTBuYjZSMG40RXJMbHg3R044NVYrZlQ0bUVMdDdk?=
 =?utf-8?B?ZXJzNFdXSU4zL0tVQmRZUWsySllSSjg3T2dyY1ZreWZXcEFJZzRiV29HS0Zp?=
 =?utf-8?B?WnVWQjR5T3gwbjVCRFRMbnFtUE91OHo1SE12eDdSb2ROd2JkUDFQVHZRL2sz?=
 =?utf-8?B?b0UvU1dhMjFPbm1ndVFIM25LTEVtaEJJYlR0SDFwK01ZYU9PUVVSSmVOZTBy?=
 =?utf-8?B?N0daVlF5SUtTVithUnJZKzhBMHBrMVhtbEtCRHpXZmgxcDh4bWpRT1NWZHg0?=
 =?utf-8?B?MXQxcXFBd2pyU2wveEFQVU9kQmh2aVZJbzJpOUxpZEc5RVRpVkRxREFXUm5k?=
 =?utf-8?B?UjZPRThnaEpjUlc3TEp0aWZ2anFiUWx2TkNza1BDaEp0Rk5BUjdMY3VGZG8v?=
 =?utf-8?B?N2hHYWwxZHN0STlYQUhJN1JIQnFWa2hqcnNWV0M4emZkMzRuRVNURFI5VUM0?=
 =?utf-8?B?Zzl3eTJuUk03R1c4ZUNFeFVvV21rTWd6eExNc0lJMGtZMXljdndqUHUyanZ2?=
 =?utf-8?B?SFRGdnBCWENRbWthaUdWQld1b1JzTTFYRFhhcUx1OTBJTDR0WE9hY2ZoWjBr?=
 =?utf-8?B?R3RYb1U2Q1pPYWgvN0ZRVHFsNXByc3JGcVZHSkF4NUJ2aVNtb3l6N1VaNVll?=
 =?utf-8?B?ZFJaQUkrOC94OUJEdS8vUmZWRFE3Q0xvd2tyckk4U2dBYUVIT0RpUzA5ZHpP?=
 =?utf-8?Q?lOKsmVH+MLddQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTE5VTltU1B5aHlVSllSR3Nabm5nOGUvQUllbmtncytWRW4xVzA3bzAzZzFw?=
 =?utf-8?B?bVRZWmkrSGY0RVRYVUduOXVjSC9ZWDNjU0lGYzhGNlM3NHZPMDRjUEpPQlN5?=
 =?utf-8?B?cHFwVytva05ZdVNCL1drYldGUTY5M0Z3UU9JR2NReHZZQTM5MUJrMW1Qa3ZF?=
 =?utf-8?B?MHpnZEl6eS9XUzc3YVlEVkx5ZnVJMjRDQ1Y0d012VmYyZGllN090bitjLy9S?=
 =?utf-8?B?bXhaQmJ3VXV5M0t1TTg2eTNhUGc4b0NHODdabmRlbjIwNlpETXJNY05SbVJO?=
 =?utf-8?B?SUNpZ0JqNUZjZHFJOS9pYWVvUGR5NUlIeVlzRzRicXV4UVNrZFBYOHpSUTc1?=
 =?utf-8?B?Ni82Q2ZuanIvNGZTODRiQ0VmV3hLYmU0TmpjQXdPWVZrTWxOa3QzY0pqMGFI?=
 =?utf-8?B?UmNobW42RGE0Q3YzaThTZHFiWUVaN2dnSU40K0hPUitlR0s0cmhEWis3bWk4?=
 =?utf-8?B?UkhHYWFQeDY2TDRzU1BOTTRoc2FLVExrUkt1dm5XU1JpWUtoVWJjRG95Tmph?=
 =?utf-8?B?NGF3Q2xjc3QvcHhoOTBKVk5ZYWNkSVVhaW1SRk9xZFAzKzZ3RHNPNHloRVY4?=
 =?utf-8?B?Rkt6bWhpZ1krRG5zOEF0YXVXNndCWVVLRDE0Y0VYbWNQSlEzcWtDM25lMWF2?=
 =?utf-8?B?ejUvOXpJc0ZsU0YrbGFhc0xSK3VFbElFdVA1bHVrUkxRTE43cXIxYk5NUFo4?=
 =?utf-8?B?Zy85RndETVRXSGliMlEwU3FoN1ZKakQ0ekhkbWZiS2ZlYVpmQnJxWEFYS2k3?=
 =?utf-8?B?Q2VzdGhpR213VE9wODBKWUVNRWZVcWxDRkxOREowcnFpUUphRTVpWG9BcXdk?=
 =?utf-8?B?QklPaUkvRmZQeGNQRzEvYWhUb2JLcDUwL291SUlMdFhuc3p0LzBYdTBiQUdG?=
 =?utf-8?B?R1hDN0l1R01TRTRsTlRta1JmOXBydDBMZU1QRnJxUlc0TFdxYm1iNklUb2Z1?=
 =?utf-8?B?MW51aHl3M0ppWDZlOER5K21peXZNdUlOMzFYbEw1NUxhUWJoeUlvY1BPYWE5?=
 =?utf-8?B?M1AxcmduWWp2a2dkaTQ5RmxVNFh2b1dCR2lRdVVkWHUvYUxGalJYMVNvQzR4?=
 =?utf-8?B?MUNYNVNkRGw3Snpra3NZeXltVmtCVHJtdDRTK2pGMGtrSGx6aUpPUW4vcFVN?=
 =?utf-8?B?S0pRWGhGMHhqeXRycFJCcmJTYytYTVZtT3d6SGVyN3BPQ3Q1bDRoMHNQWlR5?=
 =?utf-8?B?YmhOdjQ1Q1dXd2o1NnJYWU4vNGhyS3RlSm9LeDVTUmVsTGovUmpVQ2Vob2tG?=
 =?utf-8?B?QytDa2U3QlYvVnZ6bU5rVDdJMjd3MDMwaU1YdXBGOVE2QnlXZ0FhOFYrRlAx?=
 =?utf-8?B?YkZLb2xxSGZ5KzdCaWoweW51aWRFWkl0dTVUT3lEWnBiTm1pWEhFOTNhcFEv?=
 =?utf-8?B?REc0VVh6Q3dUQzVPRlNsUkVIK0dQTkhqNnpiL3hqUFROS1phTHBKVkpacHZH?=
 =?utf-8?B?bHFvVnJTbjZhbkF6ZWVLK2NaYTlrdUxXTUtEN1lBZUJjOUk1Z1EvcHNMWWRY?=
 =?utf-8?B?WEZnc2xCWWVaY1NQYmhtYTNiRThrclRRb3FlV2JSZnJBZ1I1eGdnL2JBMGh0?=
 =?utf-8?B?QkdQRVZjaTU2bFBWd29LM0lsa1pBR00vS0NkQnU1RlVkV0ZkNGtKcTRycFNU?=
 =?utf-8?B?V0RoM09XdVdXcWRuUnJyTHlMbVc1TkhyWldFQVEzZFNMd3V0QzF3eWtuNE1G?=
 =?utf-8?B?R3Y1ZXZEQVN3dk96Y3ZkNEtHYjExb0R4Zi83R1NybWorTHhvSXNMK3pLWlky?=
 =?utf-8?B?Q0xUV0hXYXZsU0RCRjI1cXZBcmQvK2xaTXV5WUIrSHVnZEVJaGxFNEkrWmhG?=
 =?utf-8?B?SjlESU5zYnNSNmJINVBBQzgwUVRKTWg2S0pIYkx3b2hxZmtpZjZQUldmMk56?=
 =?utf-8?B?MFNsbjdseCtURTQxR21aUFFYVE0wbTdWbndVc0VDTG56UHZkSXFhZnFvYjJv?=
 =?utf-8?B?YzY0TkJCN1Nacy9sRUl4bFNtWEI0em9rL2lmM1Z0SUQ3eDBZY25jKy9SVXdz?=
 =?utf-8?B?ck15d0p1UkhzSmlpVFlGVFJiNm85Sng4R29Pa0xSZy9Rd0F4dTFOTllkbWw5?=
 =?utf-8?B?R0EwT3NDU29FUlkzeCt4cC83V2kweHROZmJOenBYMmxiYTkvUVFLOHg0eWFT?=
 =?utf-8?Q?VBOGXUK1i/wjHP2jB9fWsE7Fq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acc68d30-cd61-4533-5b9c-08dcc22365f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 20:54:07.1355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bK+w8LV6gdps6LQos9q0wmc13nzscNQCMMFKCk+Fsix0yuNPScU6uZqui5GMnVZzrP9Xx2ExrjO456qt0dUHDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8707
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

On 8/18/2024 01:56, Thomas Weißschuh wrote:
> Not all platforms provide correct PWM backlight capabilities through ATIF.

I don't think correct is an accurate term here.  How about 'optimial'?

> Use the generic drm panel minimum backlight quirk infrastructure to
> override the capabilities where necessary.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> Tested-by: Dustin L. Howett <dustin@howett.net>

The code looks fine to me but please wait for an ack from someone on the 
AMD display team.

Also, I would like to see comments about the testing with panel power 
savings enabled to avoid a conflict.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index 0051fb1b437f..655c10aef2e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -23,6 +23,7 @@ config DRM_AMDGPU
>   	select DRM_BUDDY
>   	select DRM_SUBALLOC_HELPER
>   	select DRM_EXEC
> +	select DRM_PANEL_BACKLIGHT_QUIRKS
>   	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
>   	# ACPI_VIDEO's dependencies must also be selected.
>   	select INPUT if ACPI
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 983a977632ff..056960ea335c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -93,6 +93,7 @@
>   #include <drm/drm_fourcc.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_eld.h>
> +#include <drm/drm_utils.h>
>   #include <drm/drm_vblank.h>
>   #include <drm/drm_audio_component.h>
>   #include <drm/drm_gem_atomic_helper.h>
> @@ -3333,6 +3334,8 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>   	struct drm_connector *conn_base;
>   	struct amdgpu_device *adev;
>   	struct drm_luminance_range_info *luminance_range;
> +	const struct drm_edid *drm_edid;
> +	int min_input_signal_override;
>   
>   	if (aconnector->bl_idx == -1 ||
>   	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
> @@ -3367,6 +3370,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>   		caps->aux_min_input_signal = 0;
>   		caps->aux_max_input_signal = 512;
>   	}
> +
> +	drm_edid = drm_edid_alloc(aconnector->edid,
> +				  EDID_LENGTH * (aconnector->edid->extensions + 1));
> +	min_input_signal_override = drm_get_panel_min_brightness_quirk(drm_edid);
> +	drm_edid_free(drm_edid);
> +	if (min_input_signal_override >= 0)
> +		caps->min_input_signal = min_input_signal_override;
>   }
>   
>   void amdgpu_dm_update_connector_after_detect(
> 


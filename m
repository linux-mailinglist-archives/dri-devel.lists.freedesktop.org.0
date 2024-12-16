Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E889B9F33D0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE12C10E6B9;
	Mon, 16 Dec 2024 14:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TQiQ2eQD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5F810E6B6;
 Mon, 16 Dec 2024 14:57:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+PPvvO3vYZkFiQI8dnL5b1BqdU28P1WET7hpDt3y04eqUYGY3k5q/Rzs8zW7Lv5nZV721xuay6/mWyw92txN7PBeHvGH3wMvlaAohjNCozYC2W2gnq6cyyxhR7gFH4gdmDzEf68G0EJh8OJcl7omeI8+qUKvACn4rFANRCKDVSFCYUCVbKx4Px2l1h2b5+2iHLaBiHmhVVHH0WBtDwMAm2Y1UGHDGhcSWXj2l8foVEfeBeg5+jx1h58wtaOWav33t2cSIw3n65td6sF5eT2se+WP4/yfCxjsB9/++TFnCegvfGXmun0hALQ9zO2PL5Vc9TnvO/a/UlmkiTQOR4mWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ts46dVrD6JlCMbSciAxmYQXXOwMrBq4VUw43lavFMc=;
 b=RxUlwFsTOOH040tlNjsPbhG9rulp7JHMMPs1kVIO9jRFWzcEZ27c0yWvcW4jbtXhVTB4hZNAgN98RqjCiBpgMuGnbPbMvMraxasiloiE7lU9EGY+fNRmXUp6cQ2xTgLu42BzONRCDnWMjQlgwN4+cs9RN3O07WEEONxGRIy+ZxRDICdEETvtWGRtDRReeuyInpFybscMy0sWnjw/zaxVOWLP62F7lM02nHqmlondk0iLIn7/nGFNTeM+Nl9EUy1NfAwk5+o1hY7eUKM1PCK/kN3Ibc/ztPKfMtla6GllRB9ChjUSo9o66xf7r8AF5fABf842cUGYOWBNQSVi/Ks/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ts46dVrD6JlCMbSciAxmYQXXOwMrBq4VUw43lavFMc=;
 b=TQiQ2eQDd/0xC3iM99QmDjqQ2KllUqKYGJ+O/sJ8RT5IUSTAlqqDILfNJwzHpQ3adcc0tu0gYqR2RdtrTF9dz6oELFW6vvNcLnQucAwM8/wTpcj5CyVqASybGDHEfSoxCgPMcipKERAvdVufUbpxspDLGbaBSW9SICC2qgowOSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 14:57:39 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 14:57:39 +0000
Message-ID: <b5959b38-c81b-41f4-888c-b6cfb85585da@amd.com>
Date: Mon, 16 Dec 2024 09:57:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/amd/display: Constify 'struct bin_attribute'
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Qiang Yu <yuq825@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lima@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20241216-sysfs-const-bin_attr-drm-v1-0-210f2b36b9bf@weissschuh.net>
 <20241216-sysfs-const-bin_attr-drm-v1-5-210f2b36b9bf@weissschuh.net>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20241216-sysfs-const-bin_attr-drm-v1-5-210f2b36b9bf@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0335.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: d4559665-2e19-4a1f-e401-08dd1de1fc55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nld1K05pTXR1K1piZlNxUEpJOG9UYm00UGlzTlRRODIvTUl0YWdPbkZudDRP?=
 =?utf-8?B?cjVUdmlTam5yNWExbjQrMGVRajBnMDF6STNnNUdINFFWN0U1RFExU2xHbnlw?=
 =?utf-8?B?RGJjdmprV05rb1psZURneW1sKzBxcnllLzZEOHFVUU5SeXViSktlYXh4ZEZF?=
 =?utf-8?B?YU1KZ2JFR0hHTmFtVC9ETmZ1MmZQQy9XaUxtUzJKZGFla0VXblViRDlEamhB?=
 =?utf-8?B?K2xManBQTnFvZjVKZlduMUlEVXNCaDUxL2RsQ0lHUU9yY3pZU1JWb0RteFlF?=
 =?utf-8?B?Y05yRDJMcnptV09sVG9LaE1OdFZxU2xqOHA5V2NFQXNqQmpwUnR1OVpUdXha?=
 =?utf-8?B?WHExOGl3anZRcUVjTGtUaWdMQjJJQmNnQnV4TjJzOElZRXVhK2ZEb1BmZjhy?=
 =?utf-8?B?OGdKcTliT2VJa1JqVkFMcFZMMlkvUFNMUEVCRkpyQ3JiU0d4Qi8yVTlZZGdS?=
 =?utf-8?B?cmZxOVk5OTZDSmlpNjE2cm1EckxZMjdGQnE5d1hwM0h3REUwZ3IrSDNpNGJ2?=
 =?utf-8?B?ZXdZWFJ1WFRTY29TY2lNNmJjVVNuQmdCSWNaazd5VGZkdVZjMWVFM0RBNVRG?=
 =?utf-8?B?UlEwZGVrYWdiRlljbHVMelBrUEhucy9uTklDTWVQMXpCZEhEL0RZeTZHdTJW?=
 =?utf-8?B?anZyOE0wbUtPNHd1MXhmVWxNUm1qa0hCamtMMFRLVk9reTRqNkd4WktGaVpG?=
 =?utf-8?B?Q25maVhmS01pa1NraSsycW1UVGFWamwybnlnalY1TmRRZzNua3RPRllpd1B5?=
 =?utf-8?B?YUthYm1UTTEwWnYveUZOVUZETHhXOUpEMkkxaE5MR0xuU2NaQVdKZHNscEVK?=
 =?utf-8?B?Q2FQWjB3blBYbUJKc25GeFdVd2JkbTRWVWZ2Z3BQRXc0MDVqdnpUUDlVWHph?=
 =?utf-8?B?NC9aTjM5akRrOFBzR01STzFQaEY5YTRFR2pEWHh6RkVmTUE5SEljQTBoZ2RX?=
 =?utf-8?B?cnRzTGc2dGdyZXIwcFA1eWlhK01qSEZwOWVCRTBYWFRKNXZPSSs5cllTdm1y?=
 =?utf-8?B?KzBLdUZYMGthZExrNHZraGhReHJoZHU3YlVtVm00UmtTbnpHK3ZEaWpOeGta?=
 =?utf-8?B?NHdSOG52OHZpNWUzZGM1YWZXQTRsSk9Damp1MG40SHZiZVo2M21TaXd6Y3FQ?=
 =?utf-8?B?ekI1OUxZOG9FZEFXbVNTangrWGQzZTlWRGFveEpsckNPSHk5cEV4eFY4T2Fv?=
 =?utf-8?B?dW9KS3FPSnVxSlRNTDlFTk1EbGtNMkZKaE9tNm1jdk1GVmVHMUhGUVlWRkRZ?=
 =?utf-8?B?bjkwZWxwbkRCWGN0M1F1QzBxSFl3d0g1WkROWnVwTEJXejBOVXRpOFhOejBh?=
 =?utf-8?B?QlB3TUpxekZ4UjBlbFpUeGpZbFNhVmhqQ2dzbW9KM3VOdnVVRjBJVkZaN0ZX?=
 =?utf-8?B?QnE2NnpxVW0xKzN2RThFRWM0MXJtSXVyRTcralJxU09JelJ5cjBIUDg2aVE5?=
 =?utf-8?B?czNRNWU3NTA4Y3ZsR0huVG1Ua2F5eGNnYi9VSGJFOFJwRmFMQnRvOGRjbDFw?=
 =?utf-8?B?aEIxVWxaeXJMQWMyZExHMVczK0tBbXZ2L3FCcjJXNmxVb2NyMXRUdjJyd1hs?=
 =?utf-8?B?blVCdmdrUHZ6amlXaVIybXVVZzQ4cU1sV0NYYlc2eFJGb0VWcG02ZEh1TDdY?=
 =?utf-8?B?VlBKZVNHVmIraFdLVHYwcGhWeEttMjc0Q09ZcEgwL25QUEJkQXFHWW9iM1FK?=
 =?utf-8?B?SEhFelVoKzlZUFNnOVBYSmtaSkZaYVA4MFo0Z1IrUDQvSjYzMXMxS3RkWlZU?=
 =?utf-8?B?KzNCTlJGT2hpTnhDR3VYTUxJWFVCQk1WdVpEbVJoTnY1Z29aU2x3anFkWjRw?=
 =?utf-8?B?cTRMYUZ5bzcwSnNETlpFNWk1V25aaytYZG4ydUlldTlXeUlBZmNOcFY2MjZW?=
 =?utf-8?B?NFpWdjA0MWZYYTU0bld6SE11clNaRTk4RDVGL0p1YkdITUM2WmJzTFBQeXZR?=
 =?utf-8?Q?KEil9GtFVG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUJPS3dBd0xJa1A0bWt0c0d3NXhlMGZ2V2xvL2FjbEdLTUMvZjB4cTl5T2Rq?=
 =?utf-8?B?dHZrUktxcSs3UjJXMUk2azBoNHo2aGFFbmZ1YVdIOWZkd1FtMlZiY1RDbXRK?=
 =?utf-8?B?K1V0TXJTTVNpSXRmb2VQZUNib1kyVW9CazVpNEsvbDVxd3Z2QzJ0S29TOER5?=
 =?utf-8?B?RFcrdmRrdDE1VFAvQnFOdjNRQkxNdDc0OWU4cFNFN05LWWN1TW5PbE05UGlm?=
 =?utf-8?B?NEt1clJuU2F1Zy9KTzlqMFRXM0p4YkNab29xZjR5SVBzazM2NU94UFhtMUJi?=
 =?utf-8?B?N21sT3RTUTRtQjRKank3eEpsZUE3VzFsUGxram9ib0d5bDVnbFNrY2NiNEdy?=
 =?utf-8?B?bXBMaldVT2VEMEgrbzhweG5Sc1kxWFdrVmRkU2J6aVFCT3d2KzZKd1Z0eHVv?=
 =?utf-8?B?L2ZPNkt2R2dLdlNzTWVkVGxHRlU3ZjRNY2tyNTh4d3E0eFZVNmcrRjRzVjM2?=
 =?utf-8?B?U2NTUy8xNUFyWGxpbU1LRzJjeklwcjZvMW5UekR1R1prTmk1Q0t5emYwRGtZ?=
 =?utf-8?B?NE53UHNKRDZydHdqNmprN0VNQUVTUlhDamJySG1zMmFzRWlrRElFL0w1NitJ?=
 =?utf-8?B?VXNmZWd3MVVwT1VCdGpZekpocHBtNks0RUMrakh4M2ErbE93bFJEWHpON2l2?=
 =?utf-8?B?VnkrT09KMW1TTVN1Vnp6Uk80azZDbC9sS0R0bDJHaTF5VkRKUHdKeXRMTUZW?=
 =?utf-8?B?MVBTM2ZDa1dOMExaSkZOQm5sbkdmbURzSE42VGU1Y2YxZm9ESStJL2dPTVFa?=
 =?utf-8?B?TzdhbEdBZmpCSmI2cTVLY08rUncwSEhBZnFsYkpxTFdZOTl4VWhmYlhsQzdw?=
 =?utf-8?B?cXF4Und5R3ZCM1paYkp4QkllWWZjYms1dTJMbzZlaUpseUZEK1E2ZFNmeUZ0?=
 =?utf-8?B?VHdnZ2ZpM3BHWHpJRVNHTU5xR1JKZEw3VCs0QllKMWJKUXFnV0lRUG1zNkNo?=
 =?utf-8?B?K0xNZmZDN1owNWFTcDZUeDhseTVnR1BzN3lnUkRzMHZsM2lwVE5HK0l1dFpx?=
 =?utf-8?B?Qm9ld2RiQkVBTjJVUXVzU3kxQXpnWnB2bE5YWG81MEJvNDJ4alp1YnZNcVBs?=
 =?utf-8?B?dm85dVRJM3czKytDSUEwMlZBMGpUNGwxMVZnYWhITnpKaE1PQWpkOFpTTTJ3?=
 =?utf-8?B?bGtlOXZRRHVzNnVBdEFTZnBWQ1dlTEk0UmMxQ2JHQlVWdFh6Z29OMnFBWVA3?=
 =?utf-8?B?eDRzTkJweGNBbDhRNExwTFlIeUxBT2RkclRHeDRKMVY0UTFQeTgzN3dacWJD?=
 =?utf-8?B?UGswbWdCajFoUWpveTExWjIrUE9MTXRlUHViZnVlOFNkVDJraGo2RStxZloz?=
 =?utf-8?B?dkU1ZlIyQWgyM0UyZ3BldTRUUllIYzdERWhRUlBwSTVXTGE2MkhyY2FRbER4?=
 =?utf-8?B?Zy94M0Y3ODVaT0crczdEZWwrYW1ENGNnTTRwMVRvVWU2MFlmTHJnMktHazN3?=
 =?utf-8?B?c0NpUVBCdWVxTEtFOXRKZ2Nhb1ZQa04wNFdpZW5SYUxibCtJRXN2WXdxbjFJ?=
 =?utf-8?B?WmZscVdmMHNrQVk0NWZZQml1ajNHMnhLSjAvbTFYK3Zzb0toNnp5SGYyc3FH?=
 =?utf-8?B?YU5KVnh3QkVtOGoxZ2RSUy9YWEJ6VndWdHBKRG51Q0ZUSHFMNGVtREROVGNv?=
 =?utf-8?B?UXhobDNDQnVhODBpS2dRWUVRSitCRUZxWm82cHo5UUNBWVdMc2pOME1FSytS?=
 =?utf-8?B?cGNzV3V1c1orRzBPUTNJZjEvbU51ZnArY1VmbE9NM0ozK3cwZXhIUlN4ZEZi?=
 =?utf-8?B?bjFjSUtyNE1EQTZnckgxaVFxbVJWeWlRcDdia3c5V3owdnBEWnlRaFlVSDBr?=
 =?utf-8?B?SFVaY0h2QmxlM2NwVXd2SFI2ZGNXRVI3MjZ0OTV4c1lkcjFRSUdIdUlFeHhY?=
 =?utf-8?B?VE9hb2NRZXBXWGtqSTF2K2NNL1A5ZzIxOHZhT0I4aVFUQlRCcUdWTStIaklx?=
 =?utf-8?B?OFcraVJPL2huR0tMUzZ2MmtFaC9ia0FxTXQ0NWh4c0NOelNsdHh6OUF2dzRR?=
 =?utf-8?B?am5iNllORkc5SXlXcjNaRU4xQzlsbVFVcFJYc1cyNzNOeWJDYjAwcGIvcWdN?=
 =?utf-8?B?UjFSbVMxTGxRWkZ1ZTBESGUrS25JSFZpVSs2ZnFyd0dkdWlkdGt2V1ExK2RN?=
 =?utf-8?Q?yDDmnjw6awSwMt9Z51rvLBFEH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4559665-2e19-4a1f-e401-08dd1de1fc55
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 14:57:39.6479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU6ptG9LQqmgLX6hYEONW+D/L+RzPjZ0WSFuW6o/x2/fZJHANp6T5HHTXcZBt7aMs/OroMvIn5S1R7+kUzRzCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481
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

On 2024-12-16 06:34, Thomas Weißschuh wrote:
> The sysfs core now allows instances of 'struct bin_attribute' to be
> moved into read-only memory. Make use of that to protect them against
> accidental or malicious modifications.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> index e339c7a8d541c962aa44ae25ad97b864285394b8..e27d077396327bbe25014aec5b978293b1c20dac 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> @@ -614,7 +614,7 @@ static void update_config(void *handle, struct cp_psp_stream_config *config)
>   *	incorrect/corrupted and we should correct our SRM by getting it from PSP
>   */
>  static ssize_t srm_data_write(struct file *filp, struct kobject *kobj,
> -			      struct bin_attribute *bin_attr, char *buffer,
> +			      const struct bin_attribute *bin_attr, char *buffer,
>  			      loff_t pos, size_t count)
>  {
>  	struct hdcp_workqueue *work;
> @@ -638,7 +638,7 @@ static ssize_t srm_data_write(struct file *filp, struct kobject *kobj,
>  }
>  
>  static ssize_t srm_data_read(struct file *filp, struct kobject *kobj,
> -			     struct bin_attribute *bin_attr, char *buffer,
> +			     const struct bin_attribute *bin_attr, char *buffer,
>  			     loff_t pos, size_t count)
>  {
>  	struct hdcp_workqueue *work;
> @@ -698,8 +698,8 @@ static ssize_t srm_data_read(struct file *filp, struct kobject *kobj,
>  static const struct bin_attribute data_attr = {
>  	.attr = {.name = "hdcp_srm", .mode = 0664},
>  	.size = PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, /* Limit SRM size */
> -	.write = srm_data_write,
> -	.read = srm_data_read,
> +	.write_new = srm_data_write,
> +	.read_new = srm_data_read,
>  };
>  
>  struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev,
> 


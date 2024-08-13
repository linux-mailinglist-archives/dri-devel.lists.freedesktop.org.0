Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA229500CD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 11:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F6E10E07F;
	Tue, 13 Aug 2024 09:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Z7xK6XoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAED10E2D5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 09:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WDhbWnYY2/Udac1YcnRLS+Kycb7DS0gcVEkQebsMsH1QK3yRt6SFkWfrQZxQ4QmpltAnwZ2cPTzhXjQ2zI5hBL12CnR/LBIwuQQxhq5nDarB+x5HavODUUnv1m/7pIfuyfD6utt7tHGeyQgltCRe4cl2zpk/nnlXQVT0k84eY6bTBJsnvA7KzP4fgDygV9jUUXX3D47tpBuhkDF7a733msTh+gAG2ZtHDvQnizgqIGy7iZkDnbViqpJ59KaOOyvNGvxoq8Apyg+hkWHbpZEsEDX970MuGdAJm5JTaKkFnInuybtMBkv30TtvL/DrhsXISnnjSZkzA9XsjdtoedXXMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTn0BzRKTwiLZKTuKqzQTczqkn80pNa+NRgRfpbQSwg=;
 b=OS8WGebSfxYc+22B/yZV8PqQlPqD7rJVlgSFPVqTLeuN4m3xKGwlDnHgh6ovMiYtGRXQR+vjSM1dV7ArW64aARjxiFzwKyUlxh1avqcURp+8yo+BE0dKoYST0cD8yRzvuhHOKEcjfy7QFe5baa7RdtTHBCh+RmMezY2G+NTrRr57i/YABNf3WbfY5DEICn98rxfnWD+Bt1tT+MhSosa/uejE2Fd7M7wUeBkVrLdtP47gBJ3AGcvHVQTdyPzQlssKoh6U1A4pJ+4a2TfOgyRskaPMXrhh5t0Y3bPVnEJmUgn4MZmoYU9uqsxlAufnVpfhY1x56vLmp/mM0DiPqtOPQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTn0BzRKTwiLZKTuKqzQTczqkn80pNa+NRgRfpbQSwg=;
 b=Z7xK6XoTY4FCifL4ngbUVsor9BAZfKA1fXWfKLcMOxWu3PoXB76kspBFjAUEejLLiXwzFOsGN9RQALgOR6/BaY/YyY9Xs5wXh6nkseDrBWCeGNBUnBOOYpcfLYqZnpYUwqVMlx7e0wXYUwQY4idFLs7HW0piMY/F80EgkTqIOuR7C5CxYxgTvDpnBq1/TbYRVwHyBombwbBnG4d3fToa9Ko3Tgvziv8XVmwyb3BnHdeqaP+EO/pZr8uVM6ljowWaWWcG1yUxUuZ5PAhafYvPHLYP5czgbeSDSrmmVY61LgxHABMn5qPSusidVHUnvrO5HwR/mtlpo9TE8aCXr+Ms7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB7198.apcprd06.prod.outlook.com (2603:1096:990:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Tue, 13 Aug
 2024 09:05:39 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%4]) with mapi id 15.20.7849.019; Tue, 13 Aug 2024
 09:05:39 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com, Huan Yang <link@vivo.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 2/5] udmabuf: change folios array from kmalloc to kvmalloc
Date: Tue, 13 Aug 2024 17:05:08 +0800
Message-ID: <20240813090518.3252469-3-link@vivo.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813090518.3252469-1-link@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0041.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::15) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab71fcc-9f61-444d-a0e7-08dcbb771a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmFvRnFZUENNUWVPUW1URW8xWTNpdEo0QTBqbXpkczZxRmZoUEV6OXc0ZkJp?=
 =?utf-8?B?YUhjSUhlVDRDUXp5L3N3eWRyTHBlZ0RkS2xnN3dOQlRrWHViUFpuRFBjaGt0?=
 =?utf-8?B?Wk04WEx3WSt2UkNIN0hyQU9nT05sbWE4c2czaXk4aVovSzAvRDVmNnVtNzRr?=
 =?utf-8?B?WWkySU9wUnp0NldvS1ZTbGxDeUhDamxiYlhBZ3o1N2k0UGg2MlMrK3FMUFdp?=
 =?utf-8?B?QWg2TGpXNDNRV1VIS2ZpaHpKM0tVRWFMMGF3allMckc3K1lha1pmdnM2YjBG?=
 =?utf-8?B?SVd4S2RwR2xzcVRpZ0FkV2d1bks2Y1NCbXJDV2ptT0hoVFptZnhpTmp2RDIy?=
 =?utf-8?B?RHp3WU9ob2JwZ29TNHdsQmNLSTFHSHVDcW9yR1haUGkrZHp0eXFUbnBpNVFr?=
 =?utf-8?B?dm5MZ3lvKzk4UVYwY1ZvNCttNkx3aDVIMXA5RFY3TVdZZDIzMi9uWFFnMUth?=
 =?utf-8?B?UEhhalBYV204cUl4ZXRoRzdCcjVlcHBzOVF0ZStVS3Exek1lUXc4MktVWklI?=
 =?utf-8?B?UHFhdlZtTkp3SnN4MU95TWpybUgvMG5JZ09FbW5VK3o1blBXSDhPcXFZWTdX?=
 =?utf-8?B?cWgyeXVveHdvSjd5R2I5U3k0eHY4YktXY0lnc05hQ2NaSTE4S2ZISXdFUDc3?=
 =?utf-8?B?N1NQcUhLQUpXNHdvOGw5TFlLR2ZoUzNCZlFNbFNJV25mTmhiVGNEcGZKOGJK?=
 =?utf-8?B?eVBtMHhDNFo1SllrQmorWmxuczBnODdxWDJGT3Z3VGdHbjB5ZWZSaG5vcFF0?=
 =?utf-8?B?MGl5THlMQjlmV3krZHhkMm9tcTBWT0JPdVVGL1M0ZkdkMXkwMTNmK3dIT1Rs?=
 =?utf-8?B?anpORUJaczhKK2UwcW1Tc3JjTWgwc2h0MkZ1Q2Z0aG9hSWp1eVViTmVjYUZh?=
 =?utf-8?B?ZU90T0lHTlRjQ1JQK3lWaXFXaU1tVGhhVTdUNWhYRmhzWlEyNHlrcHFiN1Vv?=
 =?utf-8?B?QXJ6NTJwL0U3TzVlelJRcDVURUMyZzU0SFYxcTNDTjN5QWlHeWIwOFA3ZnAr?=
 =?utf-8?B?WVA4eHAyTXNJS0VicUpKQ2hRZXpSeE1vYnBIMjBMeGJJYTQxU1VCbXIxVFU1?=
 =?utf-8?B?blkvaDREOWNHUWY2L3JzODBXd1lJS2thMFFmUm5ZdTRGWndWbjJMSHkrTlpk?=
 =?utf-8?B?NjlBWlB3NjVUVHhQejJnK0IwcGFRUzUya01lSGNhMFVNaGxNaXpnTXBjRGJU?=
 =?utf-8?B?Y2x2Z1FPR09DSWxMcGNlMDdmZzJXdUx6b0paazZQd1Jnc2UwZW9kOTdlRWtM?=
 =?utf-8?B?WjhSVTdYN28wNlpUUEh3Uk90eDJnVGZCcHZvYmlFejQzR2VDV09DRllNZ0F5?=
 =?utf-8?B?REwzakRxSjdBazE4RHdQNzZ2TDhXOGhWQjhlekhVcng1TEplcGFHYTB2UXM2?=
 =?utf-8?B?R29wOVdJTCtJbmh1YVp2TFZMT2lGa0tETS9GNHlZeDYxcFptZ1F0V3FDdGcy?=
 =?utf-8?B?bmYweVE3bDZaQlhlQmdWcVNjclFZQjNYTTlPWDBnOWtWa3BJNjVuYU5TM0pr?=
 =?utf-8?B?SlBUSzkzQ1BoRVVaTmVacm9lZVZpMit5WUNGWWJ6RjQ0MUlIQWFoREN4RFVn?=
 =?utf-8?B?LzlTOGhTbHM1NWxGdmlkbm9VU0RrZ0V4cHJxWlVwVURKak9kQlJBVmhEdkhh?=
 =?utf-8?B?TzYxRzlMNEI1YmxlYkVxV1AzSi9QUTJINytSd0ZzTmJoZVRYRElkWUlMYUlG?=
 =?utf-8?B?WDVWMWpRRmNIU0VmUDZHYVpNZVJjZVJpUmc0WnIvN20veklTK1hPZ21MdURX?=
 =?utf-8?B?U0xhazUxVk93cXNBVzNIU3YxOHJ1OVRWSERKR0hhVjFqOFBMOWpkNFBCeE1r?=
 =?utf-8?B?L1F4aGxSRG1FWi96UjNCYlpJcmhYSEFGbFVJSlJrejUyeXdlcXlDcGVaY1JD?=
 =?utf-8?B?OVRYL085Y0ZPTXBLeTBtV2RxaGFMamZDakxZb2xKbmtMZEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzEyeGxSZlpFMGVWT0llQ3UvUHUxTW92b2tvc1YzRkgvbXdEcGsrUit1ZlAx?=
 =?utf-8?B?THVIQ3ZNSzRQVTkvMk5lRytZV3NETWpBZFJLa2lGMjlPSGowVGVDRThEa0Yr?=
 =?utf-8?B?RDA0NE9vb3VkVzJkR3NuWVdVSnl0QTJ3QjlEMU9IOWEyZ2hDUnJVNTlLbFhQ?=
 =?utf-8?B?Y3FaVmtGcGt3M2hPVGd5NDhTNTQza2kwclVxZUtlbVRvUDRGL0hHeGhjSXlJ?=
 =?utf-8?B?YzJEa3hzNUZ5dnFiekIzc0JkNDlUNUNsY1NNZXpjNGpSUEFNY3Z0aWhZcVdk?=
 =?utf-8?B?YjkxQVN5c29sdGpOK1dRUWViQjYyaks1Nnc5NWoyV1UxU0o1NEVNVlRVWkVa?=
 =?utf-8?B?WFRUd1dpVWhjK3dMU3dJRVgvYVhIME1LbnlneFhGSDNUd0tsVktremhITHMr?=
 =?utf-8?B?azZTL2JaNTlZbnBlZENNZU9PaUNsSnp4aGJDUU56eTNnWHp3c1Q4emVFR3JE?=
 =?utf-8?B?Wm9idWlOakVKMlBGM1pCYmp1b3J6YkpidkZGVlhzTzRuY3ZadTVJR1JpbnZh?=
 =?utf-8?B?b0VkYVdiYjdpUUZPaVVNVHZUTEJQR2RkbkZTNE1JNEh6R3N2NzVzSkZpYXVC?=
 =?utf-8?B?ZXNnbzhiNEhNbTcvUVNHVjVlQTBkaVFuS0ZHd2pkbTBiWnFwY0I2L3hKci9K?=
 =?utf-8?B?TFNybWVqejhWR2dhdWN3OGNLKzcyRGRiVzV0cVpxUE9vSDJGN1VmWldoNTB6?=
 =?utf-8?B?WVhaL0dzS0t3M2cvdEZiZ0diMERwOHZtaEpPK2dNQnZuTzdQWUFXR053MXcz?=
 =?utf-8?B?N0IzYzhCS05wRGNnQVpwL3JCT3A4TlRSbHJSUlo5NjNNZUIwUFRCazZQT09F?=
 =?utf-8?B?YUhKeG14RUt3WlRvWEZNNGlLclpkMWwxbmFhQU8yaUZmZ3FoTEEzamdyUjBV?=
 =?utf-8?B?YTBDSmkzMzM4LzIvYzZJdWluWE1NTERjWldYYUUydGVLQ2M0SXFZRVdyNmRT?=
 =?utf-8?B?b0hmU1g1R3QycVFvQ0c2MlZoNStha2kza0g0YkRwUHhjNW01dHp0QXg2cDlI?=
 =?utf-8?B?dXZvM0NrZnRtNGkzaFVpci93ZEo5aDQ3UEsxMEJRMjZOaHU0ZE44eVovL0R5?=
 =?utf-8?B?Zmo0blBpMFB0WHRDNFFKMFVDd3pqbUlmVFdoMEFlclFYM2J6QUVTOUk0YnBJ?=
 =?utf-8?B?U1h1cGdXVno5Yjg0bVpDcEwyUzJOcDUwTEdjL2FWQ05QOE80TGtINmdZdFJF?=
 =?utf-8?B?UVc5aGlVQ1N5NVUvZ2IzZDIzZGdnMjZZem9jUG9YcjF2dzR2VVAzNlNSNkJZ?=
 =?utf-8?B?RE40WFhuT2ZEdjhxNHlhUkJKcVdmMGJHTk1IRWNqTUFxd3YxdmFwcU41K21j?=
 =?utf-8?B?TDlGM2NOSFV6NStkMzBSVW5mVDFORFdCV0NNbGJHeUdhNHN6TUErTTkwdW1m?=
 =?utf-8?B?RHlPN0xLR3hVdytESVdheU92ZkdnMkVnUGg3bVFBdVpLcmxqV3M0ZTB5aEo5?=
 =?utf-8?B?QS83eFo2ME1WWVpNYWx2UjhLTStRQ0EzK3VwWFNFMHgra1F3aHRBRURuUVB2?=
 =?utf-8?B?UDhiWm04dWNGZHdreTBOSDBxRm9QOVVNWGgvWjQ3aVU2Q0JrdWIwRUZaREJO?=
 =?utf-8?B?N25OVTBlWlVFbVF6anUxZFIzOE9kQU9JZkRrNElIZk1MZ09BanM0cmZwODhp?=
 =?utf-8?B?S01pMWJWdHBHSVlEMFpwWEpNejZ3UTdjSHpUcnBvV3B4MER6NTZGNXBGMlYv?=
 =?utf-8?B?VXRZNU5XV0JPRDBycEFOQzRjbDd2cWY4dFQ5OHdpWWNKWWU2NXltT05hNkhG?=
 =?utf-8?B?M2E2VHVuK0ZiMGVhODk3N1B5M050ZXVNSHNTelRRaXdDdGhTN05yUDVjWUxG?=
 =?utf-8?B?TmhvWjh3Si83NEVJQStqWkhNVjZWOWE1M3Qxb3gwZnhmQXk0V2x4UDJPU1RC?=
 =?utf-8?B?cVZBSStaaWhUQWtBQVBnVVlxQk8xZ3BsTkZ0VStXaEF1R1p0VG5LWXM5WHVl?=
 =?utf-8?B?S0p1c3RZSmJCM052dlRGWm1aN0RsMzRYcDZMSEpidWNoaWdWN25ZVVVkdVQ2?=
 =?utf-8?B?NEVIY2JUWVhleHVNU0dHSXB3am9rdUhjRVZFZkd6dnBnOGtJSzlsazI0Mm45?=
 =?utf-8?B?UHJnemtiMHpnV2ljQVlockZuUm1PazBqUVFtcWhvMlUvamJ0K3MyTlJYQ2tP?=
 =?utf-8?Q?BFqO/7VrbIIymEc+eV+ufCUtL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab71fcc-9f61-444d-a0e7-08dcbb771a37
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 09:05:39.6696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHHIkHj1HeznqKEYjG+LFxBm4vZsxbtWZqqo6fCY4gbT+c7OXM8c16Iuj+hDd8cMhMG+6PTALIaOZhiJbhlYEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7198
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

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
page_alloc only support 4MB.
If above this, trigger this warn and return NULL.

udmabuf can change size limit, if change it to 3072(3GB), and then alloc
3GB udmabuf, will fail create.

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, each array entry is pointer(8byte), so can save 524288 pages(2GB).

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change udmabuf array use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/dma-buf/udmabuf.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index d39f9e1cd532..3ec72d47bb1c 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -73,7 +73,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 
 	dma_resv_assert_held(buf->resv);
 
-	pages = kmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
+	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return -ENOMEM;
 
@@ -81,7 +81,7 @@ static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
 		pages[pg] = &ubuf->folios[pg]->page;
 
 	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
-	kfree(pages);
+	kvfree(pages);
 	if (!vaddr)
 		return -EINVAL;
 
@@ -189,8 +189,8 @@ static void release_udmabuf(struct dma_buf *buf)
 		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
 
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -315,14 +315,14 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
-				    GFP_KERNEL);
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+				      GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
 		goto err;
 	}
-	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
-				GFP_KERNEL);
+	ubuf->offsets = kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
+				 GFP_KERNEL);
 	if (!ubuf->offsets) {
 		ret = -ENOMEM;
 		goto err;
@@ -336,7 +336,7 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 
 		pgcnt = list[i].size >> PAGE_SHIFT;
-		folios = kmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
+		folios = kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
 		if (!folios) {
 			ret = -ENOMEM;
 			goto err;
@@ -346,7 +346,7 @@ static long udmabuf_create(struct miscdevice *device,
 		ret = memfd_pin_folios(memfd, list[i].offset, end,
 				       folios, pgcnt, &pgoff);
 		if (ret <= 0) {
-			kfree(folios);
+			kvfree(folios);
 			if (!ret)
 				ret = -EINVAL;
 			goto err;
@@ -375,7 +375,7 @@ static long udmabuf_create(struct miscdevice *device,
 			}
 		}
 
-		kfree(folios);
+		kvfree(folios);
 		fput(memfd);
 		memfd = NULL;
 	}
@@ -391,8 +391,8 @@ static long udmabuf_create(struct miscdevice *device,
 	if (memfd)
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
-	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->offsets);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }
-- 
2.45.2


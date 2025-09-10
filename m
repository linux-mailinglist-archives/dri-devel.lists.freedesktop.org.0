Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A42B51E4F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 18:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1845310E984;
	Wed, 10 Sep 2025 16:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gVbZZr13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3649B10E984;
 Wed, 10 Sep 2025 16:52:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RT2lBwGGbzEhe1EQSjnVtENHM7NFHkJ4eYJtNO9ScNmsGylx+cyphKU09FimL8Bn18Ha/att8rU+qAcmJiSlzg0oIiSa8b8qAl42Pns9l5y0qjDtdbr5dZ57H1GCECpMQks3elx8zT9Xp5pu3hujcm5VpHfrGh+R0b+xBbnUeOoo/G4aDUAgC2k7cKwUSZzuorjsmWzewd3KnewKjU8M4f/zijy0EBRXvEYYtOh4z0mqptCKAl1xtcka6bZsJ/EsPGkn0LwSXq3S2y/I/xsP29eV5TC1pekmZu9e2FKdPPIwdGcUqMVbIB4+xuqL0e3ePBqbhywR9UUJ75ZE+zW3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6zt3k6lcQlEjwO/nJB913dpV2ECpoxZAtCN8ZD045k=;
 b=ZfkyXBN+mQHABz6v1aDtvqagSg27+298c23rTTiXedi4nyGfHkbPe5YwdsOkxGQLGbv1efZlOIs623Nn5jaq5vve1bkfQZnTAokCrLBJiwEp+9KIaI1pFIDz7mas0XNu5xZ+IT08kerTe+3X24zL/4kVInR4kg1yO4KhyyC7SJt0mVNZXcHIx0XCpcENBrt3d7HNOeJMVpANBMs2VcRnceg1zvOWLbfcPCaCevSz4Qpeubow4x95GGOxQmQjnIfKUapR47epTAa9awne3J+CqUcePE5rZeJQ5T53BkbJGuqeePu6ZN+SEX1f+4ncMwpI04OMH0y04Gt1f+bLFO7aWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6zt3k6lcQlEjwO/nJB913dpV2ECpoxZAtCN8ZD045k=;
 b=gVbZZr13O2EpSEGikC+iCuQHf5HV0KWP8pTC//s7mK5JqLWt8tVqPLnmMKOUlR0bHo9Ny3s1abU0SCPSGiFrIUR7xGGG3VJ0JOoMCZuwMZzj2C9kCZk4t9svArzNL3pPTPei4+sFwOijfPGexUUd9NUY2e/HnstADZATIn03OVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 16:52:25 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 16:52:25 +0000
Message-ID: <fdb40040-3193-4e50-bf29-626fd62f28cc@amd.com>
Date: Wed, 10 Sep 2025 11:52:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/12] PCI/PM: Split out code from
 pci_pm_suspend_noirq() into helper
To: Bjorn Helgaas <helgaas@kernel.org>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>
References: <20250910144638.GA1535343@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250910144638.GA1535343@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0091.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: ee108720-59ad-4dcd-58bb-08ddf08a6ad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk5KV0loZGdsNi9ITUcvOVZrT1dUcWNKSGpqaU1STmdxOEIrTHgrcHl6UVg0?=
 =?utf-8?B?ZDArSFFHSVhqeHVmdHRPRTAwbzhDMzF0NUNBK1llTmVMM1I3ZDNoR3g3L1lW?=
 =?utf-8?B?WDJlc3VhM0JsTXJIdllDamt3M1d1cXFabXYrSTZ1TTBrb1I1REFwNkM1S3VS?=
 =?utf-8?B?bDR2UDZzY2RodHA4ZXM0cU9wclFid1RCV2kvQUVJZFV5V3ExS0RNMW0wVHRB?=
 =?utf-8?B?MDJVK2oybzhINzJ2djZVOWxwL2ltWEFHaXZ0Y0FwbFhsWlRQbHhyV0VsVy9F?=
 =?utf-8?B?R0dONUlvYlNaeEFCVS85dWd2bnRnSEx0V2lKYUxEKy9MNmJLby8zclJuYTho?=
 =?utf-8?B?MG9WYnkvb1RvdWNKdEVEbjhGeGpNVGdzWDRFTVhTUXZKMmN0aHlwSVNvMm1N?=
 =?utf-8?B?N1MrbEtuanJYYjJpSm5NL2F3RWlXZklFU21YSDRyQ2Y3N0VpOXFNaGdoYjNm?=
 =?utf-8?B?QXNVSFhqdHpLckZKdndOV2pOSGE5di9mUUkzaVNvVExhR1psUGF5MEhTNnQ4?=
 =?utf-8?B?bDk2L0xVQ25YdW8zSDRHOTVZYXR2cTJiWkl3MXQrVWNXYmRhWWZDMm9ucW5l?=
 =?utf-8?B?SE45anh5RVJCYmJ6Wm5BanBnTXVvbGNmOFIvZ1htdVRWRW8xWGZHbWI1UXZY?=
 =?utf-8?B?bExQSlF6azhGRm53MlpSWEg5aWcvK2g5alBWMkQ2LzVqVzdBT3Nja0RLTG5B?=
 =?utf-8?B?MU95OU5wWDNHVzBmZXdoRURVMWxBbnhPUTdYa3BueVhoVUwweCt6RitLK0kv?=
 =?utf-8?B?VTNwV2FrSWtzZFVEdjlqZlZ0UjNqTW9LQlMrNUZFY1RqUkw3T2l6Qy91UFJQ?=
 =?utf-8?B?V3VwbzdTbFQrTG1pdmM4d3YzSXZoWFdZUTFOa2I0ODR6RnBiQytaa3hQRDNP?=
 =?utf-8?B?bzVvNEJibytSN28rTjNlWm43eHg1VFNGK2tHOTBZWktQVnhlTDNJK0ZxQm13?=
 =?utf-8?B?MTZFVUZIdnk3aDJvUjZpb3NFVDVpMXg1QWtneXpCWDR3NmJSZmxseHdIbmZ1?=
 =?utf-8?B?TEI5VW8rb0p6WndoczB3WURVcCs5Y0hreGdadTgxOFlKWWJaekFZZzdaR2ZO?=
 =?utf-8?B?dmRGaDFtQUliNVRUY01FSmNodzRseUM2U1dPd1RuWVBuU0p0TUZDS3FGWGRk?=
 =?utf-8?B?am96OE5INkg4SmhTZlJTeGptZlR0UVFHOCtCL3djTGlkRzhMOEY1bkN3S2Mv?=
 =?utf-8?B?ekF6NWlMTHR3TURhWVFnOWFoRjJaSnNnWmNUdVNoRFBtVlUrY0ZvLzJTUGpO?=
 =?utf-8?B?UTRjaHpxTEp4NUJNNXhDNXQzN2IwbzhlNDU5aksxTDcxUzdmQnVhams3bWpx?=
 =?utf-8?B?angwczZ4SjloMkNlSkxVMk1oRCsxQ3QrczdINWdIS0pVLzkzWGRLdzhuQzhK?=
 =?utf-8?B?bUJZWjVvbzZCdW5FRk5wRkQ0TE81NVdGbWhLODdoV1MrcW1Ed1BmSUNnb09p?=
 =?utf-8?B?di85Y3VHN29DL3NjZUZZNmRwemFHbm85a1YrTGtBQVNJQUxFYXpFRHErblY3?=
 =?utf-8?B?MGFPZEVNNUlseml2eC9yTk4vbEh2TThXazF3allGOGFtRWY4MTFOc1loUzFK?=
 =?utf-8?B?bHRRdmo2dEtIeTBOdnVOekhpLzJGczlna05IVmVTd2VoMWJuSmhFRXdEYUVu?=
 =?utf-8?B?aFhOTkxIanMzTWVUclMvRngwWStRRC94bm03QW51L0VzQkpxdUhVZ21sUE11?=
 =?utf-8?B?d0pRTE4rckp6VnA3SmdoMkpFZ3k0QkM0ZVdzNnNiVE1GM1dXTEMvUDNndzlu?=
 =?utf-8?B?bG94ZkJZK0JMNlNxeXNsd3c2MFA4eXJkZ0piaU9UZkZkd1M4Z1Y2bDVBQnlL?=
 =?utf-8?B?em5PRTNJcFhrc0czelg4eW4yT21MT1NUV0pjSlVDdWg5RnQvR1VQei81aDlx?=
 =?utf-8?B?S1JyRXNpbzVGUlRVbVBiRzV0bEVaYVVuT00rMHlXVGVXTmM0MWhGZk5ieDZq?=
 =?utf-8?Q?oi7x4T8YtCY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnhHUGQ3bnBtVkdvUHpBcDFzZkhhSTRycWJvUi9hUnJ6TnVrK3FGWk5yUlk0?=
 =?utf-8?B?dEpDNmRFZ2FTVzAzalUvSVE5L21oZTQwN3NDejN4V1V6RGIxNzBBcGlXMHdx?=
 =?utf-8?B?OHVtNUNQaWVYNlVBeHpzZGFFcXVoMDVWVFlvYTMxczcxR1Nib0ZVRUZQK1ZC?=
 =?utf-8?B?NngrWXNXV283d2pGaklqTE1pblgvTHJQUHZYZCtCanAzSEZmVjhwRWtqeWpM?=
 =?utf-8?B?cHRjaENXM1RYVG5jUDBmcVM2WWFEL3N0WWorWDM0NU5yWW90K3lFNHVJd2Ny?=
 =?utf-8?B?R215NUpLbkE2MWZra0duT0lQQUduV1FEWXVldDlTeW4yYjRSNnlNTGtNNkZq?=
 =?utf-8?B?WCtyRCtZZnZWM3h4SmNBSEc2MGhjMjNKcFdyZXdTWFU3bnc4dnNpREhtQ2RB?=
 =?utf-8?B?bExoR1IrSVRxY3htUThUWTJaVGsxcVI4Q3N3cDhZUjlrbS9kUit2dlkyOWdM?=
 =?utf-8?B?WEU1RFpVRm9MYU0rdjlJT3diUUZ3NmtUR09TcGJKaC9XWWlBUit4OVFuVFpi?=
 =?utf-8?B?LzN6UkI5dnFaN0tLZW1iNWM2RGhwS1F0b05DT3dOZlMvdFVmY1hCa3dzOXhq?=
 =?utf-8?B?TCtCOXkrN2Rrc1d3MTBsbE9uSHQ4VTNHRXdaN1VUcFBGSENhTDJmVUhSVVll?=
 =?utf-8?B?c09sMWNOUTlPY0RSN3dYUWFSaHFKWWYrSzhPUVhSNVdKMkVTLzJHMWZZWms1?=
 =?utf-8?B?QmpqeUMzL3Bsc2hyWTBMeFAwZGVINHBrR2k0eDlUNWV6L2JrTjBTcG01d0Rv?=
 =?utf-8?B?cVUwbVFDcGc3aFFQeERXUTQxZ2lzTEVxUzM0RnZLV3dyQm9YTXR0VVljZHU4?=
 =?utf-8?B?bTBFVGR2bkZrOGhSTS9NT3duZjl3enFVNFFESHhJeVB3N1RKWWxzQy83eE55?=
 =?utf-8?B?N2FxWjhNR01VNXZoeG1Bei9nNGN2d3F1Z0sydEszalQyMW9wZjRuaHRFeTFT?=
 =?utf-8?B?S1lQOXBqRTk1TzZ4S1p0ZmtYTUZZcE9wTVVWS21Ta2Ywa2dDTGUxWFdzOU1p?=
 =?utf-8?B?S2Y1a25sS3FyRTVXazFGUWpTcEUvd0FuTDV5NHN6YVJIUE5pcHR2UW5Xak1U?=
 =?utf-8?B?M00vbmdBVTRldUJhVGo5QUM2K243NENvckVtV05rcUhyYmJyS0NXZG95Qzcr?=
 =?utf-8?B?OXo0Vk5OUy8yZ2l2RmQ4MVd2NzJGRmZORms3eHVtR0plOVRNMEN5cmR6Tk1i?=
 =?utf-8?B?cG05Tmc5MzZGM0lFTitjYlBGN3NMVGZET2hzU3QydklxUXJacE55UUliNHUr?=
 =?utf-8?B?dWlKTHFmdi9yQ1p4c2RiYnBHaFVHTUwrMzhFdXVybWUzTVhacnVoekcwZlIw?=
 =?utf-8?B?UzBMNFE4YlQ1Rmd0V2JnSWxadUNaTThaV1JXRlBrcmFHenhtc3BMdWVLbHhB?=
 =?utf-8?B?dHVpaWJ5SEl1NTdTSWFvWk5pMnhKcStYNDBWaGs4Q0REc2dIRS9FdkxISDJk?=
 =?utf-8?B?TVBSdDJ2N3BjcEVQK29iQ1ZKZGtmMlFaajZSVWFVcWp6blFlYjFXNDZTL3Qv?=
 =?utf-8?B?WnhhVlN1ZE94dzIwa3pwOUM1UVlpVk4zYmt5c0hPZTBIcjdjNW9oTFJJWFNz?=
 =?utf-8?B?L1dBVUdQT0RnVWY1c1EzVGRvbTV3WVgySWJTNTBZMld6d2YwRWtqQVEvNDBW?=
 =?utf-8?B?T0I1Y1pySnIwN0ZqOWZ4UnJJaDhLbGloRExVQi9YbHFjSmRRNU03SzBuVFRZ?=
 =?utf-8?B?ZEhBaTl6eVg1Nnc4R21wcjlhb212dm1mSjZHdFcwM2hDTjN3NmUyd2pvd0V1?=
 =?utf-8?B?djBRNEdFdktrK0dtRCtacFFZVU1ScGlIUFFqSHB6a1dCNUpVdFlDWW1maDNk?=
 =?utf-8?B?RXJXMzRjOWU4UEx5eWErRTJqY2tsYUwra1J2UVozNGNjZnM5TTJ6VDhsd1Vz?=
 =?utf-8?B?RTlYajNPVzZnZWk3UlQ0Q0xYQlJ4RUZlNWxYZXh4UnJvV3JLdmovdlZVS2U5?=
 =?utf-8?B?UDF6MFJSV1czVXhVd2t6eElIQ1UzWkxMb1JCSU1KNHZPZ1BQNnhJZVlDUzN4?=
 =?utf-8?B?eTRyQVNYcHdEVktDR1o4bjFtOHRUK1pSNHF4WDZ6VGM2WXBtMWhFbjdXQ3VC?=
 =?utf-8?B?VlYyQmYweEVyMjZJTjcrYXFGdDVzMnd6U0Y4ZWllVnV4V2tLcUtVT2w2M1lP?=
 =?utf-8?Q?I9auxK6eFspeY+g3cEto/trBq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee108720-59ad-4dcd-58bb-08ddf08a6ad0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 16:52:24.8227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgNzzAp2n5iNzxYmkkzlHeYKtbjZiq5nlU8LbR4Iz4tq1zDXVHQojXWu52v/1UYNFSBpr0nic1HCDVwGYcshtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436
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

On 9/10/25 9:46 AM, Bjorn Helgaas wrote:
> On Tue, Sep 09, 2025 at 02:16:13PM -0500, Mario Limonciello (AMD) wrote:
>> In order to unify suspend and hibernate codepaths without code duplication
>> the common code should be in common helpers.  Move it from
>> pci_pm_suspend_noirq() into a helper.  No intended functional changes.
>>
>> Tested-by: Eric Naim <dnaim@cachyos.org>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> If you have other reason to repost this, ...
> 
>> +	if (pci_dev->current_state == PCI_D0) {
>> +		pci_dev->skip_bus_pm = true;
> 
> Add a blank line here.

Ack, thanks.

> 
>> +		/*
>> +		 * Per PCI PM r1.2, table 6-1, a bridge must be in D0 if any
>> +		 * downstream device is in D0, so avoid changing the power state
>> +		 * of the parent bridge by setting the skip_bus_pm flag for it.
>> +		 */
>> +		if (pci_dev->bus->self)
>> +			pci_dev->bus->self->skip_bus_pm = true;
>> +	}


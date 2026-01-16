Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF5D31238
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 13:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F44110E876;
	Fri, 16 Jan 2026 12:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jclu0fbA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FA710E876
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 12:34:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbQt3k6KZuIwwRPHnlKVRylT2qQ0VdbH1R5cENEwyN1H0nTtAupgEeypPnllhgaftMem6pDbBNyIbrsRAWv/yyU9scwDr0fmf+fZU1gWDZT6qcAtF4sZPwAxDcMKaFIYFcbwE4Vfv6UxdlDqDUQaapt16wlxoFMf8MC++qOYuF9fYrYwS5ve1QYvk6mqQJOMJZwxv+v5gMVKyHi2qIeQYrJIqCoTJ+XsecimRsAVNajANvrJOXHDfC6Rut9DCmHf+hIywo6kMMucYujs3TDJUMc/ARl9vjdt02GNIA3b81NoHhUv1wxwWQ/TgCKtIetFBAuS0qjUIw/JtMihKtD52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoIigoylePYR7AIKo8QEsT7JJ+emiK3MQbGltAGbsp4=;
 b=OqHOxoP+AWeYifMPDrqFN6r41+O23mgetcgwxMCwICq8vC75ad4O5KJY2ixwcZn63j/SSyC92J7DcC5EQ0ybhFEbRKs7Lm3IrfuRGVXm3jnnsa7VcErj5qZA6sMFMf9WfeyBNIXmXHmjQQF77jjgHRPEtdnQb0nSgJUqF/kz4QWWjtMdlipMDdySrKx9o87sMGGWEzRCNpVa87RbGCIKkdCQ/sIoBbgxG3nE1dQZal1TwevlEyZPBU7B1eOdRdv94s9GNRVFwjH8A5YZW1URydV3ik/XFjCX7qvAHzz5OHwF12319a4qNk0oG84KP13qshiuydKOuh4rFhrjTMEqTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoIigoylePYR7AIKo8QEsT7JJ+emiK3MQbGltAGbsp4=;
 b=Jclu0fbAw44EYkFs4NATOA6JymL4Rr4d2kGOBQmzK9PpiMiAj+hCc8Q75WVCAqeUpLXnSp9LktKSu5vcIgwXcGYJQzJbQGSyPRyCQdWRcwgz3hlDiflBoWr1baQNn2B07wQzKm/JOy5ziqTr7gHZ1lycSEW1IUCmEihNFbLvPd0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CH3PR12MB7665.namprd12.prod.outlook.com (2603:10b6:610:14a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 12:34:24 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::8b77:7cdb:b17a:a8e2%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 12:34:24 +0000
Message-ID: <e4d93a84-5a8d-4f1e-874e-901b13570e92@amd.com>
Date: Fri, 16 Jan 2026 20:34:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] virtio-gpu: Add userptr support for compute
 workloads
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Honglei Huang <honglei1.huang@amd.com>, David Airlie <airlied@redhat.com>,
 Ray.Huang@amd.com, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20260115075851.173318-1-honglei1.huang@amd.com>
 <5b66df7d-374c-4e9c-88d5-bb514f9a7725@rsg.ci.i.u-tokyo.ac.jp>
 <2ae03f22-740d-4a48-b5f3-114eef92fb29@amd.com>
 <cc444faa-af80-4bab-ac3b-a013fef4a695@rsg.ci.i.u-tokyo.ac.jp>
 <4aff513b-eb38-494d-a4f8-78dbc18d0062@amd.com>
 <9874a952-e084-4594-a397-cb4fbe5cc3b7@rsg.ci.i.u-tokyo.ac.jp>
 <17a563f0-14ad-49bf-a734-648615b822fc@amd.com>
 <2c9cb801-3163-42ae-98bd-afcb9a6a3a5a@rsg.ci.i.u-tokyo.ac.jp>
Content-Language: en-US
From: Honglei Huang <honghuan@amd.com>
In-Reply-To: <2c9cb801-3163-42ae-98bd-afcb9a6a3a5a@rsg.ci.i.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0090.apcprd02.prod.outlook.com
 (2603:1096:4:90::30) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CH3PR12MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e72846d-fc20-4d1f-be74-08de54fb949c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFhyeTZhTTJGdUtRcnhobW1nR1gwYzZLNDhRR1AwdVA5QTZhczl2aytocFZR?=
 =?utf-8?B?YlEyaDJDSTdzRVM3cTNnQnpsSUtneEMrNVdrUlpaQlFLT3A1bU9DNFBUVVZk?=
 =?utf-8?B?azNUajR3S214U09rM1hVVUlzQklpWEI5TThHaUhFYmxTaE5qTjlKUFBmakNi?=
 =?utf-8?B?NVhGUUhkMEJOTDZUby82NkpzVlFncGFHMnIzOWNZM09iQVI5RjlvUzdxUHlv?=
 =?utf-8?B?cHVaeGgzVmNSYUc3T0w4NGJJSXJMZWZLU0pSQWlhNTF0SWJDelNDaXBkZGxo?=
 =?utf-8?B?OEVzOWhlZ1NPN1pldWRkWTFqZ2ZMa0FXUHZybTRXWVZZK2JCMG9kTTBNV2JV?=
 =?utf-8?B?Ry9uZWt1UXY3VHJMVUpGWlhhSWZKbE4xZ3lKcVdwdG4yRGJWZE16NzE2Y0hS?=
 =?utf-8?B?MzQ1c3NZSGM0Ymp0WGFRTDRIUXN4MkdTcWlQY2JiS2dEeGlaZU4rWG1ZWVJV?=
 =?utf-8?B?R3p0ZGszemduVVNmL0M2bjEyRlk3TzhZQ2liczh4VGZvRmdQNENScUpXVUpR?=
 =?utf-8?B?cG0wTE5XTTFmZFpwdXBwc05RUUNGNThpRFl3SzhvZzU2RWMyamxSNUdhazhQ?=
 =?utf-8?B?UFBmeGlOQi90OVlWODA4VWxXdHh4TW8yemVZRkVlR0o0aEdPdUtFMGZHaGFE?=
 =?utf-8?B?S2lRSUU0Z0V0U3BWS2hpMmZaNUZCbmJKRm1heFkzNDVzNkw1c2hZY29VdnFm?=
 =?utf-8?B?Z2Z5ejQ3RkZKY0JmSDdJUUoxbUhPT01rMmZzejhmbkZPMXZaTGRFQUpXZ1hE?=
 =?utf-8?B?dkRLV3BVbVNMQ0h2YllmVWYvWC9RbGxsYktqKytRcllhU0kxRmJhczQreStN?=
 =?utf-8?B?UVV5akVDcGp0Zzk4M0cwZ09YaXJSNUdIQThHTXFXSFdSZ3RMUno5UEM5VDdt?=
 =?utf-8?B?dG9nU3BkL25ZYnJKTFN6c0JhWm5wbmpsY2o1aEZMY0FDdSt5VldoaVJGWVNE?=
 =?utf-8?B?clBlOUFveVg2aDhZZllvVnUyTDZpSWN2VW0zeEZkVzU5dEsrOWNJWnBYZUFR?=
 =?utf-8?B?clowOE1BWnhaUEhKS2Y3Qmw0UlhpV0VBQmlvOUNzWFg3VS9JM3M0WGdSQ1JG?=
 =?utf-8?B?d2ZqTWt3dGgwVFN2YmRoYWZiK2w1cVBRa2YvdmplUFNSMG9vRjJ4cFA5Q2xi?=
 =?utf-8?B?WkFYemNZM0w3UHZFRjdCSGlueDlpMStwczJ1VUk1eHdpNXNDdHRqUitMNFc3?=
 =?utf-8?B?NVlHOHI3S3cxL0FHbnowdFI2WldRenV6aVNBOHJqdUs2ZzVLYjVwZ2hwQ2Vi?=
 =?utf-8?B?K2lpaWt6TEtXbFNNaEdweDQ1VG5NWXNBUk1mSkF2LzRJVHJwencwTjJUVU9P?=
 =?utf-8?B?VXdXRzlEMGZQc0NYNThMV2I3SnJpeVF2YWFHV05Ud1lCYU9KZkIydWRtYURD?=
 =?utf-8?B?Mm5yRWFQMDNCcCtHeHVqeGJ2b0xUOHNxeXIydUszVk5IK1ZHNUJHYzg2WjIr?=
 =?utf-8?B?WTE5MW5jNkFuQUNmMWxFMVhnMmw4UVR0cklreHduVzRpTDRiNGdjYjQrM1Fq?=
 =?utf-8?B?c05RWGk1SkdoeDc2Ty82WjVkV1d4Rnorbm5wZXJuNFNhQkdOcXNPclk2eVV4?=
 =?utf-8?B?R3hBNlZHdmUxZ1ZtUmd4NHFMdHdVR2YxL1VDQVRpU0R4NVZrak82NVBYbjBQ?=
 =?utf-8?B?bEVTZ290S3dBUnd5elAyNFhGK1ZoZzFUU0R5L1NIdEM5eURHRWg0UzlRa09u?=
 =?utf-8?B?Z0x1WHpLc3lyVi9VR2R2ZHBzbkR2dVA2WE5LSXV0WGVKZllRTitnTGc1bU9m?=
 =?utf-8?B?Tkx4UWg4bUUxS0VPUUM2L0RQQUFFWWlmb3BYS2UzZlpqOVVidm5DT0J5bzRO?=
 =?utf-8?B?dFA3UUI3OFNOOWFHMlhNNE9LV202eVZ5WHhndzJUS1h1NnZROXMyeGVyWDFr?=
 =?utf-8?B?akkwWDBrS2pNTHRQR1FEeXg0Z0VkTVhnUC85dlVRNmRIMlJ6cUtLbllqaG9q?=
 =?utf-8?B?SUxFREtVVVRBOFdFRmxILzlLVEt6alMzK2NzZnphb2J5YmR1RnQ1YWkxM3Jm?=
 =?utf-8?B?MTNJNnQwcGJaakRMbjhuZlA5SStjOE10dUVDRnJSSjhxZ0xycnY5N1hCTTJZ?=
 =?utf-8?B?ajlYWDRaMHhZdDdQV0c4SkMvU2ZoQU1GSmJ3ejZkaFhBRDFYNzhWNVNxMDh6?=
 =?utf-8?Q?gcXLpZo/Fq6urxbo6gmP7lLbs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWc3QlVaMDdRZ01nelNmb29sR2s4Z1oxWmFhTFpWRUQwTzNaZnBOSHBNN29Q?=
 =?utf-8?B?NGhlb2FWV2VqVFRlRm9Kd2JMeUQ1ZHc0TEk4cEwwUVNBN3ZMN3BLTm1qYThV?=
 =?utf-8?B?YzFSOE54MnVxd0s1alVKM1Q1cEhaeEYwOUFrRXV2cFZKQTNOUjVvbFZQZ3BS?=
 =?utf-8?B?SysrZlFvTnZBZkhQbThOMEFJME52cllxOFFoVEthOUN2OURQNkt0cWhTOFRM?=
 =?utf-8?B?U2NaZEJxTVNybnh3RHZUSC8rUlVUbVhyMWNpN2JQRm1XOHIwN0hjOXJxR291?=
 =?utf-8?B?eGpsQklmTDFzb1VjaUE1Z1hUYzNiZDVBY0ppVjNDZXBJaDg2MDUrTFdpSlZn?=
 =?utf-8?B?bytoek8wMmQ1cWZWVWxYM0JWUkRSN3pqbTBEOGJMLzhHSnd2bnlmb2hvMDVo?=
 =?utf-8?B?azQ4RnFmR0RuQnpjQjBvRk94ZGI2eHBNRXlxdHhpTGUzVVFWaGZla1hqZ2hI?=
 =?utf-8?B?YndvRVU1bm5KaVJuY09TTDJLaWZpOFkxdFV6eVkycWtSWTBweXFQbzAwTXAw?=
 =?utf-8?B?U3dwK1UyUTBBYlBqWUxPS3AyYTM5cTJRVjNVUnROdU9LRjdlRkRNYjd5TFox?=
 =?utf-8?B?REZrWWx4a2t0a1BpUWtqZXJscTE0R2lHcFhwRGdRWnh3S3BJbVF3OEdvcjJP?=
 =?utf-8?B?Q3JKbmlZUEdyOUpLZitEdnpGK1VaODJxbXZqTzZsNHNZQWRUQkJncVVBU0Nx?=
 =?utf-8?B?U0srazJzNElWUkRUSGxrK25Ranlxay9nYjRuV2l2Zk44ZXVDSjhPejg0NVVk?=
 =?utf-8?B?TVIvdzZWT1RhNXZhSEpFeGRlN09NcE1oV2RxdEpKT29lR2ZVOTViM0xZeVpU?=
 =?utf-8?B?Y2o3OEpRaVJBZmdNRlhTOUdkdkVZSm10SEVGcWR3UzdEeURHNFpTb2tLQ3JM?=
 =?utf-8?B?NjM2YVVyTnUwQVdYbjkxbHR6WVZlM3NkSDUvUDdFMHBQVm5MZ2UwNDh6U3R0?=
 =?utf-8?B?cDM0QWQ2RjNCd2F1bHY5UWxmeFRuY28vaEFWa3dzaThnL3RLOVpoQldmSk5h?=
 =?utf-8?B?OGQ2Y1hsbjJZQitiYndYVEptMGVUTzlLOC84Qm9qNnRrUkpsVktTN2Q1MzIw?=
 =?utf-8?B?V0NRc2lUVGE4ZEhYUDFTSy9PemhyREt4eU1TNUsxemwxNStkZFhDOFBldS9h?=
 =?utf-8?B?azE1MDN1U1RzaXVIM2cvMHZwWjZ4SU8xUUU1bDB3QUlQRVhCM0F1cDZaMWN4?=
 =?utf-8?B?NWtFc2NJZ0xFV25xRE9sUUZxQ2xNOERnRTBaWDFBZTJwYzRwZjRtZ05BZnBV?=
 =?utf-8?B?SmhHZ0JxWk9NWkNQN3I3UFJnR2RPcC9JSXJLOGlxOHdabE51TEJpMlowSGdB?=
 =?utf-8?B?cktUN2FHblhLNE53amNlZVByME9VVGhvZzNRakVIU2swT01CM2h4bGZhUHZu?=
 =?utf-8?B?RUc2dnM5NzNQeDF1OHV4c3R2c2JxMjZBcmFlSFBjSGpOMWtzUEM3MjFXQ25J?=
 =?utf-8?B?c3I2KzV3c201eFliZHNRbS83Q0hPM3Q2cEpoWVo5cVpEdFlDWkY2QmJ2Tkhl?=
 =?utf-8?B?eTl2dzZSbFZUTFhaRGRjSWFXek5hSm9vTnNPZnllaHhXcXJkOGpCdytJcDJS?=
 =?utf-8?B?aEhBelhpVDJjSVBobitoNFRSaS9mYmN5WTJyYUIzZlhJWjhDRi9qSWdSOVRQ?=
 =?utf-8?B?MThnQnBwOGpFUHJMYUVESnYxMnBXVXJrZkdROHBHVXlPVk1CNGk5V2RwTzNZ?=
 =?utf-8?B?Mms1TWQ1K3ZySUtKY0pmYTBxek1TWGdid3QyWUEwa3ZyeGFsTnRMWEZjT1dB?=
 =?utf-8?B?aHpiZFJ3SGxNWGJlN09zc0tSUVlRQWdKVTZ0andGLzJ5N2haYnhQdDgwaXdC?=
 =?utf-8?B?ZlVBUWwveU5DZ2NQV0FIbWVhOTBxU3N4RVBUdXg5cG5rYnVMRHlqMVFWbCtK?=
 =?utf-8?B?TFF0MWdyZ3kvaUJvWlhKNzIxZlYwdG4xdnZYK1FMYm85L0wyTGN6cWtaUjh1?=
 =?utf-8?B?MVZxSzVua3JZZ0Vkcm1tV3pXcDl5dU45UDB3Q1F3T1Nydmt6YnUvZ0FBdHZ6?=
 =?utf-8?B?bDNQcDNodTVLUFlISGNia0VDT1RqZ2kyUWRCWVp0MURTOFZZN1RRNURBS2FV?=
 =?utf-8?B?Q0xwaXdBV2hudHhWOW9ralNYK1BMYVBZSnJEN2lFQyswSWxrRFU4Y1psYVBX?=
 =?utf-8?B?dUVJbUVHeWhtaHNNQ2tZZ0N1d3F4ZHpFa29BeUFsdXVaUlJ6U0h2Vm1IOWxM?=
 =?utf-8?B?NkVEbVd4L0RGOVFzbk5IckZITGpxOXlESDkrclFhWTUwSjBhRlZhUUF6bzdn?=
 =?utf-8?B?MWhSTU9Ta1VIUlFjV1pZYThoUHJpdm9LYVhHYXFCQ21vOW1LR3BCUklTbHpG?=
 =?utf-8?Q?r09UL2vTpi5Hb/PsFO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e72846d-fc20-4d1f-be74-08de54fb949c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 12:34:24.1659 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiGbulQ/f411ist+D54TytflDLmxqeYqNhfUImnsg2//QHYa/kkR5yr1ZagqCfsfPEJbY8uH7rwqaw8DU+tIiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7665
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



On 2026/1/16 19:03, Akihiko Odaki wrote:
> On 2026/01/16 19:32, Honglei Huang wrote:
>>
>>
>> On 2026/1/16 18:01, Akihiko Odaki wrote:
>>> On 2026/01/16 18:39, Honglei Huang wrote:
>>>>
>>>>
>>>> On 2026/1/16 16:54, Akihiko Odaki wrote:
>>>>> On 2026/01/16 16:20, Honglei Huang wrote:
>>>>>>
>>>>>>
>>>>>> On 2026/1/15 17:20, Akihiko Odaki wrote:
>>>>>>> On 2026/01/15 16:58, Honglei Huang wrote:
>>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>>
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> This series adds virtio-gpu userptr support to enable ROCm native
>>>>>>>> context for compute workloads. The userptr feature allows the 
>>>>>>>> host to
>>>>>>>> directly access guest userspace memory without memcpy overhead, 
>>>>>>>> which is
>>>>>>>> essential for GPU compute performance.
>>>>>>>>
>>>>>>>> The userptr implementation provides buffer-based zero-copy 
>>>>>>>> memory access.
>>>>>>>> This approach pins guest userspace pages and exposes them to the 
>>>>>>>> host
>>>>>>>> via scatter-gather tables, enabling efficient compute operations.
>>>>>>>
>>>>>>> This description looks identical with what 
>>>>>>> VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST does so there should be some 
>>>>>>> explanation how it makes difference.
>>>>>>>
>>>>>>> I have already pointed out this when reviewing the QEMU 
>>>>>>> patches[1], but I note that here too, since QEMU is just a 
>>>>>>> middleman and this matter is better discussed by Linux and 
>>>>>>> virglrenderer developers.
>>>>>>>
>>>>>>> [1] https://lore.kernel.org/qemu-devel/35a8add7-da49-4833-9e69- 
>>>>>>> d213f52c771a@amd.com/
>>>>>>>
>>>>>>
>>>>>> Thanks for raising this important point about the distinction between
>>>>>> VIRTGPU_BLOB_FLAG_USE_USERPTR and VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST.
>>>>>> I might not have explained it clearly previously.
>>>>>>
>>>>>> The key difference is memory ownership and lifecycle:
>>>>>>
>>>>>> BLOB_MEM_HOST3D_GUEST:
>>>>>>    - Kernel allocates memory (drm_gem_shmem_create)
>>>>>>    - Userspace accesses via mmap(GEM_BO)
>>>>>>    - Use case: Graphics resources (Vulkan/OpenGL)
>>>>>>
>>>>>> BLOB_FLAG_USE_USERPTR:
>>>>>>    - Userspace pre-allocates memory (malloc/mmap)
>>>>>
>>>>> "Kernel allocates memory" and "userspace pre-allocates memory" is a 
>>>>> bit ambiguous phrasing. Either way, the userspace requests the 
>>>>> kernel to map memory with a system call, brk() or mmap().
>>>>
>>>> They are different:
>>>> BLOB_MEM_HOST3D_GUEST (kernel-managed pages):
>>>>    - Allocated via drm_gem_shmem_create() as GFP_KERNEL pages
>>>>    - Kernel guarantees pages won't swap or migrate while GEM object 
>>>> exists
>>>>    - Physical addresses remain stable → safe for DMA
>>>>
>>>> BLOB_FLAG_USE_USERPTR (userspace pages):
>>>>    - From regular malloc/mmap - subject to MM policies
>>>>    - Can be swapped, migrated, or compacted by kernel
>>>>    - Requires FOLL_LONGTERM pinning to make DMA-safe
>>>>
>>>> The device must treat them differently. Kernel-managed pages have 
>>>> stable physical
>>>> addresses. Userspace pages need explicit pinning and the device must 
>>>> be prepared
>>>> for potential invalidation.
>>>>
>>>> This is why all compute drivers (amdgpu, i915, nouveau) implement 
>>>> userptr - to
>>>> make arbitrary userspace allocations DMA-accessible while respecting 
>>>> their different
>>>> page mobility characteristics.
>>>> And the drm already has a better frame work for it: SVM, and this 
>>>> verions is a super simplified verion.
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ 
>>>> tree/ drivers/gpu/drm/ 
>>>> drm_gpusvm.c#:~:text=*%20GPU%20Shared%20Virtual%20Memory%20(GPU%20SVM)%20layer%20for%20the%20Direct%20Rendering%20Manager%20(DRM)
>>>
>>> I referred to phrasing "kernel allocates" vs "userspace allocates". 
>>> Using GFP_KERNEL, swapping, migrating, or pinning is all what the 
>>> kernel does.
>>
>> I am talking about the virtio gpu driver side, the virtio gpu driver 
>> need handle those two type memory differently.
>>
>>>
>>>>
>>>>
>>>>>
>>>>>>    - Kernel only get existing pages
>>>>>>    - Use case: Compute workloads (ROCm/CUDA) with large datasets, 
>>>>>> like
>>>>>> GPU needs load a big model file 10G+, UMD mmap the fd file, then 
>>>>>> give the mmap ptr into userspace then driver do not need a another 
>>>>>> copy.
>>>>>> But if the shmem is used, the userspace needs copy the file data 
>>>>>> into a shmem mmap ptr there is a copy overhead.
>>>>>>
>>>>>> Userptr:
>>>>>>
>>>>>> file -> open/mmap -> userspace ptr -> driver
>>>>>>
>>>>>> shmem:
>>>>>>
>>>>>> user alloc shmem ──→ mmap shmem ──→ shmem userspace ptr -> driver
>>>>>>                                                ↑
>>>>>>                                                │ copy
>>>>>>                                                │
>>>>>> file ──→ open/mmap ──→ file userptr ──────────┘
>>>>>>
>>>>>>
>>>>>> For compute workloads, this matters significantly:
>>>>>>    Without userptr: malloc(8GB) → alloc GEM BO → memcpy 8GB → 
>>>>>> compute → memcpy 8GB back
>>>>>>    With userptr:    malloc(8GB) → create userptr BO → compute 
>>>>>> (zero- copy)
>>>>>
>>>>> Why don't you alloc GEM BO first and read the file into there?
>>>>
>>>> Because that defeats the purpose of zero-copy.
>>>>
>>>> With GEM-BO-first (what you suggest):
>>>>
>>>> void *gembo = virtgpu_gem_create(10GB);     // Allocate GEM buffer
>>>> void *model = mmap(..., model_file_fd, 0);  // Map model file
>>>> memcpy(gembo, model, 10GB);                 // Copy 10GB - NOT zero- 
>>>> copy
>>>> munmap(model, 10GB);
>>>> gpu_compute(gembo);
>>>>
>>>> Result: 10GB copy overhead + double memory usage during copy.
>>>
>>> How about:
>>>
>>> void *gembo = virtgpu_gem_create(10GB);
>>> read(model_file_fd, gembo, 10GB);
>>
>> I believe there is still memory copy in read operation
>> model_file_fd -> gembo, they have different physical pages,
>> but the userptr/SVM feature will access the model_file_fd physical 
>> pages directly.
> 
> You can use O_DIRECT if you want.
> 
>>
>>
>>>
>>> Result: zero-copy + simpler code.
>>>
>>>>
>>>> With userptr (zero-copy):
>>>>
>>>> void *model = mmap(..., model_file_fd, 0);  // Map model file
>>>> hsa_memory_register(model, 10GB);           // Pin pages, create 
>>>> userptr BO
>>>> gpu_compute(model);                         // GPU reads directly 
>>>> from file pages
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> The explicit flag serves three purposes:
>>>>>>
>>>>>> 1. Although both send scatter-gather entries to host. The flag 
>>>>>> makes the intent unambiguous.
>>>>>
>>>>> Why will the host care?
>>>>
>>>> The flag tells host this is a userptr, host side need handle it 
>>>> specially.
>>>
>>> Please provide the concrete requirement. What is the special handling 
>>> the host side needs to perform?
>>
>> Every hardware has it own special API to handle userptr, for amdgpu ROCm
>> it is hsaKmtRegisterMemoryWithFlags.
> 
> On the host side, BLOB_MEM_HOST3D_GUEST will always result in a 
> userspace pointer. Below is how the address is translated:
> 
> 1) (with the ioctl you are adding)
>     Guest kernel translates guest userspace pointer to guest PA.
> 2) (with IOMMU)
>     Guest kernel translates guest PA to device VA
> 3) The host VMM translates device VA to host userspace pointer
> 4) virglrenderer passes userspace pointer to the GPU API (ROCm)
> 
> BLOB_FLAG_USE_USERPTR tells 1) happened. But the succeeding process is 
> not affected by that.
> 
>>
>>>
>>>>
>>>>
>>>>>
>>>>>>
>>>>>> 2. Ensures consistency between flag and userptr address field.
>>>>>
>>>>> Addresses are represented with the nr_entries and following struct 
>>>>> virtio_gpu_mem_entry entries, whenever 
>>>>> VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB or 
>>>>> VIRTIO_GPU_CMD_RESOURCE_ATTACH_BACKING is used. Having a special 
>>>>> flag introduces inconsistency.
>>>>
>>>> For this part I am talking about the virito gpu guest UMD side, in 
>>>> blob create io ctrl we need this flag to
>>>> check the userptr address and is it a read-only attribute:
>>>>      if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USE_USERPTR) {
>>>>          if (!rc_blob->userptr)
>>>>              return -EINVAL;
>>>>      } else {
>>>>          if (rc_blob->userptr)
>>>>              return -EINVAL;
>>>>
>>>>          if (rc_blob->blob_flags & VIRTGPU_BLOB_FLAG_USERPTR_RDONLY)
>>>>              return -EINVAL;
>>>>      }
>>>
>>> I see. That shows VIRTGPU_BLOB_FLAG_USE_USERPTR is necessary for the 
>>> ioctl.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> 3. Future HMM support: There is a plan to upgrade userptr 
>>>>>> implementation to use Heterogeneous Memory Management for better 
>>>>>> GPU coherency and dynamic page migration. The flag provides a 
>>>>>> clean path to future upgrade.
>>>>>
>>>>> How will the upgrade path with the flag and the one without the 
>>>>> flag look like, and in what aspect the upgrade path with the flag 
>>>>> is "cleaner"?
>>>>
>>>> As I mentioned above the userptr handling is different with shmem/ 
>>>> GEM BO.
>>>
>>> All the above describes the guest-internal behavior. What about the 
>>> interaction between the guest and host? How will virtio as a guest- 
>>> host interface having VIRTIO_GPU_BLOB_FLAG_USE_USERPTR ease future 
>>> upgrade?
>>
>> It depends on how we implement it, the current version is the simplest 
>> implementation, similar to the implementation in Intel's i915.
>> If virtio side needs HMM to implement a SVM type userptr feature
>> I think VIRTIO_GPU_BLOB_FLAG_USE_USERPTR is must needed, stack needs 
>> to know if it is a userptr resource, and to perform advanced 
>> operations such as updating page tables, splitting BOs, etc.
> 
> Why do the device need to know if it is a userptr resource to perform 
> operations when the device always get device VAs?
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>> I understand the concern about API complexity. I'll defer to the 
>>>>>> virtio- gpu maintainers for the final decision on whether this 
>>>>>> design is acceptable or if they prefer an alternative approach.
>>>>>
>>>>> It is fine to have API complexity. The problem here is the lack of 
>>>>> clear motivation and documentation.
>>>>>
>>>>> Another way to put this is: how will you explain the flag in the 
>>>>> virtio specification? It should say "the driver MAY/SHOULD/MUST do 
>>>>> something" and/or "the device MAY/SHOULD/MUST do something", and 
>>>>> then Linux and virglrenderer can implement the flag accordingly.
>>>>
>>>> you're absolutely right that the specification should
>>>> be written in proper virtio spec language. The draft should be:
>>>>
>>>> VIRTIO_GPU_BLOB_FLAG_USE_USERPTR:
>>>>
>>>> Linux virtio driver requirements:
>>>> - MUST set userptr to valid guest userspace VA in 
>>>> drm_virtgpu_resource_create_blob
>>>> - SHOULD keep VA mapping valid until resource destruction
>>>> - MUST pin pages or use HMM at blob creation time
>>>
>>> These descriptions are not for the virtio specification. The virtio 
>>> specification describes the interaction between the driver and 
>>> device. These statements describe the interaction between the guest 
>>> userspace and the guest kernel.
>>>
>>>>
>>>> Virglrenderer requirements:
>>>> - must use correspoonding API for userptr resource
>>>
>>> What is the "corresponding API"?
>>
>> It may can be:
>> **VIRTIO_GPU_BLOB_FLAG_USE_USERPTR specification:**
>>
>> Driver requirements:
>> - MUST populate mem_entry[] with valid guest physical addresses of 
>> pinned userspace pages
> 
> "Userspace" is a the guest-internal concepts and irrelevant with the 
> interaction between the driver and device.
> 
>> - MUST set blob_mem to VIRTIO_GPU_BLOB_FLAG_USE_USERPTR when using 
>> this flag
> 
> When should the driver use the flag?
> 
>> - SHOULD keep pages pinned until VIRTIO_GPU_CMD_RESOURCE_UNREF
> 
> It is not a new requirement. The page must stay at the same position 
> whether VIRTIO_GPU_BLOB_FLAG_USE_USERPTR is used or not.
> 
>>
>> Device requirements:
>> - MUST establish IOMMU mappings using the provided iovec array with 
>> specific API.(hsaKmtRegisterMemoryWithFlags for ROCm)
> 
> This should be also true even when VIRTIO_GPU_BLOB_FLAG_USE_USERPTR is 
> not set.
> 
>>
>>
>>
>> Really thanks for your comments, and I believe we need some input of
>> virito gpu maintainers.
>>
>> VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag is a flag for how to use, and it 
>> doen't conflict with VIRTGPU_BLOB_MEM_HOST3D_GUEST. Just like a 
>> resource is used for VIRTGPU_BLOB_FLAG_USE_SHAREABLE but it can be a 
>> guest resource or a host resource.
>>
>> If we don't have VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag, we may have some
>> resource conflict in host side, guest kernel can use 'userptr' param 
>> to identify. But in host side the 'userptr' param is lost, we only 
>> know it is just a guest flag resource.
> 
> I still don't see why knowing it is a guest resource is insufficient for 
> the host.

All right, I totally agreed with you.

And let virtio gpu maintainer/drm decide how to design the flag/params 
maybe is better.


I believe the core gap between you and me is the concept of userptr/SVM.
What does userptr/SVM used for, it let GPU and CPU share the userspace 
virtual address. Perhaps my description is not accurate enough.


> 
> Regards,
> AKihiko Odaki


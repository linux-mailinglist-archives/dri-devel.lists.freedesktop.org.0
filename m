Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C58A2A60B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 11:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377B210E2E8;
	Thu,  6 Feb 2025 10:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0GtMtzq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061.outbound.protection.outlook.com [40.107.236.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D18410E2E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 10:41:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVOwJlBm5q7cqNcQWlK5r4L2Q8iAkFa3z70F56vifqHg1zQso6ZtFQzdUCoqM1HsHIMerbddzO1eLNeAanrQ52gYSMeY1EV7D8BNTURhsgOP2fYybwWoWYRqHD9PJ3p5dIzIOX2xKe91AIs6TgTWEDkZJsHOTi6T1uZTE9eBxZyQY7PI3rK5vzR0HP1nRuBUnHu/c8h6STHbhp6nSMl/InEntXEJtZBYPEM8p4l9bHw9SptR4ZGqglrUOxITiB16nzMlkhlceoMKMVwVyxMI9knLr3Qc7pkMRKsLmKfzm7Winc0uGJH5uuDvzUu1QDK2PQiTcAiBoAUxiC2IEECgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njiKBgt3IaJ97ZQoZU3mpx9NuCVpOEkFHb/SYW2S/Ws=;
 b=rn96RwBT/f8JkF5/JY8MO4KS/vC+0GJ8DmVNSaTU8QZbzh5+eTWSofUDphSf9ETQD0jFTmqKsB1vedhUQ0fafK3bZjHpjJFa8d+G9sjJ8S/21EwcfxrZGSXlFdnVvorVYdXB9fMl4B+9XXRIixx7NQvqVnVBFEHGYJY/HM7NXw7aN13rny2Jln1QiOyllqpRgWWppNIm5YCZiO35oMKpgXmcmXmqVkeXa+H9Aj0kgfv1Bpno9eNoWG7GvcjcBi7bLf78SHoDT6vKUXYjFnjw9vaTDiaFWgayjtiIxvOd39UMVcmyvIYVya4MruooIxsKCX2XhPZ3ab7m7wJFz6zyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=njiKBgt3IaJ97ZQoZU3mpx9NuCVpOEkFHb/SYW2S/Ws=;
 b=0GtMtzq6dacWWoBcwWcrgYSrHU3xLZwPe4Cnk/we7fja34grete1UmfxUeN6BJNJ3wUjPULVw//aKVDcAXvA+vOTtqNTsZ0HnhDIQOtzlrX6YSUwuWknOgrZj+rEfRW6qGDzG74xF00VY1XdZynrQsW+QHiYPwn7GCqMj9KwOcA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 10:41:09 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 10:41:09 +0000
Message-ID: <50949a09-fe90-4729-a8e2-28ab5903bee3@amd.com>
Date: Thu, 6 Feb 2025 18:40:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] virtio-gpu api: add blob userptr resource
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Antonio Caggiano <quic_acaggian@quicinc.com>
Cc: Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <a8bf6c8b-5ee5-4150-a9a2-75345fd07432@daynix.com>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <a8bf6c8b-5ee5-4150-a9a2-75345fd07432@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b99704d-f942-480b-4c5f-08dd469ac415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlVGM3hPWjRBUXNSNFBzSEJlYWVwbzdQZXlpUnUyUFRxSVpkZWNnVS82alRK?=
 =?utf-8?B?S0txdmdCdDRrUy9UcmJucWQrV1N1NWtneTAzYnBrNGZMYm53dHQvaTBTWEFG?=
 =?utf-8?B?TWcwWXN6cnNpcGdWQnJSTWFjTkcrTkNTRHR4cTNuaDg1ZGhnWGk0S25QVkRO?=
 =?utf-8?B?aGFPeW91bmp3S3AwcG5iZVZFQ25NRERhWmtJSk5kcTA0dlZ4OENqcmppVXFi?=
 =?utf-8?B?VjFPaXl0V29IdUtEbk05d0tNKzNMMEpCZFliU2c3cW9CWTlua21lNit4Qjdq?=
 =?utf-8?B?SkpxbGhHaDJEWEtNamlLNnpSZFBPQ2lMeCtZK3M0VU1aUzdMVFBSMWcxQU1l?=
 =?utf-8?B?UHptZ2VkVTVzWC9LT09rQ0cyaDNuZ1ZQcEc2Y0N1SnpnbDQ1U016WVdWd0FC?=
 =?utf-8?B?b2dUUGFKa24yc1V4blpERVBPR1JzZGRlK2ptWEVKT1ZPaXlXK1FTTnR3Z0FH?=
 =?utf-8?B?TTNCRTh6RngwQzZLZWxJT0MwVUlrSUtDaVZPYzR3eEtpSUovMmdFTkVpYkoy?=
 =?utf-8?B?ZklJNmN0WW00bGdpZndWZmw0MnpFamRQb3I2UDZ3RHMxSGlFU0gxNjhyU0Q2?=
 =?utf-8?B?VXBqN05VRjgzelNpeXphL05FMDAySFBjWUt4TldxbjVXTTZWZXk1NGRCcnhS?=
 =?utf-8?B?YkFoRUdleTJlKzdiNmdOdXp3ZmR3MFMweDNNazhGT2hNTmk2a3RHODk2c0Ra?=
 =?utf-8?B?ZzRPdWdpdGNhL1U3NW9jd1ZPY3RJQzNzV3d2ejRDRm5CYkFueS9LZ2tWUTZs?=
 =?utf-8?B?VTFiTlBXVkR4TmtzY044ZEVLVDhkTExSdXZ5V3ZHYktYeEpPdEFSMFJJYjd0?=
 =?utf-8?B?SzBJNE1xTUlyWFpHRjYxd1NzZ1lrL204SkQzSktTNVJoWENkWWZrUFdsczJG?=
 =?utf-8?B?TlFsRlo3UG1GK1FnVFdqR3JDM3R3UkNOQS9qZlBJckc4NUdWSmdXUTNIMTFy?=
 =?utf-8?B?YXh3NUhzR0RQcWZDMXdBRGJqK05sOVBpODcvVjh6ZloyQURiNTd6VktyS1JJ?=
 =?utf-8?B?UEFtdVlXNXdBUXFLTkVPdlNXbzlVb2laeFYxSndQSlZJYk9GY05uMkhKL3pi?=
 =?utf-8?B?YnU1OHhIcHlrczBNdlpEQkVJdWJuK1FQQjJOQ1pVWkwwUkhTSjdpSkFHeUN2?=
 =?utf-8?B?TFNDMVJYQ1Z4K1h5eWo0eHFCaGI1SWZIMVRVNjlWeWRKRm1rWUFEY2Jsazh3?=
 =?utf-8?B?alYvZS9WU2FicGFlbThUZlJudXU4T01tRURaVVNxTUNlbHl0MzRsb29XeEFV?=
 =?utf-8?B?d0o3VVZWemFJZzQ0M3kzZzFPWWNGOStvRVVsaENrUTh6YnlCWi9IZ1ZTcnBR?=
 =?utf-8?B?QmtmaFZXckpweUdNclg2ZmR3ekhBQ3A0c1c2aERuQTZ0M2kvcXZJdzUxT3ZC?=
 =?utf-8?B?YmpjMGc2Q3BaeDZoZHFYOEVKMzY5Q1NuVGtjTFpFQVFIS2ZWaGlHNElQUldi?=
 =?utf-8?B?RTVoQlVGczRYOVFxYjhSSVVZL0tKUCtpUGQ1Q2ZKZ2pad2l6OURscDBiUHh0?=
 =?utf-8?B?ZVZvc2JLeWlVMlZuTVRmMTQzZkFzZ1k3Y0k2UjlXRjlCRWdyQ3gyMFZReTlY?=
 =?utf-8?B?eGl0cXYwL3RicEltU2NjTkhOS1grMk95aklNRFBETDhnWG9FZ1FuTlJZTThN?=
 =?utf-8?B?TGVQYTBIVVZWYUZLQmpHZWRiN2VpR25EYktMQXFKdW83Q0ltRi9ER2dYR3Zk?=
 =?utf-8?B?b0g1RHlBMS9vOU1ZVTY4K3dNcDFzRmpFb1hNODhXTGhxSkZNckN3aGdsL2Nr?=
 =?utf-8?B?YTZ1Y3Btck9TOWd2enZsK0JjZjN3bk91T29OZHY1cFhLa1lndWlpa2VMT0Ni?=
 =?utf-8?B?bkcyckNZc1FwbC9CbjF5Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2g1eUlIWmR1QVlKY2ZNREpjMzVRaXNMWllieHFqSzR6Yzl3YXZyUmoyc2RO?=
 =?utf-8?B?NkEyNlo3a3lQZWcxM2UwQXNiOFRpdmFCWndIbjY5VFVtM0ZwN0dkbkw4K2x0?=
 =?utf-8?B?akhuOFpLT012V3laUml5elJrNk1qc3RSdThocGJuZmlvc3lWTkJOU1hrUE1h?=
 =?utf-8?B?UlJtZ0tFQStrRE9mNXZyMnUrUzJGeng1Ymk5eUdXYTZlenFudVB3OHZYWURP?=
 =?utf-8?B?eHpwemU2T0Jmc1F1OUZ2ZU5MYnN4RG10enkzSXlKVlFlMGxSVTVaWkpGMzdF?=
 =?utf-8?B?b0t3eXovMWRTTGw5Tno5QlZ5UlBiakZSYThOcmdZaXlMSjFXU1JWYXV3Vkcw?=
 =?utf-8?B?SEpIUGp5SHRwemZsbXhjVXc3cGJKYzRHM2JlTitxamRMR1A0aHBZVWtIWlVR?=
 =?utf-8?B?RDZodVhsM3N6R2ZBeklMYklGNnZHb21HWHArbkpjNGxRTWVCWkIvLy9Wbnhr?=
 =?utf-8?B?S2NCZWlNcXl2YXAwNXlwRjZXSGpwOXgyeXpCOC9pNmxVRGxteWowV0ZLVXZu?=
 =?utf-8?B?UzcySDA0YXljMFA0anJLZ21PNjREeUM3QmVLNmIxbTNKdUwyalhEQWdwZkJs?=
 =?utf-8?B?a0tyaUNzbTI0STNTVWJ2Z29KSXF0N2JIcHN5MzlMRGxYTVNpci9FL0RtMFZY?=
 =?utf-8?B?b2t1NkQ1TVV4ZXJQbnFUaHRQYjJzUkNKTVhGZm9LZXdaay96NW1NalFCa1Ux?=
 =?utf-8?B?S0l4bHI4ZlJVN3pES1gvUGtOZVVyMVl5TmdrN2FHK0JiWVdsdDlOanVIZ2li?=
 =?utf-8?B?bXlacGRqNmIvcXFKbHcvSE1VdWdKZk9JUHN2YldiaGRkZTBlUFZiN043czc2?=
 =?utf-8?B?Yy9wS0RpYkFzZ3NQdk1oNUVqellEZGtmbW0wNURBWGhIUFBYTlJGcEFsWU5E?=
 =?utf-8?B?RE9Iamw5ZUsxV3NtcUV2V0RGVTdFT0dqenBZR2dhT0U5QmhFZkMwSktXVkV4?=
 =?utf-8?B?Vzh6NHkvNmllT2s5eXVOUmdCeUNmMWd6SDQ4aWpXVGloemtuVjJqeThIaVlG?=
 =?utf-8?B?N0s1ZDFtbHBIWFVJR1NIQndORDJSRDNBelVtUnE3cVAzODVZZEJrZm9uSGU2?=
 =?utf-8?B?UkIrL1R3cEs2M1dEdkZNS3REVnp3SWtpZlBmRXFPYWxOM2twVkU2NldVVmdW?=
 =?utf-8?B?RW9jVW8wM3dKRmoxRGFCaFBXUjg5bHNoazk0ZEVuV3BiNDc2UlZTdnA0RkJo?=
 =?utf-8?B?d1piYzBjK1EycnpxTkhvL2plRktxR3VlMXZ1Q09IR281Z29uZnZFWDlTdERa?=
 =?utf-8?B?K0tvWXdRU3RxdWdqaVlDVGhUQ2NxV3h5RkphU2hpZUxla0c2bUsvanZOZFBS?=
 =?utf-8?B?MlRTSWlYUVVvOTJZWkVJVGdVYlpFVGV3aStnWGFkQm96dEhlV3pjcDhWVUxp?=
 =?utf-8?B?aURXeTA2SHM1eGdPQ1k4aEpRMVlTVHJWaE94OFZoS3F1WGZTK3J1L2E1Ymgr?=
 =?utf-8?B?NXFsOW4xNGNlRVdIUkpEMG4vZGltanFIRUI1SHVwelMvM0YyQmNJZ3J6ejlQ?=
 =?utf-8?B?YXgxV2pPYlNjRlBPSmZtVktXZC80NWZtT2w1YkplMXRuZ1ZVYWppc3NPVWMx?=
 =?utf-8?B?d2N0VlovWkh3UlBLRjJhOWRUSTRiMEZ1RmdadHdXdVRkWklNMGFUNnZjd0dl?=
 =?utf-8?B?OVhQYTRrdS9IOS93Vml0dHZHdkR1UE5GTkhBME9kc2t5Z1JYcnF3UGovNDRw?=
 =?utf-8?B?YXcyWVlTbjYxMW1TVUZPbnhYM3hHZWFMczNPNU01WDRjdVM0aGJJRXZZWFVi?=
 =?utf-8?B?NVVPckdDa1djdlJnTngrMFFZMGR6bTNFUWxzREUvaVNMWE9zZzJXZUhWWndu?=
 =?utf-8?B?cytleXltZU83a2h4enRkNGQvUS9RUkRMRXMzc0VscTBOT3VjV3RNSDdlZEha?=
 =?utf-8?B?eWJhc2FiQktPWmVBbWl3UTBLVU1ONWRmM2hWNnBzVm1Sd3pmVVlRZmpVRnhZ?=
 =?utf-8?B?Ty90cUlzWXlndGg2RXg0MTFkZks3NTlyY0NHeFRPYm0rOFllTU0yNmdwSWRF?=
 =?utf-8?B?UlZLRlRrb3JLQ1pQTDB0OGJVbDVWQll5dkNtZjRKNVFuZy82UXZQbWRBam03?=
 =?utf-8?B?MEw2RWJ5SFBLcTNMb1pHM1o5STArSzBCVVNlY0VVZ0EyTVlWZFVhbC9jNW9X?=
 =?utf-8?Q?qcjXxMaKPG4Vzm2J6cENLtaWW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b99704d-f942-480b-4c5f-08dd469ac415
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 10:41:08.9517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mR2dmatZ+8r2+H6hhP/Bd/fjJha2xiVqBMwJ8FYD2AyM1U7CEzNHGh/MMT242hQod3c5/VM/t/41eI39NN0QbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139
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

On 2025/2/3 16:25, Akihiko Odaki wrote:
> On 2024/12/20 19:04, Honglei Huang wrote:
>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>
>> Add a new resource for blob resource, called userptr, used for let
>> host access guest user space memory, to acquire a simple SVM features
>> in virtio GPU.
>>
>> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
>> in this series patches only HSAKMT context can use the userptr
>> feature. HSAKMT is a GPU compute library in HSA stack, like
>> the role libdrm in mesa stack.
>> - New flag VIRTIO_GPU_BLOB_FLAG_USE_USERPTR used in blob create
>> to indicate the blob create ioctl is used for create a userptr
>> blob resource.
>>
>> Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
>> ---
>>   include/uapi/linux/virtio_gpu.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/ 
>> virtio_gpu.h
>> index b9a9783f0b14..0a6b56acbc13 100644
>> --- a/include/uapi/linux/virtio_gpu.h
>> +++ b/include/uapi/linux/virtio_gpu.h
>> @@ -323,6 +323,7 @@ struct virtio_gpu_cmd_submit {
>>   #define VIRTIO_GPU_CAPSET_VIRGL 1
>>   #define VIRTIO_GPU_CAPSET_VIRGL2 2
>> +#define VIRTIO_GPU_CAPSET_HSAKMT 7
> 
> The changes to add VIRTIO_GPU_CAPSET_VENUS and VIRTIO_GPU_CAPSET_DRM are 
> already merged so this should be rebased for clean apply.
> 
> Number 7 is also occupied since 2023:
> https://chromium.googlesource.com/crosvm/crosvm/+/ 
> e4c1878733937042111fca58899a3a94002bfef0%5E%21/rutabaga_gfx/src/ 
> rutabaga_utils.rs
> 
> VCL, a proposed VirtIO-GPU OpenCL driver, is also going to use that number:
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31634/diffs? 
> commit_id=55a1a8a32057e83819b046f2de03aca333b052b4
> 
> I think you should talk with Antonio Caggiano, who picked the number for 
> VCL, to allocate a number without a conflict with VCL.
> 
> Gurchetan (the author of Rutabaga change allocating the number), I think 
> you should notify the number usage by sending a patch for Linux or 
> virtio-spec.
> 
> Regards,
> Akihiko Odaki
> 
>>   /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
>>   struct virtio_gpu_get_capset_info {
>> @@ -415,6 +416,7 @@ struct virtio_gpu_resource_create_blob {
>>   #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
>>   #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
>>   #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
>> +#define VIRTIO_GPU_BLOB_FLAG_USE_USERPTR      0x0008
>>       /* zero is invalid blob mem */
>>       __le32 blob_mem;
>>       __le32 blob_flags;
> 
Hi Akihiko,

Really thanks for the information, I think maybe using an unused number 
is a better way. I will send a patch to virtio-spec to occupy a unused one.

Regards,
Honglei

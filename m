Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F30ADCC7E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 15:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3BA10E64D;
	Tue, 17 Jun 2025 13:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HY/sQgf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35F10E64D;
 Tue, 17 Jun 2025 13:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Abmic75KZy6p2oG9KL4TmoUXBJHoNct6f8UsPMa1glO36kl5pY/7alFNr2Qx/zEPs2lExAEmnBPGxcBtONjpso1Eps1T3dHBy+XRRAwaECFN7yc2Jy/uaHW5GIDBilWC/QcsfdMUc/+mfEBjUqjlUf/NbCFBKK+ssTrp1j/bxDoWA/EgLIwwaiUaC4Ufx+qXeYZkSmtmJf+y/I/QDCXEN+nPcjPLMjuVOfgJG8dXCcuRo5eVaYaGsic4U4FD56tADJgouLutwAgGG0PQBSgmyGfjl91vIztIXA8qylZbuLSJOAiMg8KhwWaP295du58ifkpZU+wXIjFc/zuPR5XV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSxRa6e25vsrVkUS8qFJ/4eheGiTXaI+0rQslIQ1Sqk=;
 b=P9OMN6cOlskWB/AdBA9Seqs76QYlARQy5ICl2tQCY7c0T96/b8JBOQeMJLcEWOPI+j6Yqf8O6Gsim60+6wMPGvRecCSWkfZI8R2+oVC/PQiaeiTYDZPV8vGKmW3u+Nv5edm+H2eHMwjCeJ2CeeABQab7JFXgbYjjrTY9xNLc57mnNZ/qMaDBF4llpkhkc5Z3zLV073ybU9eJg4cvKoOQ+7mNwsgaMu2TZ6AL4K6CNnFbp1qVrgn6Fp26Xf6w0tZAhyGKaNNnDF3iKYxxfZLzFPiKw000TO3kqcUZ9uZayJScY++YkW4Y27Drz2J+kYyOQlmeadUX/gHXv3w79wY7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSxRa6e25vsrVkUS8qFJ/4eheGiTXaI+0rQslIQ1Sqk=;
 b=HY/sQgf5PcG38q9hG5lqD3ipMhIVoTXiO6rS1KH1uMz5gJI3EN9HnnUPGxp4caNUAwtA2mJB5FGGA4fBefjTzXxO6N6sk1NQA3tOBS6hdRZJ2VFDEjZdzSqo6JF/j60nh2h9R8JMy1m1bt/L0vc3RkUE7OgQGSMUYPyLn5Hzwww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 13:07:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Tue, 17 Jun 2025
 13:07:24 +0000
Message-ID: <5db1dda6-0cd7-4fc7-9a22-8ed57b12ada1@amd.com>
Date: Tue, 17 Jun 2025 15:07:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250617124949.2151549-1-andrealmeid@igalia.com>
 <20250617124949.2151549-7-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250617124949.2151549-7-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: 777f704e-9791-4462-11e6-08ddad9fe736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGtHWDlFeDN6ZkVIemxyaWVSTENYTHJNN0FNWTg4L2JrNm11OWxzbEdkRm42?=
 =?utf-8?B?N0RiTThLUGE4ekVWdlVBbFpjQUpJWjZRTTRBWHJBb3J3d01WZWoxeW81Wkp0?=
 =?utf-8?B?UUVFZWZqbmpJMUYrNHRUcEMwVlJERzFqWW5TdkhUVDlSZUlJR0JyOWJyaTFx?=
 =?utf-8?B?elpHeW5pL3BqVng0UzZHNzcyUlhiT1hoa1d6ZkxSc0dtUm9MOHVDa0trOVRn?=
 =?utf-8?B?OEJ0bDFDb09mcVlBcWFLcW5CRTBCZExNaThLUnk5K3BIdXpjOEN6THpndURy?=
 =?utf-8?B?ZktOK0dsV3FuTnB3WFR1c2drTHlENGxGWDc1ZzNJNisydWN4VmxpWm83UmVT?=
 =?utf-8?B?Zk1pNk1tUFpGbDBkTnhGWDlCdjdLSHo3QmtnRzd6SnEvdWZVR2RGV0pBUjZT?=
 =?utf-8?B?TlpUaG01eWM5Y0VWeFJLVVFwNXd1WWJQMUNFMC9rQ1FITFpseDYwdVZ4a1pC?=
 =?utf-8?B?NGY4Kzl1Mm8zYjRicXluU1BqRzVhVUs2Y0cvSnFhaVlJTXJ1cXh2aWVTVGNt?=
 =?utf-8?B?TmNaU09xMWpPYnpOeUs1ckQ2clBpSnh1bzJqWXZHN1JqVThXQVVTTWt4aHFz?=
 =?utf-8?B?U29oai9peWdNQjl3QWtuTXV0a3AxWjZKZ05QVVBmeXNsQjBFelVaS1p3UXlC?=
 =?utf-8?B?VDljYnRqNjE3dUJZVVAwZ1FwNGw5RlgxY2YwdFZnMUE0RE9CSnBYemZwTDBP?=
 =?utf-8?B?YkxGdElURUxkOGZKajZyZEtXRTlIWmpEWUVMNGtROGNtUXRocmxQOUxTelRm?=
 =?utf-8?B?c25oVEVRTXR3clhBT0NmWXdwQ2ZUZ3R2MFd5UHhrVGY5emlhbHRIT1I0dFJM?=
 =?utf-8?B?ODY1Z25FanczVTJlMExtYjNYU0t0S2dmTFU1NkdORmdJWkxOaE9jMFBCYlFX?=
 =?utf-8?B?a3JVMndKeGYwZU10b3ZXc3FDNVdNeVZuQlllTGpYdzdqSU9EZ1FaQ3doWmRP?=
 =?utf-8?B?dGNIUGtJTlRmd1lMZzZuOVR4SUNKWXU5RkNhUEZEL3BXYVNaejMwbCtmMkZF?=
 =?utf-8?B?TmFMbkJkcTUvZ0FTblhCYTJuNnQremNGUlkvYlRQOGZxc3NjV1BRNjdNcENn?=
 =?utf-8?B?enRxWjRWSmFRbU95V0ZmZStTQ0dYSEJ6WVZuOGpLdENTVUtibXRiYkpldmN6?=
 =?utf-8?B?dmFDZ3g3SVpJQlhZM3dEVlFaTHAweXFSOHNiMzAzR2QrbFRIRWFPTGxnSTRI?=
 =?utf-8?B?cm9TQXg3V1Z2YytnazFja1NEbUJ5QjQxdCt6OWtxdmJzcFo0Y055UGphaWJR?=
 =?utf-8?B?OUljcVU0MThQQ3JjOTZza1BIQUV0QUJOVDQwWTJEbTloRUliZmFRRXAwaE1M?=
 =?utf-8?B?eW5WK3Zldm9ucVZYWmVMYVJUUGVIL080Q3JRb25weUo3Y044aVNXWmxMTC9O?=
 =?utf-8?B?eGpKaEttY2lBTGJueE5vZzBxMlpMT05LaXY5N1NZZ1c1TmVXaDZDODE3dkpp?=
 =?utf-8?B?YlNSZVpzc3pEVUh0WEhibjA2ejQ3NmJnQnd2WTVwM1phcVYwRms1cjIzTVJn?=
 =?utf-8?B?UDdhcTFVaTFPdjhKTjVRUExhVHVKUllseFFRWkVBbnlzeGwrVkZwMlg4bjhh?=
 =?utf-8?B?ZjB6Y3lGTWhhNnV4Z0RtaGlSQVBuU0dvMk5SL1hLelBOZ0xRZ0hCcmdNanFK?=
 =?utf-8?B?U3NySklxQ3FtQ1Z0NHljbGxEbVNMRE1kcGVzVjNvL05SWFhCSjVFMThmRURK?=
 =?utf-8?B?N1NKRGFkbXp3b0puTVZSM2lhVmVFUFMvdWNZOHdaUURUS0cxZmJNZklOcFJa?=
 =?utf-8?B?YitnaS9NQVFpdXU3N0xuMnhSZnJaRnorNGVFUVlRazRZVEZtYm04UnRFRkNi?=
 =?utf-8?B?QzZsUERyZkI2VGNiTEowNzdZcDc3TU1ac0VpN0h2dUZpeWhlY2ZoTFczM2Z2?=
 =?utf-8?B?bm04SjBpSHVCN25ObkFsZlpuRWNidGdoa1IzUHJ4azVxVDluVFFhNXM1bUxt?=
 =?utf-8?B?bUV0TkwvRlU3Z0E1L0laUVhpUW9vZG9OMGJCRVhTcFpsKzJJc2lrbllkaDV0?=
 =?utf-8?B?anVoT3hlRkN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2lNQ2FaOGdXc01xckJ4b0lqNFRxQkx0TUF5eURGdTBDMUZrTW9TbWpiZVJy?=
 =?utf-8?B?d3I3eCtjQ1h6aE9GdjF0R3hiREQzVkhBdDBCc3k5anlNdmRXN2hVY0RlNE9Y?=
 =?utf-8?B?SWFGUFRZVG8zS3RUZVpmS0xkTTZaME56UTkwcVlkclBhM0p2a1NBQjNhQkFa?=
 =?utf-8?B?QnN3eXJLcHJ2OTByVHE0TnRqdkpaY213VndwTXQ3eTNJRmt6ZlI4eGxXNTdh?=
 =?utf-8?B?VjFXNGdYc2tyTEJ1TDFpM3U4SStOMU0yOGtlTmVtSXRHUDhPNUdzcjlSelpL?=
 =?utf-8?B?M3VEQjEwQXdKRjhjeW9MazlxRWhpNVdVNTRnU3c5ZjVYR1dWT1ArRzNtTllK?=
 =?utf-8?B?MnNWTysvOHA1V1ZrZWpkeW0rTVErRmN2SmVpd3AxakFHUXdjKzNWWTFnRWtE?=
 =?utf-8?B?dm9iaml5Tm4vQjNBV29WdlA5YWVlaFBnV2hkaHJOZDJTbDFXTkFZaXV5MDE2?=
 =?utf-8?B?VWZTWk5DSG9OZmo1d012UThrL0lucTZKZ0R3OTZvT0Q3ckVHQVNLZ2MrSjRm?=
 =?utf-8?B?N2hINTBvNXNNODRTaHNqTGp2d21XeXZTaWx5TTJRQndjL01zV1ZPMlJpN0lZ?=
 =?utf-8?B?TmVlb2YvYWx0Q1lQUzQzTDlDMHBJZHAvT3lVTkw0YWNSa2JiQUpCQzlSNEkx?=
 =?utf-8?B?YnRZY2tVNldmV0NFeTU1RkczMGhYaFpiS1o1WjJ5UDVGcWFWRHg1cnJWblZ1?=
 =?utf-8?B?N2JZTjRramt1SEJqQ3haMjRnelVqUVVwWjRPaTloVGxKb1JGTk9ETE45T2U0?=
 =?utf-8?B?YUN1RTcvaFByR1hlbnE3QWJPZmlsZHZyQzBTNm5UeVVFL1dCaE9uNmdmN1RC?=
 =?utf-8?B?MkEwMU5pcERBdlpNVENXR1hyQW1VYTBtOU5WckFwQWJkNFlYY1pVdHU0YUpz?=
 =?utf-8?B?ZFR4UUFGSWtaaDdVLzk0SjFDSHF1ZTlSTG10VFdPNTdaNWdmVVV4NTRvOWo2?=
 =?utf-8?B?MGhZUC9xbmNibSttNC9NS1NMSFJ6bmR5QTJ2WjRxWjhvMytOcHlLanlES3VP?=
 =?utf-8?B?RGpwV2xIVWczZUIwWFViUWNnRUdRZVBIMWZZTFM5dStUTU9MaGZicmx6ekVP?=
 =?utf-8?B?YUo1WGg5aE9mclNXSlFvUGtrS0g2QlVVTVZqTW5tNGhJaW9mNU1NaXZWWHNr?=
 =?utf-8?B?TE1SRVYrMUxuTzFZaDd2ams3NmRFTGpaUmozTkxqK1I2dDdlYXFRcW12OVB5?=
 =?utf-8?B?cjA1TEFidytEWW8wSWpPSUFncUlrSHcvYU14WEZvRkZXejdwQU11NDZIMVRr?=
 =?utf-8?B?bURMRHRRelF2R1ZXMWVqYXExbzc4NEhOMGZYMkFmRURmbjd4eE5qWjRWZGdM?=
 =?utf-8?B?N0RyRW5hWnlNazliMTdmdEs3QWluaUdobWZuU1FBSjg5YnRGM3pHd0I1Tjg1?=
 =?utf-8?B?dG5kOW9BN3ZlTUQxcG9CL2UvaHBaSHBmQmFOZllGVG5nTU9TdDBxS2pDQ0o5?=
 =?utf-8?B?RnZ6VHg4SHhUcWpJcmxmZlhvNXpJbFFObGFBZDVTZ2srUnBFK3orZEZjWVFI?=
 =?utf-8?B?NnBSOWVNYVRHb0lxcFpBYTF0SmpoQnpNWFR0TkxlVi9TeEhDWjRKNTd5QnZj?=
 =?utf-8?B?RHpoczBjNGpiVVUxaVArOUZmRFU1Y2NFSlBIblVZdFdCM1Ayck1TNDB3Qjlm?=
 =?utf-8?B?alZOSlNSbWM3RWpCQTZBcjQzbVVjZHBTaEF1WlNBS09pQ1gvblJIMlQvUEVT?=
 =?utf-8?B?ODRmYkJjb1lHbjhlTmNDZDVoSC9VeENkSVlJbXJrc05lTkpRd1VuOTJHRTFL?=
 =?utf-8?B?Y21LT2lDQ0VqYVE2Q0ViYS9TdkZseDg3OEN4RkVBaU0yZmlIRy9VQXJ1cHUr?=
 =?utf-8?B?ME03clhtYTVaR0ZPbkQrQW5FUm0zaHBWbmJpYkR1NC8wK2ZHTFhZVEVTQ056?=
 =?utf-8?B?NUxFOU1IOStnSHdhbVhRcUV0b3RJbWhidkhvQmQrenBMNVR1NmxFTmxmVXgw?=
 =?utf-8?B?YVV1eEFqY0V4eWYzVVg0VlYvWVRMZGNTbi9KQ2ZUa0xyQ2ExK1loQjVqS3Z3?=
 =?utf-8?B?QTIxVEdML2ZOYTdEUTg4SUdKS05zb0k1Q2dGNFExY3NEQTU5L2xvY1JLazFQ?=
 =?utf-8?B?Q0JoeVNIVWYzYkx1MFcwNDVjRFVreDdCeU5objhnVGdac0J5R2pucjFSUjJx?=
 =?utf-8?Q?jq1DRfm2IovKLzQv1srFR2HVb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777f704e-9791-4462-11e6-08ddad9fe736
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 13:07:24.8631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9NXzWNf4lL/BqE1nzqHmhef2Knu6ChpC5Vu1Jd+2z8Jm/ZLXZ4WcZVrnjrPVR7n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192
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

On 6/17/25 14:49, André Almeida wrote:
> To notify userspace about which task (if any) made the device get in a
> wedge state, make use of drm_wedge_task_info parameter, filling it with
> the task PID and name.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

Do you have commit right for drm-misc-next?

Regards,
Christian.

> ---
> v8:
>  - Drop check before calling amdgpu_vm_put_task_info()
>  - Drop local variable `info`
> v7:
>  - Remove struct cast, now we can use `info = &ti->task`
>  - Fix struct lifetime, move amdgpu_vm_put_task_info() after
>    drm_dev_wedged_event() call
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 +++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  7 +++++--
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 8a0f36f33f13..a59f194e3360 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6363,8 +6363,17 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
> -	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> +	if (!r) {
> +		struct amdgpu_task_info *ti = NULL;
> +
> +		if (job)
> +			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
> +
> +		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE,
> +				     ti ? &ti->task : NULL);
> +
> +		amdgpu_vm_put_task_info(ti);
> +	}
>  
>  	return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> index 0c1381b527fe..1e24590ae144 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  {
>  	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
>  	struct amdgpu_job *job = to_amdgpu_job(s_job);
> +	struct drm_wedge_task_info *info = NULL;
>  	struct amdgpu_task_info *ti;
>  	struct amdgpu_device *adev = ring->adev;
>  	int idx;
> @@ -125,7 +126,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  	ti = amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>  	if (ti) {
>  		amdgpu_vm_print_task_info(adev, ti);
> -		amdgpu_vm_put_task_info(ti);
> +		info = &ti->task;
>  	}
>  
>  	/* attempt a per ring reset */
> @@ -164,13 +165,15 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
>  			if (amdgpu_ring_sched_ready(ring))
>  				drm_sched_start(&ring->sched, 0);
>  			dev_err(adev->dev, "Ring %s reset succeeded\n", ring->sched.name);
> -			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> +			drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, info);
>  			goto exit;
>  		}
>  		dev_err(adev->dev, "Ring %s reset failure\n", ring->sched.name);
>  	}
>  	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>  
> +	amdgpu_vm_put_task_info(ti);
> +
>  	if (amdgpu_device_should_recover_gpu(ring->adev)) {
>  		struct amdgpu_reset_context reset_context;
>  		memset(&reset_context, 0, sizeof(reset_context));


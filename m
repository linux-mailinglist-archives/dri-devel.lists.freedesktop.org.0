Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E7ADAFE9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 14:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE98D10E36C;
	Mon, 16 Jun 2025 12:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ppLJY/V/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBA810E337;
 Mon, 16 Jun 2025 12:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdcfd/aWCMeEOB3cpMDrzcIDp+pnC4klppNPZnLirRbNOM6+jXQr4XmCdRimqL+3IgDcqp0SReet9aLhcIs34zA5AeOx3cZjVL3pnGDwrbGTfYD/qbEYKrmpfjJmY4qbK9IBrabA1m0/vEY2yHzKBMQN+LxbYMSQnqGS+8Qcnop6aCo+BfopsdUItIQRqAgs5OypXnHZsuSgxRD/9Vyy6MQrywPnSmSTrnbOti2miJBRS2Cd1N5YvWhHuLyEoU0OBB8mjmapdm9J2cRKHYH1zGE893Qc9M1oVsTj8edNx1DR/9zsYPOHMO4+YW7GxvI771xyma0j/Os+BlFartDZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1KZsnvmXiD4+xLBewjZyz8Z9kDfTF2jgKTbkntd+3k=;
 b=hsePLIyLbfHAX2offuevOhjHVgcsHKU747nZ58P5ygZb0S+d1K+pekyCF4NeHar7zQIrl+63H4WZr4l3c4IR5Q9FkMsuGSlzEcsM6e7Po9BIFnJ3RBjESko8ZI5vXbXDyBs6QATNwvcaEwy+9q/VXlWOTa5IDfx3yL8wNyQ5Atg90pIQBK8t0JUZR70asQEKGLyKJFQ+updHxyLMnp3qjTgm73Fx78s/hQo1ZxMqabrBIW70uUqyNHg/W4mF4y78CwxxMwGgOHwOd/0ObF3As99hxmT6J29CWPx1PCOPWpHKQ2+ioE5zZ3KFLSKrTAfm/2BkVIwd7e9QH2Q6Lac3aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1KZsnvmXiD4+xLBewjZyz8Z9kDfTF2jgKTbkntd+3k=;
 b=ppLJY/V/b2/AOgcvWsPTPcKJEBk8ZOkUbmTHUlI6ZhjfFh0/WarbrCOzBxGbdqRjkb0bpnFG0ofu0L7ZlLyoL8BfHuW+AOlUd0EhSrmwwL6zr9RQttSpHYikrdjTmVE4molek53pmw6m+JGhyt/2EnxfWY8bHkFYaZVcFlh15jM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8456.namprd12.prod.outlook.com (2603:10b6:8:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 12:11:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 12:11:40 +0000
Message-ID: <3ca35236-377f-4ef0-becd-ba5d22b5edd8@amd.com>
Date: Mon, 16 Jun 2025 14:11:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: add debugfs support on per client-id basis
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250616100503.1204166-1-sunil.khatri@amd.com>
 <20250616100503.1204166-3-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250616100503.1204166-3-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR14CA0016.namprd14.prod.outlook.com
 (2603:10b6:208:23e::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 839a886c-c634-4eba-21c0-08ddaccef37c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0pUb1Z0VWtNRkpCWkpRY0VyYmRKLzN0aUFPaVdDRStiRlpTUit0YzZTcjI3?=
 =?utf-8?B?WlMzU1NPNWF6ZThydmRabGtHdWVxMlpxWXlTV2FnOEFxczRHTUJFVTVPT21y?=
 =?utf-8?B?R1k4b2VYbU50Ylc3ek9UTytESDQ3c01pcFROZzlwdzZCbVQ1cHVJRDZsaUhX?=
 =?utf-8?B?anczNUxDRTVKdGp2eHI5M3JFcU9YUzBSSkJMMEZaTXFuMDNYd05CSVJkTEMz?=
 =?utf-8?B?VmRvSlNlZEZvMWxvWFNqK3NDMU1XQTExeG1icDVQTFFpdnhWb2o0aWR6M2dz?=
 =?utf-8?B?WXArdExDRk05cTRZYWdDeG81Q2d2MG1UbXFJVGMzckRySmR2eWoySVFPeFhq?=
 =?utf-8?B?OXBXakNpLzZNYWhmYmdJN1JGQy9aWnB5M2ZJSG54MndGVW9ONERpa0Qwejl4?=
 =?utf-8?B?OGhEb0xiUDY0U0JBK2VXV3J4OEhDdWV5NGJaeEV1M1pqallsN0JRS1Y1N0lY?=
 =?utf-8?B?YlVhTXFIdnZtUDV5c3h6M0xIbjF3L1RpOVVxVllna2V4cTMxeS81UnRHcFk2?=
 =?utf-8?B?YXZudzFhZS8waWFBWTNhNVllcEhQOGhZSzhuNmlhM2NlZ2tkWlNCcFdkYVE0?=
 =?utf-8?B?OVdzV1R1V1lWMHJpemM3M3JsQThSOCt5VERHNVJlc2xrc3hOcnRmdnA3RXVB?=
 =?utf-8?B?ZkJ3bU0xbTZoSzJJK1A1V2J0Qm1uQ0pjTlR0c0oyRWlUL1NGNER4N29nTlAr?=
 =?utf-8?B?Ky91enFyZVpRNkdSS1FDWjlrc3NaVVlGTjBRUi9nejk0ejJiQlN1ektILzls?=
 =?utf-8?B?WWZCaDcyL3J0NCtTQk9sYnloUzdtMTd1dFBOQzdWQnZJelJ4VEQ4WFF0UFFC?=
 =?utf-8?B?SWF2aVpzci9IQ1kzcjJGQVVzb1FlT05sY1Y5OUEyb1h5RFlYbS9MRnZCZWFa?=
 =?utf-8?B?cjZvYmdacTQvZ0VRd3N6QXhqQnFyelVNK1RsRUZENy9oUDQvc09nak5oaENq?=
 =?utf-8?B?dlZpaHVQNlRpUHdNK29RemVDUDhFYk1weE5vN0hZOEdabk5aek9LRnlDVmZI?=
 =?utf-8?B?VmFxMTFDMHIzZ3hDcW8rSXY4Z1oveGhvZVZwbzlLSzhpZUhXNWd2eDZVZ0NO?=
 =?utf-8?B?cHJLT3ZWWGwrM3lLMFhyLzF1cHk3MVY0cVNiK2g5bWkwT1AvTmEyN0pTK2dp?=
 =?utf-8?B?bGFOSGVjeGpuRk5BR2o2UkkxY251TGlIUlVWQXVGSnd1K0Z2NjY4Z0pIWVdo?=
 =?utf-8?B?YURzMUNDZ1UxT2FOUUgrYTc2ZkJadFhVYkdYbXhCbmwvckovcnF3YVMrSjUw?=
 =?utf-8?B?ZitqTDhjYjNXQ1dBQWFDNkpFYjF3ZW5aUmNCdlJQak9YMWY2ZzJVSjNTaWxq?=
 =?utf-8?B?RHVlSDdhbTRpSDE3OWpEc25UdzRJd1lSSXZDSUtKbHk0U1JaeDlKZ2pRV2sy?=
 =?utf-8?B?aXRCRHNhNTBmNldFcjBScHl2OERZYXF4VmxjWnBBWUFsRUhyallxWURTMzg3?=
 =?utf-8?B?c1BRazIyWFlBWlpqMzA5NHJvTVBjbGpJcGFjc0NxYUpYYnQ0SkdJRkxVTUxE?=
 =?utf-8?B?eW44bFNwcDF4bGdQM09EMUdmUVR2eERzb2JlOXVCUWdlRGQvMk9RTTVpSE13?=
 =?utf-8?B?VWxrUzJOWUdtNk1uSnROald6dVUyYktLK2dnUHpwTmVmYVdaM3g1NGcrTWND?=
 =?utf-8?B?bFF1SnB6TjczNkxmYzdTaG5QVEdtU2t1SnpQY0M2YWNtamlscnhhMUZyelBx?=
 =?utf-8?B?clNDV1h4bkNTaWZTQm1hUmMvMStENVgxenZUWmR2VGhBWEJ4M3hoT1lKWEkw?=
 =?utf-8?B?YmtUQzlmZC9wMEtvbnc3eXB6d094ek9xb0hITHlYWFE5Njc5TzJvM3B6aVBu?=
 =?utf-8?B?aVNwR24xNnJvWUxHV0dDSjdPUlkvbGRtb1dFOC83QkwrQ3RrQ3FPTUVEY1ZR?=
 =?utf-8?B?MXA2aG53YWdrRzh6NzlFUytEOW9TYVJ4NjV6TnlaY2tZdkYrdXF2M3FXMjU3?=
 =?utf-8?Q?e3zfwMvUhi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K21vR0xQL3Q2WGplblVCQnQ1UXIzV0l5UHNydVIrVVU3bE4xclpnQkdCSEhl?=
 =?utf-8?B?dDJRWHVYT2ZmWitHVkRVQmUxSWk0Z2VnZjJlNUZFaFI1K1FMMnQ0QkR3Q3gr?=
 =?utf-8?B?U1h6M1BpYVFneGF4QTRESUlwWkc4aFlRR3hTVmtldmxzV2hMNEZycnduT2dk?=
 =?utf-8?B?TFZBVjlWV0lnZlh5OVFJQ0Jxd2dMbjJJcm9MMkt3aHhUS0M2aWd3L1VGMEZ1?=
 =?utf-8?B?ZTNNUEhpc20vMEs2NFZabnBhZzJla2ZjTW9OcXNJTW5sOWNRYVhKRUpDSG1z?=
 =?utf-8?B?TVE5c3hoTVNCYzVPeEVYN1hsVE5sclc3S3BVWk5KMEVCQjNBSE1lQXdYN0N6?=
 =?utf-8?B?Q1JEYWd1UFM2ejRFWDJvd293SzR2Zmhpdi8zZUNkbFJUUkNZVzJOV2ppL1Zu?=
 =?utf-8?B?OUZWOEtzSGNadjU1cnByRXJ6MVRYdTRDMjZ1YXBnRVRyWGdVdytBVmFEUEo3?=
 =?utf-8?B?TURMS2dPakdzekVRUnFXZXVTQVZqeURPbFJ0b0hYZW52Y0IrWEdENStHN256?=
 =?utf-8?B?UDIyZnk5ckZMWFlObytWRmNTSHE3MWZISHlVS25KQUpGVkpyUTBoNTFSeld4?=
 =?utf-8?B?alNWQWRReWJVajZKTFJtb1Z6VitlYVRINE9Temg4ZkNkUTBLWWp4WllmNkpu?=
 =?utf-8?B?cUpkSUE3N3FoS3gzU01OMWd4aEl5bmloZFBSeUpSNmtqSUcxSmdYdlJHU3I2?=
 =?utf-8?B?L1k4RzNhSnhwdEVNTHJsSFhsZkN0QlZYWkFVWVJ5cFNCbEgrczl4ZFFHMjNp?=
 =?utf-8?B?aytDMmNyN1JsZDI4QVU1LzNWUkd4Z2FBWnRNSGc1Q09PQ3lsNkEvTFNDR1VN?=
 =?utf-8?B?MlFhQVZSSGZxTWN2SE43ZytaK29HVFMzUzRSVDl3OHArdkxwelRMRUNPODhU?=
 =?utf-8?B?K0JZSnN5Z2pDQnMwT0Z0TkgvZEZMRE5QY0E5SzdYaGhSSjRvZWh2SGErVm8w?=
 =?utf-8?B?WUJCbVBVSWMyR3pFdmd2aThRQVhYcmR0MVFwMGU1MC95VmFGd3FKUitiSk5x?=
 =?utf-8?B?VFR1djZvWEtBTHJQK0FNcHZ0RzFCazNacXpnaUpLNXZBRmcrM3NmMnNEdnVB?=
 =?utf-8?B?S204MkJSMkJuSTJkOVAyY0c1cnJHK0c2NVB0QlZXYjJQRy9jcnBYNkh0VnJn?=
 =?utf-8?B?UElyd2xYdlpoaFVSbUFXK003UDNlTG1qN0VCQnNrOFhOOHBndXZDRFpKNDdQ?=
 =?utf-8?B?RVBGN3lWTDJUaHcvVjlnbU1ERUlXaGRhdHV3eUFkSlB5UGNCbkVCVFdjT05F?=
 =?utf-8?B?QVJMWkI5WkxOa0o4cC9IelVwY203d1NTSkZWYU96SUhHYlBHS2hkYUw3Rm0v?=
 =?utf-8?B?NWR4MzArOHVDeERnc2swU3JWMmIvZ0tzWVVkenZPZnVRMXl4UUlDL3NiM0RC?=
 =?utf-8?B?eFMrNlVmWDV6MmIzR1BONEFFR1R6bVAzNE5DM3dCR3BFWEExTW54enBZdVp1?=
 =?utf-8?B?azFxbHpma2l0TnRUakVxb2NvZzRFeTk3ZHY3RXRkVUcybjhsQnZ6Snp3YUZM?=
 =?utf-8?B?RXpoU1BnRjBEbFUzUUxiaXRoNGdOTWdyb3VOVGF4YituazRlaHlnWkp4Wklu?=
 =?utf-8?B?MDg1b0l6YzRlTFc0SHNpSnlESzZpelFYamwrUzZ1TW9zN01YZFRLS3MzUldQ?=
 =?utf-8?B?UGFyN0p0M1JXZWlCVWhBc0hib0N6UEtNbE1TSVB1VFB1aW5LdVVWWmx0VkR0?=
 =?utf-8?B?Y3BMcGZCdy9IaVp5UnF3RmxxU1ZDNm9Yc3JWNlRrQ0VHNkRmNnNIajV1RFJv?=
 =?utf-8?B?Wks1S3UrRHZFVEQxN0Rnd3ZxTXRqd0x5dkdOV0FWaDlvVUs2MUZXSHByTTly?=
 =?utf-8?B?dEtjcFF4N1NCWUZJMk5BSVFSY2ZiaGxlV29XNmUyUnRVNTVtOE9Gbnl4Q2dx?=
 =?utf-8?B?c1lRbzlkcVIvZXFyVGVYdkZDTlBIaHJkSVNYaHlQZDlpdDVlNEhHNVFMWkFK?=
 =?utf-8?B?MExuREE2dkRHUGtVVjRIaGpYQldOVjUvOVdwdFhzb1Jab3ZuVTdpbEZrZm0v?=
 =?utf-8?B?VUhYeVdwQVd0RUVNTG5PZnJ3dURoUUxsZEdqQnBNSzRnZzVGUnhwdElhZ3Jn?=
 =?utf-8?B?dU9GQ3IwdjlUVkNBV0NUdDU4Zk93N0pDUkVEY1owTXROMkFOYS9nWjkrcVN3?=
 =?utf-8?Q?ZCFHzIoKu1kdcx2lCUalqcMeQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839a886c-c634-4eba-21c0-08ddaccef37c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:11:40.6674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CvXgI+hjQ5CPSL0AFfWOS1cKtihJz2eZx7RhY2kLi1ZkJckMSioarIAMFaYSGvK4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8456
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

On 6/16/25 12:05, Sunil Khatri wrote:
> add support to add a directory for each client-id
> with root at the dri level. Since the clients are
> unique and not just related to one single drm device,
> so it makes more sense to add all the client based
> nodes with root as dri.
> 
> Also create a symlink back to the parent drm device
> from each client.
> 
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c |  1 +
>  drivers/gpu/drm/drm_file.c    | 26 ++++++++++++++++++++++++++
>  include/drm/drm_device.h      |  4 ++++
>  include/drm/drm_file.h        |  7 +++++++
>  4 files changed, 38 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 2d43bda82887..b4956960ae76 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -296,6 +296,7 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>  void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>  {
>  	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
> +	dev->drm_debugfs_root = root;

We should probably just move drm_debugfs_root into drm_debugfs.c instead of keeping that around per device.

>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 06ba6dcbf5ae..32012e39dcb4 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -39,6 +39,7 @@
>  #include <linux/poll.h>
>  #include <linux/slab.h>
>  #include <linux/vga_switcheroo.h>
> +#include <linux/debugfs.h>
>  
>  #include <drm/drm_client_event.h>
>  #include <drm/drm_drv.h>
> @@ -133,6 +134,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  	struct drm_device *dev = minor->dev;
>  	struct drm_file *file;
>  	int ret;
> +	char *dir_name, *drm_name, *symlink;
>  
>  	file = kzalloc(sizeof(*file), GFP_KERNEL);
>  	if (!file)
> @@ -143,6 +145,27 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>  	rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>  	file->minor = minor;
>  

> +	dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
> +	if (!dir_name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* Create a debugfs directory for the client in root on drm debugfs */
> +	file->debugfs_client = debugfs_create_dir(dir_name, dev->drm_debugfs_root);
> +	kfree(dir_name);
> +
> +	drm_name = kasprintf(GFP_KERNEL, "%d", minor->index);
> +	if (!drm_name)
> +		return ERR_PTR(-ENOMEM);
> +
> +	symlink = kasprintf(GFP_KERNEL, "../%d", minor->index);

Better use dev->unique here, minor->index is also only a symlink.

> +	if (!symlink)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/* Create a link from client_id to the drm device this client id belongs to */
> +	debugfs_create_symlink(drm_name, file->debugfs_client, symlink);
> +	kfree(drm_name);
> +	kfree(symlink);
> +

Move all that debugfs handling into a function in drm_debugfs.c

>  	/* for compatibility root is always authenticated */
>  	file->authenticated = capable(CAP_SYS_ADMIN);
>  
> @@ -237,6 +260,9 @@ void drm_file_free(struct drm_file *file)
>  
>  	drm_events_release(file);
>  
> +	debugfs_remove_recursive(file->debugfs_client);
> +	file->debugfs_client = NULL;
> +

Same here, move to drm_debugfs.c

Apart from that looks solid to me.

Regards,
Christian.


>  	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>  		drm_fb_release(file);
>  		drm_property_destroy_user_blobs(dev, file);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 6ea54a578cda..ec20b777b3cc 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -325,6 +325,10 @@ struct drm_device {
>  	 * Root directory for debugfs files.
>  	 */
>  	struct dentry *debugfs_root;
> +	/**
> +	 * @drm_debugfs_root;
> +	 */
> +	struct dentry *drm_debugfs_root;
>  };
>  
>  #endif
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 5c3b2aa3e69d..eab7546aad79 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -400,6 +400,13 @@ struct drm_file {
>  	 * @client_name_lock: Protects @client_name.
>  	 */
>  	struct mutex client_name_lock;
> +
> +	/**
> +	 * @debugfs_client:
> +	 *
> +	 * debugfs directory for each client under a drm node.
> +	 */
> +	struct dentry *debugfs_client;
>  };
>  
>  /**


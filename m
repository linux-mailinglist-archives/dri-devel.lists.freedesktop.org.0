Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B37533EA0C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 07:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F3389E0E;
	Wed, 17 Mar 2021 06:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E59589ACC;
 Wed, 17 Mar 2021 06:46:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNeHllHHDn6+sKIgRjNte1wfpFne3W0ZpQPSAcwiYHrE25GP0J1G0qRY5cmeTSInrRlYLXhP/UUEJBM0g66EjSfI4l77CzoGEBSR4hSiWrEaoZ+VSv1USDN1mW6RxpAXMgIHKj0VgZ5eQy27tGknSh4dPtNW9JnsejkWwv8oyY8oHv6ARHbFmlQntqGT2nL3akfTc7ARZEHAwLKWFDRk2pcEbXzwwdEsciN9lXK8qq/4/1+JqnYvMMOzUBT1RTL+R1Np4OuKSoSmtKFEp0HdMrHHQN3qtvcdtZye3DNSPpbsOv4+3iuObFz/qwO2irUuhfcMqcwvn7Ga7VImI3lb6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZZU+jLEVCUKezLqsAdaX66YbSJ60gFEP088PmAVKn8=;
 b=Y4bveEe72i1CPI794IuxJPPPhIFbmjWa/0D1w7aTkoBbZf9CE3jJxOMsycDaEn27l7vIOLLDZ/df4a6snV+oxoOSlD0ksnMTm2QVy0Sy+M/r8Q5DH6QinsWxf58jSiTqFKuXp1JD2guF/h2WRl0JKsrxIg3yrWJ10ZGb/2o9nV+toTuRuctNQt9jpB6oErz01miwoI8PkgRS6sou2fO93N/YiPSilAflbeXkvED+B/HbD5HiMRN3ZOt8FA91FuoiywSIGsKmn3XL/JFI6CT1Qj1mHrV/E/jqO04/H0n0r9A/wV5CyLbT95zbWmJjkDHCTsMhX5lP1NvLS07Yh7dFBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZZU+jLEVCUKezLqsAdaX66YbSJ60gFEP088PmAVKn8=;
 b=s+a7u5NQTZEy5BcQx5BiFV/M4fM/nvjrtY0owBC7UQo30zeM2aL4z2OWdDeAn57KnpyMSWkkavdfJIUtg4e8rKXJ1/d8msoUUxFZyn3ht5v3WznC5mXp2jbfBMKc9ZVqbxb0Jz0RIT8CART7tbhtNCRkUZ9sWIDjlWFH91myIvo=
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com (2603:10b6:4:51::10)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:46:00 +0000
Received: from DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc]) by DM5PR1201MB0204.namprd12.prod.outlook.com
 ([fe80::28e0:5877:b4e6:6bdc%9]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 06:46:00 +0000
From: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, Rob Herring <robh@kernel.org>, Tomeu Vizoso
 <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Topic: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak
Thread-Index: AQHXGVr0ttnalfpTIkyzQ3GFwzEsHaqEg4SggAGzJoCAAYfnkA==
Date: Wed, 17 Mar 2021 06:46:00 +0000
Message-ID: <DM5PR1201MB020459FE1FFA08DD3A32F7B5BB6A9@DM5PR1201MB0204.namprd12.prod.outlook.com>
References: <20210315052036.1113638-1-Jack.Zhang1@amd.com>
 <DM5PR1201MB020453AA9A2A5C5173AF4D84BB6C9@DM5PR1201MB0204.namprd12.prod.outlook.com>
 <DM5PR1201MB020461EEDC275748389BB631BB6B9@DM5PR1201MB0204.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB020461EEDC275748389BB631BB6B9@DM5PR1201MB0204.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-03-16T07:19:35Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=66e9be39-03d2-41fe-adf2-e4270c782a85;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e7ca5c1d-22b7-4507-d10d-08d8e91053e0
x-ms-traffictypediagnostic: DM6PR12MB4266:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB42665F7542EAD14A0152846ABB6A9@DM6PR12MB4266.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iv14i+qotco+vTVOaijp9kD0OpuMV/aIwAwiSkqzvoLbgsmou8YQ2QppNTFOXe5U4xuFa6ISU4kNOAwdd39HXiVKIwYG8JS8LNNu6CPaFbSOOjldpfEpor/emMTAxX1CN2nLhQzq/kylJEg/6rxOHicqbF7Go0vvrqu4hRo9vvWcPEfNkpIP9YcsjKgYNNNllPOkJLdD+UhVdzWyjAwEzURR1Vh4VVhgJdkExpNRuu/ccnufTGMahlqm4/LW8zBw6XiaqLXDYUsdrvMo+wVTsIDiDWJ7YmhO95h+HJ4wk70dNxpWU9enWWZGa8cmO2tFy6IIiqWi724qPRN+S2I9Wpji9HnVYrZ75s/Oknkpc1ZbJBUjbx54hBDQPZFEmDMZkRc9eidMkgLTyec8VM9eeRqjNfbBvU25Zsa44aJn26GqtWzogTjdOuz2kp7qkRyEWwGGf/6NOVMVGMmlNuinhFPZ81bqYkfhQC6OPrspIa1d94f7BLxnk8kzPhRwfz8Xb5lBnXZh3ATiUouCNRf0VDQW7VKyOtIUkfLFrQI7BKCfi8Dcb+m8/AWaTsflhqup3BVym7tRqMfBTI2vAI3am9gIO6FVnE1YBEnqW31neu0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1201MB0204.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(8936002)(7696005)(9686003)(66446008)(186003)(2906002)(6506007)(53546011)(478600001)(86362001)(52536014)(55016002)(76116006)(66556008)(66476007)(66946007)(921005)(316002)(64756008)(26005)(5660300002)(8676002)(110136005)(83380400001)(33656002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Mk5tajd4VFVYNVEwWlhLOGZjdDY5ZFNaajhHS1ZFd092aXh0ZGNWT3E4UGNF?=
 =?utf-8?B?VnZaUGNId1doUDlHSDJDeHIwQVY3cEVtNWJNZDRIaDZLdzgzM0FBLzVVVEs1?=
 =?utf-8?B?Y3RQaVFnVHNpRlZkMmZ5ZzlwQ3Jha0JxTUYrVmpIaEtQaC9HUkpmUFBMc1ZX?=
 =?utf-8?B?VXYzUUZHb1JOaS9iaE1sLzhoVi9Hc0wrVjBZVWorUUpWSWJUU3A4UkJGcW9D?=
 =?utf-8?B?S1hkT3NRK2k5QnVLRHJvbXd6VkZsL3VRUmprUmNVdTdYamloVk1CUXo4dXJz?=
 =?utf-8?B?VUxaRjR3NlAwNnBhUEUxcWF3ckVBcEFwUU4yaDRzZFJoNXFpUWZ6cnY4c0VF?=
 =?utf-8?B?Ukt6cERKUlNDMCtjNE5zY2dpWitpa0RSWGVHZDQxL2Q0TlJtUmFyY1d5RG1W?=
 =?utf-8?B?NHM4YzBSTGtTUVMrZjM1YTNTT2RnOFU0RjFnNHNGbHUzNlU2d1phUG1QdFYr?=
 =?utf-8?B?bjRxaUx6RjJ2WWREdG84Z2tqb01aaDV2b2ViTE1vWlhKQ2pFUmdOanJBTHZp?=
 =?utf-8?B?Z05aMVNBMTFIZHZCMFE0T0NnZDRxbm5DUC9ObGhZVjNpY1hSYjljY0Zuc2VS?=
 =?utf-8?B?bFd3N0RCNTJjWjNwQ3k3QWNobkZ3V1lKc0tsc3VNYVlQc0swMTJqbkRvdTk3?=
 =?utf-8?B?bnZHaVUxSGN6ZTk1TlkydEhLNmVXOThDM0ltU1JXVjRlZkQzSWZ5VEp1Rncy?=
 =?utf-8?B?N1crRFpxWWs5R2FNOFI1eXk0alJEQU1RRkhUazIxdnByR2s0Qzc2eUdSRnUv?=
 =?utf-8?B?czl5bkdtYm1haGFVWVNuSGt0Ky95TnAwcU93RSt2RlZXMURFZDR1SnB4aDBG?=
 =?utf-8?B?TDJoZmpwV1BwYnc4Uy9GY2FHbC9EelFsUEVOSEpRR3hIMWkycVZKWERoS2hZ?=
 =?utf-8?B?NW9nRjBEVXpDcmJsTThoQ2JIMWxEdW5iTmNZUzk0alB1T3JiTVgxNERTWFh0?=
 =?utf-8?B?L0FrYWpxNmF5THNGRFY0SlZLSUxhdVUzZVNaRUVSKzgwMWpsUFBWU0Y2VnhR?=
 =?utf-8?B?a1hpK1hFdjFpdEM2aktSWlE1eUdON2IvVSt2OW1vQy9MN1VuWkNHRUJqVGVx?=
 =?utf-8?B?QXQ2OXhJd2dOVHRUcCs2NTdiOGZncngyZDJhNTU3Q2pRUkQ3NlZHeGlYenhP?=
 =?utf-8?B?OW40bGpEODYweWF0QmNMU1Q5RmdaaGhvdFROb1NvUFdsVzdSdnh0VDZXbm43?=
 =?utf-8?B?eW9nSmRWSi94MmZLdGRkYzlLM01NYlBrTTg0b2ZlbFdQRDRaV25OWXVibE9o?=
 =?utf-8?B?Q3o4dVVHSXVmNDdXOUh1WjFzS1J6YWRiaTY5TjFsYlpOeWYyVis0eFJOYnIy?=
 =?utf-8?B?ZWRkQ3BVNE1kWllLZXpRSnJLZ05lVjhPZEZORmpncnYyT25xQi9JZFFGUnRD?=
 =?utf-8?B?a1MzZDV6M2wwcnV6ZStkWGpyUXFmQUQxOEJuZ01DKzR4ZUFyZHpob25QN1JB?=
 =?utf-8?B?VzVKeVRnVDRyN2RKYWY2OWVSVndZVXFIbzNtYy9uTitqeGpPc2VSaDlPU283?=
 =?utf-8?B?Q0NxTVhybVJkQlY0Zk9BNC9odDhNYkl2VTVId1YzNEx2VXcycU9zaHptNzdM?=
 =?utf-8?B?b1I4OW5vdnMxaERJeEMreldJeWNDcjZ6R0k2aHlJZTVQaWMvWmYzQW9SWlh6?=
 =?utf-8?B?T3pucDVHZFJoZFVvS2s4WUN1WlJtZWJENlVYcDVrRWUyRVpyRTg2dFp0WWZw?=
 =?utf-8?B?V1ZFTFJ5YTFzYjRVOTZKekJPZVI1ajhPNjltL1dPcnEwTFdmYXh0TmVCaEE5?=
 =?utf-8?Q?5Fe1DDFJjuf2mRszElCGHB8qQvGgASgRabPBeOm?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1201MB0204.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7ca5c1d-22b7-4507-d10d-08d8e91053e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 06:46:00.6997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J66i3srzX31Z9JboHuj/1wLIy9Wj2eYusSi/bowP3NeL6WWUlf8PN/GLB4mX+RF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Andrey/Crhistian and Team,

I didn't receive the reviewer's message from maintainers on panfrost driver for several days.
Due to this patch is urgent for my current working project.
Would you please help to give some review ideas?

Many Thanks,
Jack
-----Original Message-----
From: Zhang, Jack (Jian) 
Sent: Tuesday, March 16, 2021 3:20 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Rob Herring <robh@kernel.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>; Steven Price <steven.price@arm.com>
Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak

[AMD Public Use]

Ping

-----Original Message-----
From: Zhang, Jack (Jian) 
Sent: Monday, March 15, 2021 1:24 PM
To: Jack Zhang <Jack.Zhang1@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Rob Herring <robh@kernel.org>; Tomeu Vizoso <tomeu.vizoso@collabora.com>; Steven Price <steven.price@arm.com>
Subject: RE: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak

[AMD Public Use]

Hi, Rob/Tomeu/Steven,

Would you please help to review this patch for panfrost driver?

Thanks,
Jack Zhang

-----Original Message-----
From: Jack Zhang <Jack.Zhang1@amd.com>
Sent: Monday, March 15, 2021 1:21 PM
To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Liu, Monk <Monk.Liu@amd.com>; Deng, Emily <Emily.Deng@amd.com>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Subject: [PATCH v3] drm/scheduler re-insert Bailing job to avoid memleak

re-insert Bailing jobs to avoid memory leak.

V2: move re-insert step to drm/scheduler logic
V3: add panfrost's return value for bailing jobs in case it hits the memleak issue.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 +++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    | 8 ++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c    | 4 ++--
 drivers/gpu/drm/scheduler/sched_main.c     | 8 +++++++-
 include/drm/gpu_scheduler.h                | 1 +
 5 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 79b9cc73763f..86463b0f936e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4815,8 +4815,10 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 					job ? job->base.id : -1);
 
 		/* even we skipped this reset, still need to set the job to guilty */
-		if (job)
+		if (job) {
 			drm_sched_increase_karma(&job->base);
+			r = DRM_GPU_SCHED_STAT_BAILING;
+		}
 		goto skip_recovery;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 759b34799221..41390bdacd9e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -34,6 +34,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct amdgpu_task_info ti;
 	struct amdgpu_device *adev = ring->adev;
+	int ret;
 
 	memset(&ti, 0, sizeof(struct amdgpu_task_info));
 
@@ -52,8 +53,11 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 		  ti.process_name, ti.tgid, ti.task_name, ti.pid);
 
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
-		amdgpu_device_gpu_recover(ring->adev, job);
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		ret = amdgpu_device_gpu_recover(ring->adev, job);
+		if (ret == DRM_GPU_SCHED_STAT_BAILING)
+			return DRM_GPU_SCHED_STAT_BAILING;
+		else
+			return DRM_GPU_SCHED_STAT_NOMINAL;
 	} else {
 		drm_sched_suspend_timeout(&ring->sched);
 		if (amdgpu_sriov_vf(adev))
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..e2cb4f32dae1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -444,7 +444,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	 * spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(job->done_fence))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
 		js,
@@ -456,7 +456,7 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 
 	/* Scheduler is already stopped, nothing to do. */
 	if (!panfrost_scheduler_stop(&pfdev->js->queue[js], sched_job))
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_BAILING;
 
 	/* Schedule a reset if there's no reset in progress. */
 	if (!atomic_xchg(&pfdev->reset.pending, 1)) diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 92d8de24d0a1..a44f621fb5c4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)  {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	int ret;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
@@ -331,8 +332,13 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
-		job->sched->ops->timedout_job(job);
+		ret = job->sched->ops->timedout_job(job);
 
+		if (ret == DRM_GPU_SCHED_STAT_BAILING) {
+			spin_lock(&sched->job_list_lock);
+			list_add(&job->node, &sched->ring_mirror_list);
+			spin_unlock(&sched->job_list_lock);
+		}
 		/*
 		 * Guilty job did complete and hence needs to be manually removed
 		 * See drm_sched_stop doc.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h index 4ea8606d91fe..8093ac2427ef 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -210,6 +210,7 @@ enum drm_gpu_sched_stat {
 	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
 	DRM_GPU_SCHED_STAT_NOMINAL,
 	DRM_GPU_SCHED_STAT_ENODEV,
+	DRM_GPU_SCHED_STAT_BAILING,
 };
 
 /**
--
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

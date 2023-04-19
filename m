Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37A16E710E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 04:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59010E0AD;
	Wed, 19 Apr 2023 02:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2084.outbound.protection.outlook.com [40.107.96.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C8710E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 02:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWHOvrHiGGYI8BEdkWv2XrmplfDYkekAeeG4dsB7oiKswFAccEZ7VinNYc6HwPK0TVQJ5aVsFcfS+QJe5cSGAqSzLh+iaoaJuS1rKx0v3jYGeI5NSNsco+lt23qbu5IQTVzMUMFUprg3bicwVfPo4eyOnUdEaHRFnDXeJcPs11QiRkSo9Sd28dmIi7foqiCnfQeKu+7JwfYOsiYuHxteJ1wcsFVoED8wBgUchoCCTXPOdqhZRHq3dag2DFsvnp6ocP7qm/NQYWi2b9/VUamcxNKicbxAlcqwzJSBRG8E8PybEeSPBgzlkDTeItIPvV/EtNB78ALlTTkJEDOHSJPplQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoVCC4favVBl4QAdc0nKl5ElABctBuUm777GvBvDrPI=;
 b=k3odseICZIwa7mp8fXvxcT1jSxdKn5lB6sPBtGrpm826QUQIrsjfUir/vX4mBgXfbopTMxmp0PWkBvRxe4NKLHhUAlgyyXxm9NDjE24OkPXI0CkCmqzGwLj57Abuya6WZP76UXg2vFbtohab0AKVAmBGw7KPRyrY9hYiFELnlgoqmdUeBxitGgH3F9U3gncD1GyHk12KxciZsYnOID3AcBzYtsHw4JMAFeDZ653IvOkmYtMLgmT214Qoy55dHg4rbQNeieMvG4z7GVJj4MpUbjERgYrxKGQs1u0lTUMlmxL1qaTANJkMwFzZrGSCLTYHmY1ffg8w7/iSqeVr0G1nKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoVCC4favVBl4QAdc0nKl5ElABctBuUm777GvBvDrPI=;
 b=vANHcpHKO68ekqR3XyoX/Lvqeo0r+PRfcjQ6m+OgV25oLQnZGR8RqDW1ccLh8/oh+4OEzkCNiqrhxvTcOSQs0R4sGGQswzGqTNnLv5aVRAeEtL3SWTfaH44NcuhPV5ZoCHi+0juIMqqqkaFI6rtNky4UK10H8Ftv+wUogHhhcYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SA3PR12MB8023.namprd12.prod.outlook.com (2603:10b6:806:320::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20; Wed, 19 Apr 2023 02:16:48 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 02:16:47 +0000
Message-ID: <475a9394-c9ca-b549-1d2d-d6d49b08082d@amd.com>
Date: Tue, 18 Apr 2023 22:16:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-CA
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 l.stach@pengutronix.de, christian.koenig@amd.com
References: <20230418100453.4433-1-dakr@redhat.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v2] drm/scheduler: set entity to NULL in
 drm_sched_entity_pop_job()
In-Reply-To: <20230418100453.4433-1-dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::27) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SA3PR12MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b591410-8819-47cb-15ec-08db407c20a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XYs2/OUFUq8/oZp1kVe81Y6efFwuZC1nNVvgAIAq0b1tcJYpLWghbvnfzrdc2KWiKm7Nqhzsb6a6fsqem3eyJit+cvFa+G6cAD/NyO0la5aOfBi6c9zyJltKfD67wCIZEWhAOLwXUxIbRog87To1JqO5HhJ3DHQcDAqITX9D2ffOu0Z0UvQ+HwzNFvbbtpHHnCg5YuX6TIOOsQis3c6BnbJsJ6P7Ai+aGKEsAWLDRT71ksArtp7cWV5ZMnLAyF1dH6IVtEQ7n4MgllhhgiPIS3pItLtyhV6oGZEBV1DeV07FW+V45dMa+Znqy4vOFCd0qZzxpukY4lkEFa2TeGxhsx4aPUjTGKQ04Z06WtAqFYC70ndLQhQiOIrupjeN4U7dTgLfFxzZ+e3NtVzgDGbPnEwZLz+etbLJO8m4OEQyb9uInUdcZua8A4pggLVytrwZd0pE/MKOWloPEmnjx2x3LDWyEpB8VoL11lvjGvHANmtSOtyq1Bl5Mk9aH2N8e+JZnG02Sd32K5RLuhrHTTy5FmKy/0BHWGfeyO/9hlMWkNAgknqE8tzb0PtuECTjnEuLM22xPMS9cnqUcFcthXjXn6G3sNM3WvnNE/tI3ThpbHnqcXD/cBXxi7b9hJmJFdQ2/lxlPb0teJn5rjD2j9aONA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(451199021)(31686004)(316002)(6636002)(66556008)(66476007)(66946007)(4326008)(186003)(53546011)(6506007)(6512007)(26005)(38100700002)(2616005)(83380400001)(8676002)(5660300002)(41300700001)(8936002)(6486002)(478600001)(86362001)(36756003)(31696002)(2906002)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmlqQkh3cG5Md3RyVHhKbjFMaXIwWXJGM0dGRVlBQ0lTd2RBWFo1aHhtd2h2?=
 =?utf-8?B?MmZiUUFTVXBRTlY2NUVYelFkUnQwcDlQZ2Qxei9HaU5TRmJhLy95ZkR3ZmRQ?=
 =?utf-8?B?NUJhWWNiN1hKK0d4Rzc5ZU1Eb2VTbTJkN2xudGdsTUVSSWhXb1BzcHRMNDU1?=
 =?utf-8?B?UDZ1azN3d3JQRmpPTzBGbmdTYmpCWi9pajJaOTlGd3czaUZjWFl4UCs4U1Jk?=
 =?utf-8?B?NC9rS01PSDNiZ2MzTUkxVHVlMWhUdVV5Z1hUWFRVTjBwalZUb1Yvd28zQ2pm?=
 =?utf-8?B?NHZSeEtwejN2SnFqb3FIaGllRWhtU0htVC9NbDYwK0FFVWZmZEpjTURlV1lj?=
 =?utf-8?B?cTBneWVVemZRV21UdHVOL2dwSXVpb0RUcExEV3FxQy9QdlNpUFA1NkJtbCtv?=
 =?utf-8?B?dkc0bktCUStwdE1Ndmp4amVnMVBLcWpZS3hVcDJkUnp2Q3JOdHhoa253T1Fv?=
 =?utf-8?B?M3pkMWJHRWE3SEtKRmZpU3NTZEJQNGYxczUwY255ck5nMTNHaXVUc0FINUpJ?=
 =?utf-8?B?RFRORUdRbWt6WmpVRXdBYzRMY2xoQlhjQmVMNEhMa2J0WUgzNkJuTUhoRktE?=
 =?utf-8?B?V0FVSlBldGI4Q2F6bmVPV2U5MUI5cXNSd2llZmROWjV4aHVHcno5OG9rZGRk?=
 =?utf-8?B?RlBHMGVIb3E4ZTI0TFRzL3AwRE81RGVndGY3Mzl6VVVlSll4Mm5PcmNoQ3F2?=
 =?utf-8?B?eEVJK282TFY2WW5XYmYyZ05jT25FQmVGK0hQWXFHbjZTMmJ2N2x2aERDL2R0?=
 =?utf-8?B?VitIKzk4dE54aVh3eDFhazNtUDZQZWdGK1creHRsbCt0N1Jva2FtYVdYVVVv?=
 =?utf-8?B?OC9MUjI4N0ZNOEZpWXlNdXZsTDdhakFhZU55UWFSMFZVV0djSEJLMjNRaWdz?=
 =?utf-8?B?YXp3TnVLcEU2UzhpRTlaOFNFU01JamFnUUlaRlNFZE1yYmU3VnIxNmg4RWND?=
 =?utf-8?B?cVdhTnBHSndFUU1zYkY2UHBRbEtwaHV5TjcvcVpDZlVtbUtTOHJSZ0xna2VV?=
 =?utf-8?B?aDMyOFZvQzlYOTAweE96bEtrRHJPQTZoOUh2UEdBMEFwNFpCVmRQREFhK0du?=
 =?utf-8?B?UjVzSEZHQVZTUnJ6a0p3ZkZkTkpWc0FNMkViM1ZiWGRVaWNObGpZdmQ5Z2dn?=
 =?utf-8?B?UWVxU2VvSFVSWExCSHVMM1NmUHpLZmU4L2pudU10NU9hNDMydkMwcHFnZXh1?=
 =?utf-8?B?RE9pUC9za0RoU25Pd1I5TDV3aXdibjVPR0Z4RmFCUFhwK1NSa0VmRmpSMG0z?=
 =?utf-8?B?Rm1Pb1VmZmtBaXl3dG44R1lpbGZNZW9QMlF5OVZicngvWGx4cGZTWGhGYTFH?=
 =?utf-8?B?V2lydzgxNFFPWFFONVZsQjVDU05kY1VHL3F5VE9NeHoySEtkcWZtQlBuVURF?=
 =?utf-8?B?YzE5R2RsUGtWQk5taG56a2Q4OC9OMGVKU3YvTGlmUGZHZnNtQis5K2phOHQ4?=
 =?utf-8?B?ZDBKSVpYYjdtOTVkTEg0UG1DQzhQUEdZTXptY3FaN0orZTBSWVJyTUZRMjll?=
 =?utf-8?B?Ujk0cEdCUGdmdzdjeTB1Ky9NSVM3Ni9VaGJYb2R6WW9Nem14MTJnNXlqcmxq?=
 =?utf-8?B?TWE5Zzd1b2c2UUlER0ptVmpBSlBlM1YwakhzWFlSbkFsZm45R1NrWERmWkZh?=
 =?utf-8?B?VzduTjlhS2YrMlMvNW1HZFpoWVFLT3RtOE10RkovWTlPU2thUXdtdXBZMENU?=
 =?utf-8?B?MVNlNzVOdG1sQTJhMUZvSXY3ekU1eSs3OXdOUnBhaWpHR3FqN21SNzZmZGti?=
 =?utf-8?B?WlhxN2RyZkpYd08yaitqM0pnRnA1dVRjODFyUkdUQ0MrUDYyVTFOUmZ6M1NX?=
 =?utf-8?B?Wk9ockNIRXpIQTVzL01KMy8vUGNmT0hXSmpkNFZZRC9tNXlKaDh6d0U3dFB3?=
 =?utf-8?B?dGpqNjZjQjhOMHlKYlR3aENWdTFtNjNEbGxhQVJnbklZdWtjOXFvSnhkaThN?=
 =?utf-8?B?ZzFIeC9EMDd6Z1JvU3J6MHBTcHFLYVNPZ0s0QTFjQmhnUkljQlBTZ2F5dzdY?=
 =?utf-8?B?RWVFWGJyQVQzL0V4M2hCdURqU1lxcVFkMGg2Tk9HbWFRUkNGTGtvdjBCNGFM?=
 =?utf-8?B?ekk0dWNFeHZFS2hWa2d5bEl5dVdDbDNmcWs4dTcwcEJ1eVhmQW5CQlpPOVpE?=
 =?utf-8?Q?xtIJcvVsoWiLHGIVVCWQp2XmG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b591410-8819-47cb-15ec-08db407c20a2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 02:16:47.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mvuYZOfhB8wf2goxjpShzuvmaMmKhbdennOLdaaww/QXkZ7C12CEPubSS/DJdDc2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8023
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

and applied to drm-misc-next.

Thanks!

Regards,
Luben

On 2023-04-18 06:04, Danilo Krummrich wrote:
> It already happend a few times that patches slipped through which
> implemented access to an entity through a job that was already removed
> from the entities queue. Since jobs and entities might have different
> lifecycles, this can potentially cause UAF bugs.
> 
> In order to make it obvious that a jobs entity pointer shouldn't be
> accessed after drm_sched_entity_pop_job() was called successfully, set
> the jobs entity pointer to NULL once the job is removed from the entity
> queue.
> 
> Moreover, debugging a potential NULL pointer dereference is way easier
> than potentially corrupted memory through a UAF.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 6 ++++++
>  drivers/gpu/drm/scheduler/sched_main.c   | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..a9c6118e534b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -448,6 +448,12 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  			drm_sched_rq_update_fifo(entity, next->submit_ts);
>  	}
>  
> +	/* Jobs and entities might have different lifecycles. Since we're
> +	 * removing the job from the entities queue, set the jobs entity pointer
> +	 * to NULL to prevent any future access of the entity through this job.
> +	 */
> +	sched_job->entity = NULL;
> +
>  	return sched_job;
>  }
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 9b16480686f6..e89a3e469cd5 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -42,6 +42,10 @@
>   *    the hardware.
>   *
>   * The jobs in a entity are always scheduled in the order that they were pushed.
> + *
> + * Note that once a job was taken from the entities queue and pushed to the
> + * hardware, i.e. the pending queue, the entity must not be referenced anymore
> + * through the jobs entity pointer.
>   */
>  
>  #include <linux/kthread.h>


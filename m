Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74475979B2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 00:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7989DA1D0F;
	Wed, 17 Aug 2022 22:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA4C1129D3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 22:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYZJotm0KJ5IQNZJ0YGoeALXoVJpNJduilrvN3KzpiTjAi1NJBHR5i8KEFBByOLVjBWvtCDBwguMHv/dwJRIv+ZPKAVqbQY8hs7Z/TrdRTIzBtFFyR5D2Xc+v6H6wQ7i9mKVVd5SBw2X1rKDukbotfzd7Q5QEQNwXLc6Y9/Aws5pzj/9275ID8XqXpw0wXOVN/frmtm2joFsRbEt2LDzNlK78vbMOaQke2KqcAOLT6sB+WU2BKM/Pfr4YsBT1zk+hoQf0eziQ2/kP2ur1P7Vdi1Lr2wQRJDX56CXdnQCGbWs2zntx4N+i5ogNOxI+LQ5cxpSFQH62wzP6Yfu453OLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P23Hf79q/lDw387kQmvBgl3it3lHU2yH5TO+YBLbrHw=;
 b=FFxK9tgyz1HFBX+NaUrHhczY5nPQyKA26+q1PbYRCeU2eLKGLBdflMfPhqVvJRx4LkYD0Z0qg2DD7G1MFB6xEZmkb7eYPPUO2FmuIr0gUAREh80vPWAhsAMJT3djp7WMxZBz41Ml2l9XjyIvKGdu0rSflm8ojfrFLtTykaWd1skukRiB/Jh9G2RkzaS/qzh/QxLwlXkkkvOB7kKXTXnEdzBQKRSguS3jjtpLW3EMLKsQlfFseivjKI1kAnMcyO+b3YtWwotSfnyOoDCOhGMZA4Pp0OQnSPvXz1v7OBXnmgS2UUPOKnnUlPvfxt9vlwmF8DGzaRoHWOYuP3O6fp7V+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P23Hf79q/lDw387kQmvBgl3it3lHU2yH5TO+YBLbrHw=;
 b=fMkVKwDKiq9fuxvItosLhzKogEv5ZhaRc+qAVlkIaBhmzE8fAsOBx0wmEBGxuVoo7smlfz/WT8nl6yXmh409OhFAfblXVwB1gYIJXwbI/G/HTY9Jl7yRsb3IwTZr0iiC5Mh1p/FMK7Oc0TWzHaAnBZUwFM0oYEsIClN5e/E/+tc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN6PR1201MB2545.namprd12.prod.outlook.com (2603:10b6:404:b1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Wed, 17 Aug
 2022 22:31:23 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::406d:afb5:d2d7:8115%5]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 22:31:23 +0000
Message-ID: <e87dac11-a4fc-82b8-017e-2ae4e429d57d@amd.com>
Date: Wed, 17 Aug 2022 18:31:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/1] kfd: fixed memleak about release topology
Content-Language: en-US
To: "ZhiJie.zhang" <botton_zhang@163.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Xinhui.Pan@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com
References: <20220715080721.1477324-1-botton_zhang@163.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220715080721.1477324-1-botton_zhang@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0275.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 157949c9-1f3d-4520-3ed4-08da80a036c6
X-MS-TrafficTypeDiagnostic: BN6PR1201MB2545:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExHrrp9U1BcS6emObHBQ/vGY+LUCprO7hqDvKtFuZUNYpJZLti3oyUqx9nsvZu165pudBb+VFmY2Ez9u36H0+2fvQ6HsSbOLww3EbHUy5pwbfxg9dsNa7GB3H9sXSZWn92HpZ4jQlUT0/wEyHlcyOVYmSZwyZfF19YtSXjvdFz2Fc3CvCmugb2l29+MZFEVrNmvt/3OUleRsS9wf+OciC6rpVSME6r/AY5TBdgAxeu3s6ASaUq+LSA6H3nYmP4SilhdVpYXUEz5CaqQ4Uo45Y3lCrWLBT8dPkgbsRHdL/AEtAOPvc1j78kPi9A1oRIz7JS1M7SFbL/k9AINZj6IPFkBLaykZKIZYYrN3e59gs9xtjsQ4lWjQfpFim0ifhRTdkzfbNWTYz8GWlcJWacoupAZVzA6O4y+S3w9qUbkdY/0qq0hndw5XJTDx77r9XVPAazEE4YjFDnnZSku/yE/2OLDrc7Zn7JuYp64GJUkLPgP2+1sFwo4Tf3QcAl6k19CJtBTBibGzrw2RwQH+vSwjAhdf0r6zqVGyi76cRx13nRyUCbOuVS8DT7gHi2yhFIHj548nxgCWBRWgZeE8kbe9K3fm9f3i+EBqsbn7W+T6kSCSuBKmP/kV5619nshDCQ7GiC/Cz1sXu2XCTKIEqy6XVEzbFGpXHGTjovyxnWJtCgiaZM3rGBDVoaMvHJH+N7+fPbEqNCjfinnHmDMZiJeEy7+yUQc7cHh28lAfoyozgUV63dL+cPQEsclc+2sDNB8yRUfsDsd3of9LhwslPtHStFNkZrLHRRI6jELXW6mGsS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(2616005)(186003)(316002)(31686004)(6636002)(6512007)(26005)(6506007)(41300700001)(6666004)(44832011)(36756003)(2906002)(8936002)(66946007)(66556008)(8676002)(110136005)(86362001)(5660300002)(66476007)(31696002)(478600001)(38100700002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THNjcm9NY1NNM1Y1c09nTzlVeVJnZFN4bDBHdDF3VFo1UTN5MTJvaU94cE9Z?=
 =?utf-8?B?N0RkSHYyaThHSzFpVVVKRHFZRlVUVUtmWHJIcE1CalZHKzZiNWxVbTZnMGEw?=
 =?utf-8?B?RktqZXlrYkZ0WDRtL2NDa3d4aTVrSUNGWUFWSDBGckhyQTZFWDFnYlRXeGVi?=
 =?utf-8?B?dy9XejdjL0Exd3pCRUhKYUFtcWUyd3ZpUjRlTWxOeXdaalRuN2J5NWdmK3FB?=
 =?utf-8?B?WnZhRFZHbWpBRS80ak9nNlU4a2R2OFNtaDdCdTlKYXdBV3VyMXpwZ3VxNjdI?=
 =?utf-8?B?dVRUZnlKYlR6TDZQcmYwTmd2dUdncjhDeXdBRUZ6TVF1VFpTUE9UN01LQ2dQ?=
 =?utf-8?B?cG1yaEcvTUIxeUFMeGtiK0xzc3R6MDNrMXZCeW03ODRuQ3VlSXBBNlQ3L1hQ?=
 =?utf-8?B?cjN6UVRTSnk1bm41dnV3SnBJZVpiVnFvWmoyVEN1Ykh2Q1FxT2E2ZS94UXNZ?=
 =?utf-8?B?WkJ0dmM5NTh2QWJXVm9iT2RYeDVvczJsaUdXelp4blExc3loWEJKc05qTUpE?=
 =?utf-8?B?QUpCODFhcElZQ3ViTlRPUmEwdWh5SC9MdHNZcTk1Z0xQVnROWCthNjRIVmZr?=
 =?utf-8?B?MW5hdTdFSHJMTDJ6QnBhMGs3d2xDdGdUMmZMbGN4Qlk5NnAwcHpXeXp2bmhh?=
 =?utf-8?B?UUlkOFdUWkdpS2ZjZ3ZMSnp0Njg1QllwS05PSTFKR3ZrdFlPaCtsemUyYTRN?=
 =?utf-8?B?djdRMlF3cTlYaklESWpGL3VLQSt4d1FBWmErMXpOOWdMaDZDSi9TTC9NdVFl?=
 =?utf-8?B?VzNLTCszYXYzenllOXQ2dy9jT2k2YVp6N3VScG9SSlFTY1IvUGFyK245UXhs?=
 =?utf-8?B?Z2pqZFQ1djZCUkZkM2w4dUJhOXcxdnA0enNHZ1QzMmxVR053T1hKTW41bzgr?=
 =?utf-8?B?aDBaMTJVL3o4TlFudEJ6c0JZQlo5OWNjUm5MYUJsemZEVENWdGk0cHRBSXg1?=
 =?utf-8?B?d2U3U2lweHJSTnh5R0xNS1BKUkFDalBJOFZtd0lDVExSRnJ4eWx0MmNyR0lP?=
 =?utf-8?B?cklKOWh3ZW94RnFtQ2V3THAxNzB3cWtxZzlRY1IrV216ZDVWdkY5UkZ3QkNG?=
 =?utf-8?B?eGROUGJubkNLcnhpZ3BWcEZNUG9NOWdvOGR0SFd6MGlnNUI1VWF4SFVSK2dV?=
 =?utf-8?B?WHVBQ0ZkZE9GK2xpMEthQUpYcDlkSXdxY0hXeDBFc2tTMy80Ni90UnI1N2hW?=
 =?utf-8?B?c0RuclJyeDAvZTVUU2Z2M0FKKzFVMmN1ekVHK05aM3pocWFqRkZjbGJVMHFl?=
 =?utf-8?B?QVM5TElBeUI0eEJmN3EzZElFVnNmYmNUYXdZWjJWRFV3VnhNUVNJalg2THZT?=
 =?utf-8?B?cXdFcE9GTllMQTU1ckhaY0lDYVU3UDdvcHFlWmZKWFFaY3NrR3RsaHgweXR1?=
 =?utf-8?B?cFYyRzVsVjZTSE1lQjhZcFhqdjlMNnJHVHNVc2tnbXVFc3pKQkx0SkozRWh3?=
 =?utf-8?B?SytOUTJoQUFUSmIyZnJOcklRYWcyYlhTaDlmVldGOW5HZ1dkY3JMRUJMam0v?=
 =?utf-8?B?cUFtMUFSZHd6R2J2THFCQlRsbGNJcTkvTWRzRFVSeGc0ZTlrNkFXTitnNk9u?=
 =?utf-8?B?dGxNUW40bHRPWmxyWDQ3dmtjVFVzeDFFMGpzTnYxV281aTNZNnVwWlhjS3Zr?=
 =?utf-8?B?bG5HWjFOZENnWkpWVkFJcEVrTWliYnhVWHNZN21LM2YvQVRFaEx5ckpPZndC?=
 =?utf-8?B?Y1ZyNVY3ZEdJbll5RWNIWlg2LzRyYWJNdWZXcEI5cG91Y2RSeUVtRis4NGlF?=
 =?utf-8?B?UlNNZzRJN1FFTm0wZWo3TEo4YldxK1hNYnhDdkRKbVBBTXB1Y1JoRUY5Zkky?=
 =?utf-8?B?a0VYeWVEOFlleVdyYkZteGFWNWpteVlGUHIweHArY2RLQS9GYVByZjlkNlAx?=
 =?utf-8?B?cUFZRjRGdnJSTFhyV2RQR040cVVOOHVxa3VYK0dzK1U2ckduZDNHU25RbnVZ?=
 =?utf-8?B?ZE5ZcW92VUhwSEJPWDgxckRNNUhOb2R0aU54UDl0azBZLzNpR1hVbzlBM25T?=
 =?utf-8?B?c1B5dFZtNmpidkVrdEdxcmFrZnk0eUhtRXZBSGZsY1o0U0hxZmwyN3JwQTJk?=
 =?utf-8?B?SlFtMzRpbWwwbDRTNlBsaG1LcjlGV0JoTjRRbVhVZDMwLy9wRVBYczlTL3A0?=
 =?utf-8?Q?tvtDqgXe+jma3oY1rHVc/nMu+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157949c9-1f3d-4520-3ed4-08da80a036c6
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 22:31:23.0942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBssXXMnh/oNjvWhaZUfy3RaC7uBL6JtQZfvfDVAowVcY5MSKl2FNsBbZqCCrnoeyy2f8dODMqzuzPtY6dhLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB2545
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

Am 2022-07-15 um 04:07 schrieb ZhiJie.zhang:
> memleak will happend that reload module due to ignore kfree when release topology
>
> Signed-off-by: ZhiJie.zhang <botton_zhang@163.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> index 8d50d207cf66..8b86f56bd50c 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
> @@ -872,6 +872,7 @@ static void kfd_topology_release_sysfs(void)
>   		}
>   		kobject_del(sys_props.kobj_topology);
>   		kobject_put(sys_props.kobj_topology);
> +		kfree(sys_props.kobj_topology);

Sorry for the late response. This looks incorrect. kobjects are 
reference counted. The underlying memory should be freed by a callback 
when the reference count reaches 0 in kobject_put. Freeing the object 
here explicitly would lead to a double-free.

The callback in this case is kfd_topology_kobj_release, which calls 
kfree. Am I missing anything?

Regards,
   Felix


>   		sys_props.kobj_topology = NULL;
>   	}
>   }

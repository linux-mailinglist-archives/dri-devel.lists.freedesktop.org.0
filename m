Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 376B962FE9D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 21:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E9510E7C2;
	Fri, 18 Nov 2022 20:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBD910E7C0;
 Fri, 18 Nov 2022 20:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVeNucwssZGfzY3+AZZ0zeTkjwuviNhS6BHJKZxC9kLqjsTXhsw1vq7Tv8fnLamB14+LIqodgqBRU4pemjXAzZxKSMaqnCwrdR8w+j3TLcAF53BvfrG9RRgpj3SHTu9HEKsre4cBuuS3ciTAPTbpWfjLybUfxRoaYgf2VCTXHbRlgQjMokBXptmYRj1kZd1eXUT1NBaSMushIjIvSLEomzR0ToiknT9/NylqfuFPLojIDkgFdbouAbDy4FvRKtait5l8bElWsHSSScZoAcynVuCVj8u0IVsaJ1UExHleR4Y3QQ4JSrIDzgoVwMr1m/pZwqZDbB8zdMVkO/lrSHnJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFJB86B9ZBYA7ZjpupTspgY4fsa6DOadxe9kGeokKPs=;
 b=WWfESxSRfcC1eBWxYnQNPu4KKa8RTnPy8K67CopDir5P0gX/Bu7/24pYA6rTiHlIVRZ8rF5oOZBW8sRrGHcy6al9y5FEz6/2hAii1UbAtJdoqXp4nIv05mJWm9YHKkRyR5T3z3C/ASfCkk/rDaEpT+7NByE3rMIiFX76lc7bK/d9pIa9W8qRtYwEsWawKhvBF6eqZL8Z3n1gtFZq07VHd9kTESxeQ7vP4cciC67txH2m19sN/e50gxPZ1BKtz7zkSVV3ScOwui3ebhCFkoZ96ceyMuUCFsK4IcL4pa+aTk+juN+nFTN9rtMYW07bFnUIbF79y6j+JO90hf71l782Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFJB86B9ZBYA7ZjpupTspgY4fsa6DOadxe9kGeokKPs=;
 b=rnMddoYJTBU18KeAQ1NF+cuky8EZdsig1kd1dVLvckHDBWmga4pV+GiQ2Mbfsc2F4YSOp4ae8AxMSMFpMy1THHqGZ8ugXBbESYt7p9Sda9+t5DAu1sJLdRyMnezAlLz+Oaaml9s0x40uhV4MbrntfgWp0CmjRzKKFTPzAS/j3L8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB7646.namprd12.prod.outlook.com (2603:10b6:8:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Fri, 18 Nov
 2022 20:03:27 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%8]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 20:03:27 +0000
Message-ID: <b7c8a41d-6657-2646-4f18-ed13293369b2@amd.com>
Date: Fri, 18 Nov 2022 15:03:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu/dm/mst: Fix uninitialized var in
 pre_compute_mst_dsc_configs_for_state()
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, amd-gfx@lists.freedesktop.org
References: <20221118195406.95779-1-lyude@redhat.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20221118195406.95779-1-lyude@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d4::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 119e1b1b-f5e7-4297-34fc-08dac99ff49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EJAZtF5RwLoKJYyyNcMIBSqRWkTr4sKRRJcq5nHAMziusci/e2VLR7RykeH9bA6DmDN0v8hbU9TkSQq9PL68W+zvAMSyCAB1USiBV6HDm7brtypd3Q3UvJguctp5BItSmwjUOl26om3OFWBA5adnHUikA9Gt3W2OleosNA9IFwzbg/BOxjAy9C9tVtVQ7k6IMSaJZht3Eib40UnwEWSLjrW22I3PYTUj92eOWMq/P7iGY87HaQERByWn8ACATlTeOystAVNIPpIa1tdLru4kRDOdYSTvGWeLngXfWv6j5HAIfDX0vBcrytaqCYKRnxi8ehgUSy9tdtYO5nMbQxrM5+1pk2rSFk6w+oytbn1uD6Yh3WmIG952fqxCidsXQQrNZdA6OQqR0Iw2aKypAuQWuElXKXrNyqOvJIbDlYv2/G5XDHHRMLO437JXX5cZX3C1ZqHBAOMK5w5KWaitz5QUzdBLjoFcthkn2K1aXgNF8VqOksAPNomiV/mbcIBQMFG5UsScvIkfUWq2jGOT29fypuvUfzYDjikpurD481WfM+shk+FaAkdfMTiUoEox0dciyeanQ7usvRQZZutjxLbS6jCTWmtQ8W6U+FTOtZ3tDQGSbf1jBc9kQQaiZCFKqdESaPA0PdGEesLFTiDj7ApGENxcU8eZIdvxqSJ6ye/nz0FQrMKR/Pl8A7/zZ11XQBToQ8LvHkzXZZBXeYLFwGcMClAbgBxDT9fbATWY6ILSs7U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199015)(31686004)(36756003)(38100700002)(66476007)(2906002)(41300700001)(44832011)(4744005)(83380400001)(86362001)(66946007)(31696002)(6512007)(4326008)(186003)(26005)(316002)(6486002)(8676002)(54906003)(5660300002)(8936002)(66556008)(2616005)(478600001)(6506007)(53546011)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azhzWm1KM25CeFZ1N25jMkFLSXVMZ3VWWjhRb3M1MnFzMTFobERMOTBDbS9L?=
 =?utf-8?B?ZTlmMERYelVuNjBzY2JxNEllKzh6ZTZ0MWtZOWF2Mzg3WlVkemE3SWVvUDNz?=
 =?utf-8?B?MW1aeVovRGVMTHROdy9uUUtEYWdoVzBZVTN1TnBhc3h2NzlxUFpaakt3RENq?=
 =?utf-8?B?b0dTNTFYRENHSkVuR2M4Q1d3amRSWm44UHVFNCtMNTN6dGhqUVJFd0pHRjhS?=
 =?utf-8?B?ckFWeDZia3dCT0Q2VFJGdE44VnN0QkZyVjhzWlVlUUw3SWpiZ3V1QktlNXRO?=
 =?utf-8?B?U3FSbGV2eGV3YlJPc0VTa3hIOENzMjhUZ0IrSG82N3Z4SHZWSjNSV25zM3FK?=
 =?utf-8?B?NmNZM1dmMjYwZmtEUTMzZjhXWGg1WEZiUEpMcTZNcmxBQXlRVEZidFFJNkYv?=
 =?utf-8?B?a0pWRXFWajVsTUZac2h1c2NTN01Fb0Z3QTZ2a2xoVXg5N0d6Z2RTVGZiQzBz?=
 =?utf-8?B?SEMrQkFXb0VpT0NFaGpOcnZxQ3RsSDE4Q3ZteElUNDZYSVV3OUpraFZ2VDRn?=
 =?utf-8?B?aHUrU1QycGgwdmpXbzRoYTlmMmVtUFdCc29qNXd1NzZ6VFIrKzk2NG1YNUJq?=
 =?utf-8?B?U3g5NWsrQzZiT2tJUWRSSUdVMGFYZHNnQXpFM1h3SGdqQXp2ckZYbEdWbC93?=
 =?utf-8?B?SGoySWhkRDJQVGF4RUwraFJjdG80OXBwcThydDRZQlcwOEtjd1IzcS83V1Q0?=
 =?utf-8?B?cmZMY09NeEdmaE1CS2dteTlhVHVTaDI0S2xjR3IzS0IzNzZNRkdsSk9HcXh0?=
 =?utf-8?B?Z3VXbjdWdjRnblFBR0paa3RWQ3E5NUdoY1llQnh6bUsxYTN3azNyK3R4b0J6?=
 =?utf-8?B?U0ovNXVqWmlGc1RmVWxMTExaeC9zclovRmZ3cUxTTW9MVXdNY015dlIwWFdM?=
 =?utf-8?B?VkV6UDdIUmxMWk9ENUJzK0lDRTV0OTlYWE5zSDVpRTZmRDR2bzY4U28wczg3?=
 =?utf-8?B?Z29rU1RudVlUNXV3QWkwNUxXZ0hVWDJvb1hmUndpckZtWDJQZkZKRnptWDVH?=
 =?utf-8?B?ME51by9XWXZXbEZheW0zbmZZU0wwOFJ3dHArN3RqVzRBaHI2eURtL2tjTlhj?=
 =?utf-8?B?a29INnhPeHkzL3F3VG5RL3pDWk5jTzZqY2I1cDRsbWJvWlJ3aUdKSVpKTTlI?=
 =?utf-8?B?NTg2MDlDVzNyMDVCS3VDQUNJbmVSbERnaEp1eWFYOWVBa21ObXZhamVvUGVv?=
 =?utf-8?B?N2FwVENCYkdac2tBc3JOalVlbDhRWklLMnFoUEphVzI2ZitCcUNyc3AxNkdP?=
 =?utf-8?B?Yk8zeWpNTnp5ZzdLWFFCR2l0S2JEc2xreHZ6dWlRSlF1ZTlGMFBkcEtwYld4?=
 =?utf-8?B?ejlPNVh1anF3Z2VKamtvanpvU2tqSkFxYnlrZ080UlVHYS84dTJxait5YWIz?=
 =?utf-8?B?T08yOEVvc1UrS0dQOGxFUFJCZUpwSmo0M3RvTGRtdGttbm00WXcvd0tNQVRB?=
 =?utf-8?B?bnhJODNvNkNRZHRaQzk1Nm1xOVlyZTJiQUhOclRJRkE3OUdiVm9QT2lFNTZk?=
 =?utf-8?B?amtPRmp4SU5HU2sraG5rNzdSMXphampXS0JJTlVuOVV1MWlyMTJDRG5QRnRN?=
 =?utf-8?B?ZHhkMkhLak9ONlA3UDF1UFFDTUcyeDRzSEk5eTVGc3g1UzZNVklHM0hPR1l5?=
 =?utf-8?B?RmZQUHBCWWdjdHp1U0xBemJwUHlLYXNNckxPVmpCbm9oNXF2ZHpQMlZsUDZj?=
 =?utf-8?B?cjB1UDhRZ0lXb1lPd1djU3VSd1Y1NEFBKzdpWWdNNGtTUzJFOFh0ZTkzMEpN?=
 =?utf-8?B?UXZtdEFERTlxajBKUng5aVhuUFd2TCtzbWJwdlgwa0RoY2JzTGozbnJiRG9K?=
 =?utf-8?B?YzlwTThjWUdGbWt6cUNjaWs3NHlSWDJxWm9rL3VxMDExamZUTDB2Vmk3MkFP?=
 =?utf-8?B?OUVsQjBnS0ZLVFpTUFBQRnVtUVB0Z2dDdnMvTnEvK0lubjI5OWh5bDkyYnFV?=
 =?utf-8?B?SFI1RGVxQmJjK05CVDdtalZZblhpUDFoTktXVUwrS3lLOHFNUUQ5NXBra2o2?=
 =?utf-8?B?czdpeXhNZFdKUXJyOEJYYWpOenRLbnRpQTZsNXRJRjZPUGV1bHJqNDJIVUZ5?=
 =?utf-8?B?cHJZUzFZdDRKQWJ2a2diZ00reWxYQ3hLalNFOTExQ1NZSFBCamR1N3dYTmlJ?=
 =?utf-8?Q?cTfTEo2B59iZi8958LEulI/L3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 119e1b1b-f5e7-4297-34fc-08dac99ff49e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 20:03:26.9681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: js73RyAuHeH7vb5kjK7+7Q9Oe7VZ5tUXvf1vOs21pAIHefiVcNWmiE9ZNGbHWfFUmCduoFlQq3GSu69tpho76w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7646
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <Roman.Li@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 14:54, Lyude Paul wrote:
> Coverity noticed this one, so let's fix it.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 59648f5ffb59..6483ba266893 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1180,7 +1180,7 @@ static int pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
>  	struct amdgpu_dm_connector *aconnector;
>  	struct drm_dp_mst_topology_mgr *mst_mgr;
>  	int link_vars_start_index = 0;
> -	int ret;
> +	int ret = 0;
>  
>  	for (i = 0; i < dc_state->stream_count; i++)
>  		computed_streams[i] = false;


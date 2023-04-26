Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A46EFC16
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4AE10E346;
	Wed, 26 Apr 2023 20:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2410E112;
 Wed, 26 Apr 2023 20:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhbpX7WZfPX+T6FcnDI8DT8w7K28gdbppFlTPvk9tIGYM9eTA4hrgj9kFqiEMAvGjVUQ1RUzf9aUHHsUj2+bEii+llgyIt6ymjC0xVFZEO1tG3PKXcgIRPUZi12l0rNbCP9xAzxjeQmrwuBg3QWfkrcLf5hCeSvKEWijhCsgdZC4w4WHObDQEljnuyJZjwP7sZzoKbJKNTTxxoeie8WkB277NRIGR+h2Nq4Q2yAy/RkqSRdu8snPcemB7GvuXgXsVMn5s0cpIcFvHenB1iQXjHOAsnXA81nX+MGDPrmz4Fqc0hRwfCluBdeuocwxPgzTY+Aqjn4o+v/8HUP2SaFQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytnckJev5Png+ZVHUHHseNg29Ob08ZtCU7n1HmB6PUI=;
 b=Tv9rt+buk+uuZc9Zw4dHg0iI51HmbNqbW1pzphP5a7CTF4EJUkEY34sRuzPjGXh2bSjnbRZ/Rb/EHq/CVZpPLQmgorJgC83q8pTe8BaTmcPb479Prg8EvcSXTV1zjdsTY4uoGWCtzQnlDWbjYkg2nswF0zZMw6pyfJhNBunPBtYWLajELMLbAY5AOzPeV37sEqoL+ahXxl7lh2MPsxQRreIJ7MCpLpxU3WMGDSAc63Cu4sy+2TBy8NDQd654ploQB++epK8l990CaoWtnZvhA9KMbZJyKEnLnXkK5ceNaOf0K2tL30MUcqudXT3Dx1vNpoLx90HYWZ6eIXLlfGGvOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytnckJev5Png+ZVHUHHseNg29Ob08ZtCU7n1HmB6PUI=;
 b=cSVzxalFpqEhR0aSLhXc7JXKAoFuQauRu14js6Oj6R7jNYCGm5iRc+upWl4QYZguGPC1ANPeVrM/PdvAB9ZgLaGEmTcXZ6X/72S5+bpHDrP3f0cNUbOg4c3ULAWApPahYAuPZ19x0RXbTRUFxqYTncZ7oxejDFrHmUNnZ9e00Rk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 20:58:22 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 20:58:22 +0000
Message-ID: <57a7ccb9-ff94-22ad-9b66-235b42228c7f@amd.com>
Date: Wed, 26 Apr 2023 16:59:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH next] drm/amd/display: Fix possible NULL dereference in
 dc_dmub_srv_cmd_run_list()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
References: <20230426192413.143971-1-harshit.m.mogalapalli@oracle.com>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230426192413.143971-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:111::16) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 39900507-8129-48cd-8407-08db4698f833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7kNs6QSA/nU5GNWuAcgJaiXPRSyRn2euHuujp87I46bDcZkCE87aMPMtzz8VerA6DcpFcAFA3kID6yDZq5NsQov7r/pYqIBEvyOaL7R6aXz/5oV1ifwaSDORKa+cxQ6YgcoIjAXewhDEzgvPZb+LQxbBI3Q6fT91crTodd9yz7zgxuC9KTv5eaJ/kf2YuX+gKK+GJaAe0OcUZa/QRL+SWhWh2yThVYUaaUA+ZFD1H5J98K1z9pVxg0kYCVvfWDLtJupeJsOakW+yYDGeAUfZRbyJey/qGJ6cgHC6c1nUXPKOstfipULMqiWIUs9clvUcb4fQNasFwoijz2vUlCYYVARAY0S7focizxDplKURxt42mjMQKnjNrg6bx8Zr4pfq0ejiMo5Vkm2CTCytZ6G2ESUCzP/6xWqunnn8xHdTKZ8+7/emVDInlHZN1acs1iFAHxkLK0MJDQmuVcPMyqcJd0IedjaigozfZwuGgL153yxgvK99Fl2tMTM5Wih08RrlzsOTwZ7at8huyl1/WmvaspruXh8/pXYH+4C6/DO2BfEWMwOFARqBLMqlVhWYh3An3t6UrQQfCK/UJqENwyJW1hU5d+jhzLmU6KhuVI5mNjeqCKv/WxPstnEjIMVQ3RzNHeF69sZ0PYBKp79BkPpy5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(36756003)(8936002)(8676002)(54906003)(478600001)(66946007)(66476007)(6916009)(4326008)(66556008)(44832011)(41300700001)(316002)(38100700002)(2906002)(186003)(86362001)(5660300002)(2616005)(6506007)(26005)(31686004)(6512007)(53546011)(31696002)(6666004)(6486002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmR5NVZPRHhXcnEvUTVheFZGUFhONVk1M0p5NFB4Z0V4cHYxdHF0MWlKWVls?=
 =?utf-8?B?ZTZ4emQ3d3QwK0ZyYjFHbUdnNlBkRnNIQlZlK2QxNTM1ZzZDZnhkeGN4VkU3?=
 =?utf-8?B?VFp0Q3hxNzNPdFdYaHlPQnlKZ2FXYTNXcmZLdC91Y1lwcjBBb3YyOTZrL2pO?=
 =?utf-8?B?SDB5bnpQZFZrY255Z1o1QThCWFFLdklObUpTb3AwRXJXRGJwc0JIQ0c3MHhV?=
 =?utf-8?B?VERYaUhkV0dUNlpBNUd1SHRNR0d1UzdtV3NacWdPNFhDSENMYXE1Q0VjL1pt?=
 =?utf-8?B?YU51WEh1a0xXaGpzcDhvdytNajZOMGJlWnprZU5KblNKdGdIWlhtR0pOQTF3?=
 =?utf-8?B?T0E4SHVuQUVSTG9ybUF6UE5qdlJzQ0ExcGt5TlcvdEp4OUlqMVJXdkhMZUEz?=
 =?utf-8?B?Ulk0d1c5Z3NqTkd2ai8zTFplRDlUaThaSWZXN1lhendNcDJsQVZZSUFZVmQ2?=
 =?utf-8?B?b3RFcXQrL2JFaUlyVjNzQ1hnc013Qm0xQW56OVNBZ2NRb0s0akxXL2JYWjlL?=
 =?utf-8?B?MzJWWFY3OWRLOHBrZG1qakluYmxab2tVc1EyV25Tc2JQZmFKNlNnUnVRWDRN?=
 =?utf-8?B?MldsMVJkVFh4N1R4eHRaclhOSDdHL3g3WVVIaTlkZmxIeWh1SXJ2Rng2djBS?=
 =?utf-8?B?Sm05V1llTXIrYTlSWWpjd2Z3Ujh0c2ZERGJLdVQxS0xVM2FsMkZMeFpjYnFu?=
 =?utf-8?B?YmtkWGgwa0xGdW5EUGpWbkRLMFFWcmtqdmtJM0ErdVhyeE83SVZLSGpqcDZ3?=
 =?utf-8?B?bCsvYnlrZ0xtMy94WkhYVUhuVHRXb3FMdU5KUzNGS2hCbXphMVA3WVc0WER6?=
 =?utf-8?B?czc3VDlHNENPYllsblpHL0c3a0g4NE1ZSGpLVExQSnV4UnQySEI0SnAyRC8v?=
 =?utf-8?B?SVNFNVZidHNnRlFiVURBa0R4UTNnVXFaR244M2dVUTN6THNaMHp5dlAzWWRN?=
 =?utf-8?B?cEN4b0FEZmJQcHJuYVV6WGpnUmo2d1d4SUlsN2pPZ1lwTHdXQ2x2T200bUZM?=
 =?utf-8?B?ZzZDY3dPRmxyd2xCeFhVUUNlRlpXdC8yd3VFZDRVdmw5M29GT3VZd01CajE1?=
 =?utf-8?B?QkFGNHpwR3hWZVlGWkJHdGxKTHN0U1NOYWZyU1lRQi9DVkZ4ZWFaU1NOQ2dG?=
 =?utf-8?B?dHBHUlE2NUxhUlc2VVlOdGU1OXRCUHRrYnJEMlhma0cxMEUyMW5DWVE0RFBR?=
 =?utf-8?B?YmRBcitkYmNzSDI1cHdoT2daZnFGNDFUR1dFSVJmNGdINk84Mkp6L3pHY3l1?=
 =?utf-8?B?R1ZicjlYQ2RWMGw3RWgvWVJ5cW41ajdsVVdldERMdldVbGxZT3ZjTlQ3eTU4?=
 =?utf-8?B?enYyZHhJdUVTb1ZibnJqbEFMcU96MWxyVWRmem1LKzF1SzJiVjA5UGloSnBB?=
 =?utf-8?B?MlFmM2lQcTRhQlVkVFEvdVV2SXFrYUpNSDZPTVpwcE00ck0yWm1uUFdrQTdx?=
 =?utf-8?B?UmJaMGVIbXhUeVhqblhKbGVjc0FoclF6S3I0NXltWGROS0YyaFczeEE2emtC?=
 =?utf-8?B?S0Q3NGk0S0J0VlFPamZOUXJvK1lRTzRxUmdrYzFYVXpBUXlkeUFkZThVWG9a?=
 =?utf-8?B?aFJERXVDemdsS25OUDA4SVVZdTI4MGorSnNHT2JVS1R2Tm9IZGhETDc0V1NW?=
 =?utf-8?B?c1BpY01vZjlzd3ZXV2dEMXN0Z1VteTVGK2NxZFozYkRzODFVa1p3ZkJnalgv?=
 =?utf-8?B?WURnUnBXYk5MNnkvcGpZMFYvN3NhVGp6THN2ZDc0ZmVHOUd3V3ViMXYrTUF6?=
 =?utf-8?B?amNUR3hFQWY4QmdsWWNhWlRNbmcxQU1QV2ttcU9lYmJvTjZxTEE2dHdaK2Ux?=
 =?utf-8?B?V2FjUVE3d0oxeUJZQUhIQlYveGloRnM3T0w5REZ6bkJ0UXRIT1hULzZEVkdm?=
 =?utf-8?B?VUJDOGtJd0Mrb1BYL2VvTDc4dWJnSlp4cXVIRnZxbFp0TDMvRXduNU8zaUFU?=
 =?utf-8?B?UXFId0c4U3FaZ2RYbFhXZ0FLTytkU1VHV0VCeVd1K0FXNU5uUUUyVzg4MlJj?=
 =?utf-8?B?YmovQ0syVStFZUxtWlJOaEpHL0ZUK2c5VFJXL3RaREdBTlpwb3dFUVRzWGJ1?=
 =?utf-8?B?R0h1Smc0T3B6ZGxYeHRYbGZxTDN5VVd0R0hVMTFBVGNxVHdxWHZUeVMzaW1o?=
 =?utf-8?Q?eCI85Lzy0ifc0ASY2szBapJ+Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39900507-8129-48cd-8407-08db4698f833
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:58:21.8872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcVuYa7r1cKQS+rGlhd0ZzpTewbyN+QEEXWq35NkcDBK59LbzE1s/7N7/A0f3Qa4oAIMu/pcrqXUZMSfLCs6fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962
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
Cc: error27@gmail.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Max Tseng <Max.Tseng@amd.com>,
 Eric Yang <Eric.Yang2@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/23 15:24, Harshit Mogalapalli wrote:
> We have a NULL check for 'dc_dmub_srv' in dc_dmub_srv_cmd_run_list()
> but we are dereferencing it before checking.
> 
> Fix this moving the dereference next to NULL check.
> 
> This issue is found with Smatch(static analysis tool).
> 
> Fixes: e97cc04fe0fb ("drm/amd/display: refactor dmub commands into single function")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Applied, thanks!

> ---
> Only compile tested.
> ---
>   drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> index d15ec32243e2..62d3473c32bc 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> +++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
> @@ -125,7 +125,7 @@ bool dc_dmub_srv_cmd_run(struct dc_dmub_srv *dc_dmub_srv, union dmub_rb_cmd *cmd
>   
>   bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int count, union dmub_rb_cmd *cmd_list, enum dm_dmub_wait_type wait_type)
>   {
> -	struct dc_context *dc_ctx = dc_dmub_srv->ctx;
> +	struct dc_context *dc_ctx;
>   	struct dmub_srv *dmub;
>   	enum dmub_status status;
>   	int i;
> @@ -133,6 +133,7 @@ bool dc_dmub_srv_cmd_run_list(struct dc_dmub_srv *dc_dmub_srv, unsigned int coun
>   	if (!dc_dmub_srv || !dc_dmub_srv->dmub)
>   		return false;
>   
> +	dc_ctx = dc_dmub_srv->ctx;
>   	dmub = dc_dmub_srv->dmub;
>   
>   	for (i = 0 ; i < count; i++) {
-- 
Hamza


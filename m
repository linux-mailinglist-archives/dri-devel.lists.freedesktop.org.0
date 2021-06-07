Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482439E742
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 21:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA90B6E9DA;
	Mon,  7 Jun 2021 19:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAB56E9DA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 19:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzWK2mrQ4CFzAD0xJccffxcDOoHOEp18n/IOik51iMTzVS0RJWuYnYteNAXuTRgNrEpxqHPXHHcHa0otn1kNV1mPwcRZjHqZSaEn1OOpkXm/HwyrZm4cxlw/RIoWCCJw+8tbjGh7qZurV3DwLGmxGvYjXItYOqq4Rh9JDl4nqyHkFo+EoAUFPENq5K5bkRk5Qy1mg+I44+q+LLHjoXJBj8iP7eLHTDC81r+TKyTwG4FNjpktIdG9+D257wR6OQ3IuEwCFkJR2/+ubVGQMg2LH/cefevzXfdHsYpTe0BOIeo7n65Rlm6NSoFhEsKp6NRwTDL0xOXGID0wDv+RsxLRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wjtD+nOC+R9GalXLO0XeMA1shkX+nd0sP/gjO8+aUA=;
 b=IMjvhn/6Aw+33IdJzxp+yFTL7IXPb1Vt4wWVoO0xvyii3KCTbONLifzHk7SGNbltG+7yWUgrVxG6MJtGkkaFabCedxgQePbZ+mIffN72fl2M5ftTcDZ5+/8RTL7XHQVQ5mCzGLfJw4ZzQ5mi50ClXSz3jSol18/8rxQhM97DBQzodt49YhtudIcTqVOT2EOQMTj/4RX+yxjPijW3jMZhF/bSVqsJUNRPk0K1ebYE73vfTlilYruL33EIkdnSd6g3NkhgMlaOCLVYF6N/79S6Tt68fUiDnn4wBApqdGiKdXTKAhpC1H4DCGd02HMtCP1Z91DZBnHtHgpLLlIKBSYWEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wjtD+nOC+R9GalXLO0XeMA1shkX+nd0sP/gjO8+aUA=;
 b=zyFrWW+8rcyAv06SkpS4uSqTbyO1Hx6gUyCk9C0V9R7pD/GURFb9J6gwtgBKx0xFxKI4+D4+pV35NsqtDl2ViBjyVUmswhhUqWe9R6JrBJh+agFygOfL7wcTo4Oj9zGpe25MU6xXFKyspMT1joil03NJlUPg/xaZpHpDkQai5Pc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.20; Mon, 7 Jun 2021 19:10:48 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Mon, 7 Jun 2021
 19:10:48 +0000
Subject: Re: [PATCH] drm/ttm: fix access to uninitialized variable.
To: dri-devel@lists.freedesktop.org
References: <20210607171152.15914-1-christian.koenig@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <34f88de3-3fb1-d27d-19f7-0a6ab3eaa7c7@amd.com>
Date: Mon, 7 Jun 2021 21:10:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <20210607171152.15914-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.72.6]
X-ClientProxiedBy: AM0PR04CA0059.eurprd04.prod.outlook.com
 (2603:10a6:208:1::36) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.54.68] (165.204.72.6) by
 AM0PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:208:1::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22 via Frontend Transport; Mon, 7 Jun 2021 19:10:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b8c94ea-2feb-4274-5361-08d929e7f59d
X-MS-TrafficTypeDiagnostic: DM8PR12MB5431:
X-Microsoft-Antispam-PRVS: <DM8PR12MB543122737E2C3A659593ACE48B389@DM8PR12MB5431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vFf1rdpH+e/AKKnkP4/9YJhRYkF0jri50K7GHGefvE/PLLBoQFBRKpSQefVnTb+10BEZdvzCuQ5k/NqPFOrdfoh6pGbhr31BKSj5vrh0O1ku7HwAKgBGRTbOFVPJQcK6IyzJvHdEVmg50k456t3+ag8z3bOICCNwuutcnXEqRkuRH0byGDG6BtgWnKQiylpLLLgAsDB3ZL11XlnLEadNfQhVC1u8v1V0Zh2krTnTZAz107ngZHG68dyOyIX5FOlGjcZHWMWR701K7YvUY38324QlktO6gO84X2+71awdDHE0KGJlsY6IPwZigcUh51MdHlumQwZlrttXDaqN+AObiekqr+Op6utw0lpaw/tt34IOEpmEn3Jm9aPJYwRHl3gh4B6D46vwaaEQ/ezp52wayislA3FX2W34j5eR7FeFZNMt6YLGr3THzdjMWWS/G13/ZVo0pYzAOUWTroganZtrL0Q8IJsUnst4xusB1Mt5kaDoKk0cYI6xAGEWude+FcAd19TNTLrvifJCLcSmZ6qAaFCBdNN0gCRPmtOnNe+eUvI5dD21Z73e5Yxcom2UKmIKEKHAz0u1RTX4BmobIK2YqMgAoKhO8Uum8DqQp+O5MESKvUH7ttEmbXNLLPca0rQjymCw7VSoZ+nmb3BxB7onFb03qTmXaOb0BCFqnj+l1/dGfaH73M6Gx5nLBfhnFJcT10aP3nbEQZvWNry5oKKzSGnQHm8pzy99YRW1mpUkE4U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(83380400001)(38100700002)(16576012)(6666004)(316002)(186003)(38350700002)(16526019)(2616005)(4744005)(66946007)(5660300002)(956004)(36756003)(8936002)(66574015)(52116002)(6916009)(53546011)(8676002)(2906002)(31696002)(26005)(31686004)(86362001)(478600001)(66556008)(66476007)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eHhIc0tCUlpISFg1RUpvQmVhejRBRkQxV2ZuSjYrckVGUnU3NnlKNFZudnFu?=
 =?utf-8?B?aGJ4SzZpaG1VR2NKaVUzVFFwcFZuNEdGK0czYjZLWXVhWG91WnB1a3JkTStu?=
 =?utf-8?B?VUtRSjUrTktrREdFdkxSQ01FU3lzQVRNUG5zZEZiL2VoTzVQQWVjbXdvbzFP?=
 =?utf-8?B?UmF3WXVFdEIwRjNuVE9KN3gxZ3lsY2FkQnNibFF1STRvU1Z4MjZqMkNnYzdU?=
 =?utf-8?B?aTZ1S2JPdkZJbU9FMDhueCs2ZFg1REs2K2o3NHVTR2NuRzJLK0NKeTI2ZjMv?=
 =?utf-8?B?cTRQVklRbGFETGdFbmpXdWg0U3Y2bysxendGV25ZWTVFK1FhQnFQcmViby9z?=
 =?utf-8?B?bVJMWXlIUTE2RndNNUtadkd5WUdyZEh5U3NvTG14bTZiZFhFQ2JSRzlFSEcr?=
 =?utf-8?B?dkVHSzhtZWZkS3czRll6TjIxREFHd3VDVmxzMm13NDFZajVuU3Q0S1UwcTVY?=
 =?utf-8?B?QUs4Y1NtU0VmSUFBbjEwaXJOZjNVOUJ4cS9vTWRtcUlhU24xbUJjcUp1RUdW?=
 =?utf-8?B?T3MzODBEeHpta0NsUWlkTnB0QUVMbkR4WmdoSG1tL1VpUFRpcVZ0R0RxRklp?=
 =?utf-8?B?ZkNZUmF0UG16Vk5wWWE0SkkrdWhMRW1IYVNvM0ZDNXRNS0R4U2QvUTZlMk9S?=
 =?utf-8?B?dElrODF3RkJvaXlWV1pnSmVRNktKcW9ERW5jTlp4QVp3QzlJWlNUNnRIODVQ?=
 =?utf-8?B?T3VuaXZJbXlrRXo0L2IvbUhUQ1dleG55ZFFXcysvcE9jTk9Hb3dXbkNpdjdF?=
 =?utf-8?B?QldYTk1ybndxVnNpaXA0eEcySmFZb1EzaVNIVVl3UW5oempPUTRaL3laT1hX?=
 =?utf-8?B?a1RpQy9QV3RqckpTUmVGaTVXOGw1RTBzaldXTDhoSE5GRnpSMnRYdXowdVZk?=
 =?utf-8?B?ZFBCaTQ0a1d5ZUFsYWpWUkhkbHluYzgyRWptbUVVNGxBOWtXeitRKzlEb2lu?=
 =?utf-8?B?V1pPL0o0c29jeU5oak0yNlhSUDBVYTc4N0NGbm1GQXhVU0g1NGxweTJPeCsz?=
 =?utf-8?B?b1JoMkJ1Q082RjJSRHdBNERLY3VtNmFSTkdYSm5Md3Y5b3NXeGo0VjNxV3RJ?=
 =?utf-8?B?OWNpbVdYVENBUkUvdHNxcmxGaEZUSU55Tk5aekNaVkxQQytPMHFzdkVtbnlv?=
 =?utf-8?B?K3V3MHl3eUpnM0poanVacFN0SmtSTjU3K1lmdVNWS3lNampNUHJHVk9QeHlY?=
 =?utf-8?B?eUlGajdFeFVIbEJVa3ExRXliRUlaYzROOTB0VnJLc1RmemYrRWhQUzdVRENl?=
 =?utf-8?B?WGRKNUdERGUwdC83WGVRRkF5TFFWL2lIYTgyYXNxdlN4U3FrbStseWZKdnN2?=
 =?utf-8?B?NTBzN1FNN0ZDREJrUVZ0U2o3U3RLVTlXSHp2QXFlMGFuU2dtYUl6NFovL256?=
 =?utf-8?B?UWQvenBrK2E3WTlLS3hkbUN1QkdkWjMyVkp2eE9xMlVNemcvYkR0K1RENGFs?=
 =?utf-8?B?cHN1V09EQTZGeW84RUU5Ym9UQWxweFhkeUZWTTNTZGNpVXBWR3pQcng1VTZo?=
 =?utf-8?B?TlIzS2VLTllPNWdVUlRDcnVGMGJ2TUlsNVBlb2h6MHNVVmZRcHI0bSt6K1k3?=
 =?utf-8?B?Slo3QzE0UHA0dGh6SzJIelZMMVFPZ2VMcmpaenRGaHNvNVd5WEl1RVpLd052?=
 =?utf-8?B?WHdTVTdocFlKYWwvbThsa2pmY25aTnBzQjJOT0VLNHlGQVJzZC9zN0hWancw?=
 =?utf-8?B?dWpmWERCbmpTKzhITnN2MXlGZEV5R0FnSnNkYkliY0xZeVZFZ3VYV0V1TTMy?=
 =?utf-8?Q?6cUrvCtak7nUtQ+yNFVjQ397r+71QhoeMhvYKax?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8c94ea-2feb-4274-5361-08d929e7f59d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 19:10:48.8072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aorTgymV2+/gpMbzx/yPklK/31pf4Y6IDT+kGw4kFEHpjPpALLud1DIc3saCcAT8hrfEbjWiDM7JMG6oPhP4Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431
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

Reviewed-by:  Nirmoy Das <nirmoy.das@amd.com>

On 6/7/2021 7:11 PM, Christian König wrote:
> The resource is not allocated yet, so no chance that this will work.
>
> Use the placement instead.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 7e7284da5630..0c74f4cb2a3b 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -736,7 +736,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   	struct ww_acquire_ctx *ticket;
>   	int ret;
>   
> -	man = ttm_manager_type(bdev, (*mem)->mem_type);
> +	man = ttm_manager_type(bdev, place->mem_type);
>   	ticket = dma_resv_locking_ctx(bo->base.resv);
>   	do {
>   		ret = ttm_resource_alloc(bo, place, mem);

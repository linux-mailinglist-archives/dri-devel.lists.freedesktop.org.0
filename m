Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C95439FE7C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 20:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B48A6E7FA;
	Tue,  8 Jun 2021 18:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C2E6E7FA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 18:05:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBocqRyzygtCe6kjc/7GEIAIFeILLRHpmMVvrtLdTeuXCtS+PUvzzJYPtahTJNTw0ttiv3SDbj7Ad+qJq0v4YLtc2ectxSdAo6c7FmtOQGK/wd123pXbzEs7+dCKTTorKcpOw4IlHTkKxnXXLefDJ8gfnIi0ctDiCS8njUOFjZjduFF/pZf2I74pSL68SLGlgE7Voz1dldnlhSddy2X4LmYal7IhkhF/v53pIlB1BNcfkiO2c44UxR/+mCg/mmM+HfcrjaGZtpWE9cIpP5lLiTo6i/k2xT/QkXwgbzt1/0tXuxbX+//pI2ErmFHjILg6HAvv+pZX/W52cNavdRMg/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyHYzTl4mWkvMYAKrhMb5PfzG0QOy5ZWShAwDYHFc8M=;
 b=Yo7zHC/cuQA2eYJ8v4SopNnXTZGO6zBrpASr5T5wYieC1Ys2eWmom6jUV9bepY8+yQaHdmd/hJV1FDbbqM8qLNv/GlBetrf6At2wd9TeHBE8MtYpn9eMXXTspAEov0GfhKijvvZ3YhjCrBXZfSy2gpFK3JwGqdqZElLlxOBbS+jLL8TNTR/e3LK+6Py33IhfLi7A1L0m8VcFktf8jpLHr3x4SwX3q/uyVS43JniYrnL5P3tWnzZHXcz23VaflR9RZeM+Frk4WjNfSOcL8m8rHyToUCA4bRERLvstGxLbnZxhSDH0N5RNtMnXYMdM9ggqZhWn448hv+TKZmHJQ397cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyHYzTl4mWkvMYAKrhMb5PfzG0QOy5ZWShAwDYHFc8M=;
 b=UKrTZoLCp4lFcj2+TyK1rPh50lol/R+/39oBVfJaHSb61EFI4qAra+6IzDc+fsXffm4b+wTo2IttxzqQv/unfCRli16ecV9Ry8wAgcUyxeg1Nld9twBkD6FHNk6gWbRHyiSfFcLSfXw4k81xiw0WELr15jBTmvBtDDXZJO24bOw=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5464.namprd12.prod.outlook.com (2603:10b6:8:3d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 18:05:22 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Tue, 8 Jun 2021
 18:05:22 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: free bo resource before assigning new one
To: dri-devel@lists.freedesktop.org
References: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
 <20210608180135.10953-1-nirmoy.das@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <e27b8e2d-cdc5-5dfd-0632-516cef0039f3@amd.com>
Date: Tue, 8 Jun 2021 20:05:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210608180135.10953-1-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.72.6]
X-ClientProxiedBy: AM0PR02CA0035.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::48) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.54.68] (165.204.72.6) by
 AM0PR02CA0035.eurprd02.prod.outlook.com (2603:10a6:208:3e::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 8 Jun 2021 18:05:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3de39f9-b0fd-4629-f480-08d92aa7fbb2
X-MS-TrafficTypeDiagnostic: DM8PR12MB5464:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB5464B5CCC5A9532054FB8F3A8B379@DM8PR12MB5464.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eikMgcSoDo6Lhr5HxZFeENHsuoqUyXSfeSx4/XJkYcMhtUHyf/lD6JKwPHDEejfTZufVFVo8BncwCUBMtJ3NPhA8TCJ1FSDabLuHbmsI/Qq404tIfxmU5h7WJ5j0zNreJ11KHlA3oHLn794JMUIqeUzzJMdnz+j5bpjdeBrIW8SMurWoz/lGmE9ohwpxTDEpWH84gdH4Gyl6YExH7gGHG6evIErFgwENp9rp8nsiKtvF/dOrxXqTiytQc4u3t/QWpGe0Adx7EDneyVVAPe0kxWsudB6e+S2pRHgsyvk0Wxn8rra0KIS5s0m9+/I/oLUx22KOV6/Bn08XIEvzOi396c04xSC/RqKcFDX3yUJShwmTjuYfUOuJ0Ak4MQTtVzQG6VaTKeIDXqAhE6oerPA+N5WuW4vgRSmORFPxYK/L0PoCPCG3OCvDtNT9q/GrowlugQZC7o69SklF6uw7Q0+1KY/aI8YFf9i8u7obl1Qf/rwFhqYWfmuZJFlwjhAuu5V89508ie0TsmexqpNl3gFWIfcRxz7D34Cx0PWLW9/ks1pOqMt+beYQzEh8Mb38G2fP3pkkpg6adlTs8WIfa08hEytM3ajUvxV61AYrERnZVaC4AeZi5DLNMyhX7v2eOYyJCY8jHK6BythZXpmR7AmSyBo45HUabv270ZZFXpkFOJtkgE+Czo4szheqUP9+ivoB9lhdCTn3y07ZOPZsdBTr6fS4i2KWzSCkKiFOrZHcyooopFV005jC0nPSr2j6LKX9mOhqAnWG2IMkx9NzH7F5a/q1zU7nmKMhDdExqRacnf4zSEzFSo53bXsT7r2QodncBsmOBCbdwuUot5RchOB8aw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(4326008)(31696002)(16576012)(8936002)(6486002)(38100700002)(66556008)(66476007)(66946007)(16526019)(36756003)(8676002)(4744005)(6916009)(86362001)(5660300002)(53546011)(2616005)(52116002)(956004)(2906002)(478600001)(966005)(6666004)(31686004)(38350700002)(26005)(186003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkx1cEgzK2RzMnYrQmppRER0L25ibFY3ZFNYU0UweHVvMG9wOHhoQnIrSTdN?=
 =?utf-8?B?TDFFb2h4UXN3YXNDNnA3NHhXdDBONjMwcktVcDRSc3J3emZPaE5XbnNPVUJk?=
 =?utf-8?B?WGErZFkrZWNFWmRsZVUyRnlBbHhVMUcyTlpBZG8rMlozb0RIWHdlQ0tteFRW?=
 =?utf-8?B?NFVxQythTHYrYVFnRnFpTS8rY0NGT0pTWHplV2ZDam9mMTh2QW5HaFdxUzl5?=
 =?utf-8?B?YldzUnBNTjFkS2F6cm9wcGlYTWNSNUJNcnhsNHh2LzhqNml0d1hjYk5LRjkx?=
 =?utf-8?B?ZHFuYmdkeFpTbEVZRmJXUmNLWXVnck5NRjFDT3FEVDZVYkV4VUM0cThmVTlk?=
 =?utf-8?B?THIxRVhUbUhNWHMvUkFoRlU5UDZ5Z3JPcWZ0dkZWaUIwb2NHcExnOUd0M0tX?=
 =?utf-8?B?ZURlZlhiUHN0Mng0NVp4cWVxN3BES0l3UTFVT0tzMWlzSnVISjJxOWxMeHMr?=
 =?utf-8?B?Uzh6QTNUNjI4azJIemNKSDVsUjVYZy9Wd0lBcFc5YVlJZ1VIZVRRbXZaQnEy?=
 =?utf-8?B?Z2tRWXVOWm9vV2RGQjFRdDZMdmhLYk1RUkREQUlVK0xvbENRTVJ2LytFZTVZ?=
 =?utf-8?B?a3g0c3Z6NXQ4YjJqM0dBQ1hoR05xU2J1WjhWd1RSSS93SHlPcUhLWGtJY0ZB?=
 =?utf-8?B?aDZFZnQ4MWtEc0pWWkd2MHNhNFZOUll0MDlQVjVDMXhXbmFhRjRQbDA1TkMx?=
 =?utf-8?B?VTdkNDlaaXRiRHFIV1VrdlIvU2dWN0VqRWltNDV6dGtsek9TeXN5QkNlK0Ez?=
 =?utf-8?B?RFE3ZEdPN2pkY2ZZTHZ5SGtpVlB2QlVRUE1PQlZpM0ovMzY2L0pNWnB0LzlV?=
 =?utf-8?B?blZ3MXBHeTh6VWVyVGdQem9LNjVBd1RxZkR0ZGllRkpKSWx0b3N6TGp6TkZH?=
 =?utf-8?B?TFZWNnhJWDIwaCsrazRCQ1pOMDFIMzFzenVxSXB6K1B6bmJ4NDBNT0RKSWJr?=
 =?utf-8?B?T2pUUFdkZEdDWnNZNXpnUTQ1d0E0dkJMclBpdWZKczFyNGZFTmJBTkx1eWpj?=
 =?utf-8?B?YlB3bkErZ285THVYMVN4eDFXNExqVE4zUnBNc095ajBDTUpKN1hnTG5NL1Rz?=
 =?utf-8?B?UWZEblFadEo0aVRDL1dWdDdPUEhkYXpUQWM2cTJEaXhKM1VxZmVuajluK3ll?=
 =?utf-8?B?UmJUYUE2cXI3NlJtMEw4VHcraGlHdFhKTUdWalp0OHRWS2Y2WFNEOTRmV21B?=
 =?utf-8?B?aVhNMW1hUExBaTRTRkFTMDJpdnRKY1Y3dEptQVFGT1h5WkZuaUp1YnhwZ1p4?=
 =?utf-8?B?N2dibk5EK21XeFRHTm80NHZQYWhOU0ppTFNFcEdndFdFK1RsUU9VRGxudnFH?=
 =?utf-8?B?L2RBNFRJNWhpM1JLNXo3YU9yam9KTy9mcmtGWHdyVFRycFNJcnV1UUxLWWFh?=
 =?utf-8?B?OENBWFZkdDI1VytjWkRRaU05c0YwQjFwZndqNnpCN010akM2ZUsrbjdPdXJl?=
 =?utf-8?B?SG1GQ3RuVVAzRVRCZVluL29CcXM2SmlFNVUwUkVhS1RHckRCYUhHWnlzdjds?=
 =?utf-8?B?MXFXYndpQ2NPM3gya1RSOFV2Q0g4SmJXU2psWllPQjkyZC94L2tjWlo2djBL?=
 =?utf-8?B?U0hBMWYwYmljeWZudS9TcU1Gdnk4NWVnSm51VXErNG9aNXhkUXdzdHI3U0ZP?=
 =?utf-8?B?ZVdNaFdMYUttNHNPdmNhZ204ejVEQWJYL1c5d3IzeXZNSkloNFF5Qm1PWFFq?=
 =?utf-8?B?TWJhQlh4bmphM1R5UlR6cGE4bzJrN25saEhCMjlua2tuWS9ma05LR0R1NWtJ?=
 =?utf-8?Q?3/XVfIebyw5vL3b4/SatpHBFMaNu6Q5QHdsqlPK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3de39f9-b0fd-4629-f480-08d92aa7fbb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 18:05:22.1226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CrqE9CaCIRFw8Q3lU8GOnZjv7mNbJ6XqdZ1dnzrBKwBHPj7+zqmudWHzfsOBEiQa8mIimuLKQDCkj/vmBXLahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5464
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
Cc: thomas_os@shipmail.org, linux-graphics-maintainer@vmware.com,
 Christian.Koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please ignore this,  I wanted to send 
https://patchwork.kernel.org/project/dri-devel/patch/20210503190013.91732-1-nirmoy.das@amd.com/

after rebase.

On 6/8/2021 8:01 PM, Nirmoy Das wrote:
> ttm_bo_assign_mem() expects bo->resource to be free.
> Fixes: bfa3357ef9abc ("drm/ttm: allocate resource object instead of embedding it v2")
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index bfcf31bf7e37..7281912436bb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -733,6 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
>   
>   	if (old_man->use_tt && new_man->use_tt) {
>   		if (bo->resource->mem_type == TTM_PL_SYSTEM) {
> +			ttm_resource_free(bo, &bo->resource);
>   			ttm_bo_assign_mem(bo, new_mem);
>   			return 0;
>   		}

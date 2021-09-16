Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 268C640D364
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 08:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918FD6EAB3;
	Thu, 16 Sep 2021 06:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241E26EAB0;
 Thu, 16 Sep 2021 06:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeMOTeeC1kNMvSG5N1ysyTfhNor0Pem2YVxkLScJvXGv1NaLiXYwLJFlNGFVDW1uL/4uWiuZ0OujwCXaMUcju8ViEIX/sLnJvNz6L1O236KIEgVVv/OcOegE1FEBDxIFqr5BR22HipKFQCb3zmeLO6t7IwYzAEm3HL2s1wuZEY53l7mwn7bvCe4Pzczr3KryAP4LWb/JxYI4cps68h55MpVkDrBaDwL0PzWIo6/D6N94FIIVeL1L35CKeISYzehZI6c5X57WRBbGXWs7xdimdVRcYVlvdx5ZMid6Mj7D/IQc99NVtDngG6f0fYKtmJlzDH0xNrZsvbxypuqVurf5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qgRle50Z9yk984dsKJEWT7Ukk3J2AunKpeDKRoIe00Q=;
 b=PmDFxhNSsrvkl2uWiYC9by7eeYDYzD9cZjwPzOtX6RIg41eY0THemAVJOuSGW6nHK7GrT2hP2TjcfrcnJMsjhw30AoBjfh9+3SE9rIfXOTRV/RLP3KLafiqzvxpxBfcKx3LsLGPB9mAos0+bMSrp4CoC423Av9e5eiW16bQY70X5GtvROmzAl1B+YqsH0+orcYNFkqHrgpY/cAvnnYvG4f5qOIcIzBnInSoagn67bq7h1K1FQPOaP6+QMSdRBveoQ7kzCNTVrSgJSp+/zaF2O8Q0FuCtVCn/2ONGe2+5g9qi5nD9qSAGQXj+uFGUVbgJs87USklSSopHvrueSYoinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgRle50Z9yk984dsKJEWT7Ukk3J2AunKpeDKRoIe00Q=;
 b=5fM7sS+da73xCEkxD+8BkUtfau03HqCHZNL2itplnYdOP8O5viV34VlSFJEbCSdlemPf61xBZDDo3mSCNON0Uq9qS/vy53HQUe1m7c3yAAg8E2Td0hIEWpvsoWJ7VHhyFobQS53DaRasLi4yjb5WtB1mRp+IxS4FiGMkG9ZYR9c=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2516.namprd12.prod.outlook.com (2603:10b6:207:4e::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Thu, 16 Sep
 2021 06:46:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 06:46:34 +0000
Subject: Re: [PATCH v3 03/12] drm/ttm: remove TTM_PAGE_FLAG_NO_RETRY
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
 <20210915185954.3114858-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b6090a07-9706-ec18-f839-c18e7566edae@amd.com>
Date: Thu, 16 Sep 2021 08:46:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210915185954.3114858-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0092.eurprd05.prod.outlook.com
 (2603:10a6:208:136::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR05CA0092.eurprd05.prod.outlook.com (2603:10a6:208:136::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 06:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 295b7aaa-ea4e-41b4-7ebd-08d978ddb900
X-MS-TrafficTypeDiagnostic: BL0PR12MB2516:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2516F484A9658F28506D8C4583DC9@BL0PR12MB2516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V2wb8BgvMYHzZAfYT6JHNsP4UuOJF/K/Cm8iMSib/hW0HRfD7nnEbxDPDbYpuCaSPJy5bpXPg0+RuThwHtxh4joEK1OM7fA+I/7aVKSz770g39Eq2IPK4ERObjkn6LI0BaMAVNRsC86RHd+Bswi5bJx1YM8WyC/J9vIqV1mNOJcNKR9tD9NRipn1sONPGrCgtX6v84jNvl84nNdUJL2y3FJCnSoOP+VwMaiescg+2wZLPyBFZvMeNMadK2QWqhsRH68o1RxlYjF2hzH6kSvTp/hCdHX2dckQ+7B/WD3KzG5JVwPP+TGg5/lzr78uGcByDjdJFYxGWKyumbRyJ+VcnuIsg2qjaxklwkxwj+GV2HIbVbcP7KeNUHxymAfvqZ6eDoj0ECuTmuq6sa9XrItX/6U1sdaRfJBMrJdvokJj7OBseZ8mXxUJpdX/Pka4qHfSjAN348vvcAUzoDr9DGikCfB8fvJkARzVW1n/qlArxQgNiIzL1eQ2tnAjdeuSI2+AM8mzlIAczPA8etaNyexjBpP744A7uOkO2JkfKgTpBL9jic+O1M2AHjms7mC+NAObWoVrOy9wuhXqPsyogoXViY48gZJ96SF4XhmiJhtxdpPZ18wSg7j30ReUowv81jy5pUs2gouPuroSdKDIhU9Utv4xivDxpFLEOyegmTGkeQk7sJO7vOfyVg8iJ9tYZtDXoYFzNrr2Gdj96nK6W67spVJ5pcF2NaXIhJ9wgKfi1MXOR3ZVMQtPn0RQxe22vw2O
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(508600001)(5660300002)(36756003)(6486002)(4326008)(26005)(956004)(31696002)(2616005)(8936002)(2906002)(316002)(8676002)(6666004)(66476007)(38100700002)(4744005)(83380400001)(66556008)(86362001)(66574015)(66946007)(31686004)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGNXa1JNNk1yZ1hjQnUvRmh6MlpjaEhiajdFWk9qSkNjWlREYW83QnVJSmVY?=
 =?utf-8?B?eWZnTXNpL0dSc0JVakxSVVlzNUxoZHlubGhlSmFLL3U3WjdoSXhhbHJQaEZQ?=
 =?utf-8?B?TVdCMksvS3M5NUFkdC9uMFpnL1gvdDZnQW0wdXRFajBkVE9qNFZBVkdxVnJC?=
 =?utf-8?B?dEJWTk9tZUlvVWYydEt1QUJ5NzRHQytWb0YrR3J4dmNZOGNURDNYb1hnNkpk?=
 =?utf-8?B?K25zS3dIZzNUKzhuN09GMnAwZm5jeWdsTTViME45LzJxYnk3V2JzdTFUNG9M?=
 =?utf-8?B?OUJPU1JNTyt6clBWK2JXTHZ4M3ZLbzhJMDZjTGRDRW81OGVsRjBqUDFKckRv?=
 =?utf-8?B?eHBiRGJab2x6QU5FSk5xNUxoS3YvNHRMdkZ5U2lhTG9KaFBxUUZwanArOTBq?=
 =?utf-8?B?VGlzSXd3Q0ovZ2hVT1p0UytuNytRRGhkeTZlMkFrWUlVd0k3aUF6UWhzNExW?=
 =?utf-8?B?bTBqMGZpS242RmxQZGJsQzNhSU9yYjE4MmpscHpOOHI2NmtUT3JZRytjTzlj?=
 =?utf-8?B?dzVKdEcxRW9HVWNmVnoreFUzQWRrVTEyU3Y3UDZ1RXRwZWJqYUd1b290M3c5?=
 =?utf-8?B?bFJ3bUFsT05Hem14K1lOMStoMnBpU2JqdCtUaFVSTVdhc3RKUjh1RGFaT3dm?=
 =?utf-8?B?b1dvV3h4dmhTMWxQbGpJMnFIVWV6eG1XeG13cW4vdXQ3TGFIUjhabEMxYVNu?=
 =?utf-8?B?eXJSUEVUNTZVQk5lRUY0UE1TOW5hSFpnV2U3WmcxY0JxbjNNWFd6MnpTTmhq?=
 =?utf-8?B?ZU4rSGpaeWxtT0hWUkxCTjB1OHRiNlNFRktzVDlNdDY0d3NnbGhmSFN4SGt0?=
 =?utf-8?B?RGFpUW0zeHMyZmtnbXBPN0FTZFNLNjkwc3NVelhjek5YOFcrOS9Nc1JacHZN?=
 =?utf-8?B?dkM5V0R2UHJLUXlGVW0rYitHL3pWMEg3NXA0Nm1hbGRrYnZuZTdqZFJ4ZGlL?=
 =?utf-8?B?elozRUxWMk93Um9zUjY1T3FLdzlwSm9GdS9VajVRNXVHUUJLWGlPZi9hcTJ4?=
 =?utf-8?B?NDZPV2IwcFBaa0ViOGd4RFJtQnkvbTVFeGNWeG1tWDBCQk04V1k1MDFNY250?=
 =?utf-8?B?Y2Q0Y3BCbkdiTXBkU1dLQnRIc3VQaDlReW95UTRCeXhWU2pUS1h0aDN0Qi9o?=
 =?utf-8?B?YXJ4bGRHRW95VlNVRlBaQ1FrRTlBZHdZd09rTkRuQ3VBdHFYSWNySFpLbFpi?=
 =?utf-8?B?a3plcXlxUXI3bzRJbUZkOG82VFNvcW1XNHpzNHAxMUhrbGtZUHhCU3RvRGJa?=
 =?utf-8?B?QUlLZmhSdHNCdFA0M2l2eWwyVXplcXczWnA2WkpHK21Cb3lsMk5VK3Y2a0Ju?=
 =?utf-8?B?MjVJQjQ4YUhobHFuTkFkb1RmSGdlbTgrb3hTNjlqZGN3SlBBYjYrS094YVo1?=
 =?utf-8?B?ZDQ4YlF2bE1VMlJZMEZKWlZQV2x6NXdmNk80N2UyZUdzcm1lekJIeVdUUWd4?=
 =?utf-8?B?eUtTRUZzUzdEdHFhejY3RHlTUnNQenZMSlJIRERGRUlzS3RQOVY3ZGN5aUVq?=
 =?utf-8?B?dDZqbWNzUDc3YnhBSkxEWk9GRVBUYWhHUXhkQ3FOUVBQd0FjaGJDQlZUTDFV?=
 =?utf-8?B?QkV4Wmw1d3NCcE5aUC9uOVBaZGEvUVZNSnNWV0w2bW0yZlp0NkRneEZoNXNJ?=
 =?utf-8?B?OHJuYlJpQytuY25MTW1oNlRSWFUvdE1nSEplemI2UytIaUM2bWVXVlJ0azYz?=
 =?utf-8?B?OGQvUXJiUHdrUnc4QXhSWGZZNEFjY2F6TXhqbFIxU0Y5UmoyQlp5YnE0a2M2?=
 =?utf-8?Q?gT/f0yvhOBBeG3JoiTCztA0tTcNAiwu6DXRFOrS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 295b7aaa-ea4e-41b4-7ebd-08d978ddb900
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 06:46:33.8837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSQhAKMhfExCYBlHHhOyPfPITdb2nMgQoQ1V84WSJ04e/Mv+uLqNCFyS29vKiUut
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2516
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

Am 15.09.21 um 20:59 schrieb Matthew Auld:
> No longer used it seems.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/drm/ttm/ttm_tt.h | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 89b15d673b22..842ce756213c 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -41,7 +41,6 @@ struct ttm_operation_ctx;
>   #define TTM_PAGE_FLAG_SWAPPED         (1 << 4)
>   #define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
>   #define TTM_PAGE_FLAG_SG              (1 << 8)
> -#define TTM_PAGE_FLAG_NO_RETRY	      (1 << 9)
>   
>   #define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
>   


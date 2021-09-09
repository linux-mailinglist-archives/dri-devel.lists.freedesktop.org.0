Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC164044AA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 07:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0D6E43F;
	Thu,  9 Sep 2021 05:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2069.outbound.protection.outlook.com [40.107.96.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 174A26E43F;
 Thu,  9 Sep 2021 05:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C6mcM0ZscfW88x0hpk4Uo2KyI+w8cep2h/awQDP4P3ydDXCqrdpIhY6Th9esEXeJgVjSZDOVuXCRsRWo/wIkLuVrSmEF8vOSHOyvRc+RkPdMur/pLvkhSJCMqXtAMtki45gXmyCLZ0TdzvyCuW8VCQtEPrXs57ogXz4cGjaHvQq72GCubmoNLgOdSoOfQO/7suAVfKbRSM9MbGkm7Vd791d/2SGxEv6Yy5e1iJNtFFWeBaJ1NHH98fuwMd9KetScHexfm3IV9YaGIwgC2GxPiS9TuF3xrgUvviDE8dUkzRgj3R4giXWfkK3lSkLFaUq/QJJiY1y4NleCSMQd4bSUTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=HEkJP+CJi+CZxA4qWuKO2fDqB0JBJ1S4/SaiJSFWfs0=;
 b=duNFBg1pgX7//SyPUOhOpYWVVmH7g1ZUc9oTXfx/SmunZVcxCa7JvRNg4W7mFq7f4QzGC+aWqvreGUUBdUvFFLnEA/kkINWl77HE4z3Y8sSc0SCwpbEx/kGLdrSBQ7w0ud6deWRpUqVzG2PYRwm8tkbcaWMaLOekHTRGhIzyBsVNe87f1pg1C5mvwLjcUkY8NjOl3AmWsCRix7jcOt2sBFs4s4pjq8SXl8d5r2ZsnXBGr+4o+BkiO1y63LAEizC6EVTkKDQLg28/WUuLERN5Ldd5WjvxPf2KQE66RlAddg+U4BZX6MLAIm9KJeitkap2uGR0LJUWdnsNH0ElYnmG9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEkJP+CJi+CZxA4qWuKO2fDqB0JBJ1S4/SaiJSFWfs0=;
 b=lgzVC4v1OTcuYef03pLDK6hi87HFlZy7TAlDNzMRlpA+sAjczzvmoJXvjTBP7MWr7hFVAaO25zhvt2zhSgmyE510yn/lPRVVZ82ur9NIo43MvL624EgrJRSul6QnqeUhsuew5Zto4wMTv7lGWY1RZ2SeMUEaBZL2Y/d6Q6UNn/U=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5338.namprd12.prod.outlook.com (2603:10b6:408:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 05:01:02 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::94bc:6146:87a:9f3c%5]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 05:01:02 +0000
Subject: Re: [PATCH] drm/amd/amdkfd: fix possible memory leak in
 svm_range_restore_pages
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: yuanxzhang@fudan.edu.cn, Xin Xiong <xiongx18@fudan.edu.cn>,
 Xin Tan <tanxin.ctf@gmail.com>
References: <1631161659-76719-1-git-send-email-xiyuyang19@fudan.edu.cn>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <af3a4d90-b988-d764-2b8e-6f8b19601eaf@amd.com>
Date: Thu, 9 Sep 2021 01:01:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1631161659-76719-1-git-send-email-xiyuyang19@fudan.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::8) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.186.47.3) by
 YT1PR01CA0099.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 05:01:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d0e2a66-20d7-44c4-4159-08d9734ed23c
X-MS-TrafficTypeDiagnostic: BN9PR12MB5338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5338ADE1D1699D79EA55AFCC92D59@BN9PR12MB5338.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mnVypZFxzBAKglwQ2MLhHep9ex2dPSO/MgNokTzZoagIx7RU7s2wApLu/4alO/7Tc3/vm5Cc/WbrO9Xg6RlVJljNSQd6SqDBY+bCZ4MalMoyMXR3i0chSpBeZaQyVyUdkqsoZIXIif7yvJEu/loCB6LNpqdRbUgjeCHROAvGp2J1+BFLs0bJZegGvYQYOBn8TT9chZFSX2Vk0967IEG/vph7ImK10/WU0MK1TvKu3Umulh4ZSzCvMqfWcthpS4WwusuhMHMsXjUp+bjlEjK2sUyCi2FuBznv0vnRvnT6rB5j30TE/UexyH5ALK4cn8JOGydUYYqTycanCdpsD5g8engbZsPeDJU+DDHxkSblncIwqh4qIbMpcrPDzlC4ysCIAXtahUSn/GvWFUlK3OOHboYEd7d/GzvzLuBen5h24y4hHsw7f+LozOlLlq30kaNpSGgWXszArbF4bNKsS28xSfXYtCF48UcOfPMWtsaPENsew9ugj6jqKcgsRf//e85rPW0v7p65iDqKCMHrEdI9KAvKwwgV44PioeDbJgrxzvOQHdONCy7cE3griUw8GF4Nnzw4Iihe0NUq7WC9GSMPzsZB1TIKqDyL3lrwfXpudIowfMxcD556DSC+G3JWSMBHOx2CPN9KKZoTtI9pZJDbUku+TcWtbmddxcE0BHnUyAzXO+mFe5xJLNfbbAr4aCxzrgAPUSKRZoYHtB9DrpnQL0kd+A9L70Yjo3YwwTZeNAtM0kNslCRwh1mIIejAnzrD9J9rmmKDDU3i/L6Uofr5tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(31686004)(86362001)(66476007)(44832011)(8936002)(921005)(38100700002)(83380400001)(54906003)(110136005)(2906002)(316002)(16576012)(36756003)(2616005)(26005)(186003)(956004)(5660300002)(508600001)(4326008)(8676002)(966005)(66946007)(6486002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHlHNENheDgvN0hJMy8yUHFHMGZURUJEV1BRR09JQkV2UTIzRGJUTlRESE52?=
 =?utf-8?B?NEw5dlZjNWdHdzdrK1hxYWFQRTRmc09FQk1Hdmp1blZyRUVYcjYwM3E2dWdz?=
 =?utf-8?B?b3hJTHBsQ05uUS9pc1U2aUtHY0NyTVZLUC9NOS9KOU9uc3VmSjFHdTIvQWRp?=
 =?utf-8?B?M3Q4VHpoNWZ6c1U1U1EwMGcrU1RzTm5PT0hKNzFETkV2d2hQWDFydUtUallO?=
 =?utf-8?B?ZjBpQkdxOVNGRXJ4YnUvV2svRWtYVVI3QTkwWXRVM1Q0b0hlRWlTeEFqc01u?=
 =?utf-8?B?ekZJSWV5Q3RKbzFQWGFKb2IzTnRPaXpVMzdoZjhzNHhIK2JMT2R2TGRiK1dO?=
 =?utf-8?B?NmxBUGJVK1l0QlJWbjY2MGlMampFTVJPNUxOQ2RwVFM0cDg2SlRhSDlJbHBK?=
 =?utf-8?B?dElPWWUvN3l0UDNrWVFnd05pWlFTYmh1d0FrWnlzbi9WT0htVFhFNzk2MTVi?=
 =?utf-8?B?emI1K3BXallNb2hPUm1nd1BieFoxTnJnVzBRb0hQdzFYQUQ1MDNmYmdJRVlY?=
 =?utf-8?B?bXBYby84azJiMENmWjNvT1ZLUjdMUkR4SlViUG1QR0htM2JMcHp4cWdMZERx?=
 =?utf-8?B?c2ZSbTR0QlV3UjArWkdob3dwS2RwNmJHYzRvVDRpMlFOUnNGcTV5QnBPQ3Jm?=
 =?utf-8?B?VUl1NWRJZnZTOHlwdERxbUs4R05Gb2FzR3pqSlhMZDFIdmU3eFdBTFZIaHIx?=
 =?utf-8?B?SEFiNEcwSVVnRmRpMnhPUENQdmE1VWQ5dHcyVnhKeDNZdmNQWFM2T0cvbzdX?=
 =?utf-8?B?UVJaSjJPTzBNZlA1K3FGdGQ3RTlLMnlZVHdzazcvdkhUbFNublQzWTR0YUpj?=
 =?utf-8?B?b3M3TzhRZ2owOW4rQS8xZlY1dWNuUXZ1cHloTCtvcTJ5ajNtd01VSnBIUUhZ?=
 =?utf-8?B?RVkvbHVHR1VaaWpLNVZMSDdNcy9OMmtxWnBUaDZ4aDVzbDdIODNyKzdFUEZZ?=
 =?utf-8?B?ZWtLS2gzYlhkdklrbjBNdzdOclpYVTRyVHpHcURnbHg4NkdYbmVXWnZyaHNj?=
 =?utf-8?B?N1dyT1ZCTUFkM2RkUEVTdmNQNU45WDBuN1BtMVNMN2pWNWh5ZG5Qc3lsU1BG?=
 =?utf-8?B?b3hCc2hBcTNXazFEQno3Tm9aNE5nZlE3dVRkd1ZpL3ZmbE0zRXo0WmRFNE1i?=
 =?utf-8?B?TFVzNGZXaFRQdFpnMXZDMG9PQ2pPWWh4KzA5R2NWWXozanNyTlJBb0JZQThn?=
 =?utf-8?B?UzZmQStTQkxQb0t3dVZHK0Nudkh6TVJtS296enQ5NTIrNkRCL1VFWDVmaXRI?=
 =?utf-8?B?STQrVk5zYWdDZHlaWmRWNFR3VWZhYTRrYW01bjFQbDJkcDFRZHhLaEU1QUhq?=
 =?utf-8?B?ZHR2Mk8yZ1ZMc3hZcmc5YkVtTXd5dUIrOHhUbDBSbGdPUVhQQm5ESGxFUlYr?=
 =?utf-8?B?VFlkbGdvd1B3WVJCbjNuY1BhZkhnRWRVNVlOcW1xeE5ZRVR1bkxVOGFMVHhW?=
 =?utf-8?B?Z3kxQVpKdU54UmVmVzJTYURiQkpwL01teXZmcjlXbUpZYUo1eTFFUS95M3Jn?=
 =?utf-8?B?cjR2SDFMZFNVOG9UWXlBa0R1eGlvYnc0UjZHOVhFN0xlQW5iZ3RUSmY0akhE?=
 =?utf-8?B?ZHcrTHFybDhkVHBjOUJqRyt4TUhFeTRFYWl4Rnd5NWtlN1AyZVF5NmNsOW1P?=
 =?utf-8?B?djdJOWZKQXYrNHJETysxWmNxMEhzc21KOTZnNzg0YVgwZFhUMVV2cTZGd3Nj?=
 =?utf-8?B?SWV0aUladnVnNTYwMmErU2pYZTQ3NEcyOG9SVG04aTlTUlNqMEZFdzVjeEY5?=
 =?utf-8?Q?rBVyDzoEbwfIo43YP9b+SWWviWy7KCuo6YYX/KF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d0e2a66-20d7-44c4-4159-08d9734ed23c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 05:01:02.2478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bVh79EYy92prloR4v0BKSfdyrYlz8OLO6jwLq6sqp24wiAv3J8kXqeabGYZwuG5TxGFa0XxbNHGB8w+Kk980QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5338
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

Hi Xiyu Yang,

This bug was already fixed by this commit:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/598a118db0d85a432f8cd541a6a5d31e31c56b6b

Regards,
 Felix


Am 2021-09-09 um 12:27 a.m. schrieb Xiyu Yang:
> The memory leak issue may take place in an error handling path. When
> p->xnack_enabled is NULL, the function simply returns with -EFAULT and
> forgets to decrement the reference count of a kfd_process object bumped
> by kfd_lookup_process_by_pasid, which may incur memory leaks.
>
> Fix it by jumping to label "out", in which kfd_unref_process() decreases
> the refcount.
>
> Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
> Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index e883731c3f8f..0f7f1e5621ea 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -2426,7 +2426,8 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
>  	}
>  	if (!p->xnack_enabled) {
>  		pr_debug("XNACK not enabled for pasid 0x%x\n", pasid);
> -		return -EFAULT;
> +		r = -EFAULT;
> +		goto out;
>  	}
>  	svms = &p->svms;
>  

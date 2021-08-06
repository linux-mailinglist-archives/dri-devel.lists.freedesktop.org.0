Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 970843E2D3A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 17:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B126E176;
	Fri,  6 Aug 2021 15:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443246E176;
 Fri,  6 Aug 2021 15:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNZyUatnbY1UxED366SGP3StoowZR4OB065NKmwCkzG8wi1T7+GacmsJ3PfbzhBAT/V3cRWINPK357wxwyN5oSbF3gmNOmbs8vX68OonAU46Oj2YEIZmeaUOFDUbd3jDSiFVzY4vKDe7uM6jjPkRhAmhgFWrV9u5NEAWSEvQ2B4R4GGCbh5KiHkE8UxJWmvursdX9kYI/bZkElplFxmoE7iI//3526PcZNGmhCPufid8GrT3kaX/lNUntyo8CuQvDFjW68Vjgk+MJ5PEpxyTa4gldlAZvOxVhLO+hv9f505fFDIv5Ipw3zRjbfR90hlKLxLnVN8+lxn+LX+xNJyN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPE5oTdqQv0rdL5gDZdNlzOpVxtbGPFUWiTFxr57Skc=;
 b=B6DAR0MZQmU58SxXrWSk9BQR0N6YOGEyvumYX8j4UXY5Kd2LVFA8P7Jc/AhQ5+PQB5+uPW5HBacKL13JjZuTUwtHmLh7rox/6aIru28bx7n0zgjQqTMtbYBhIEGP7XxH6ZpgY6/nbWNz9hfCTp+P1iufyMsorh8I846rVI9l6R4XmKqE+8WtG8Ik77A/H+Ua740HL2yb3UjOzko5ej4cFHN8KMt1ZgSCDFDUn6fxJJogZbaRs+C4cg7tr80KTTfkvElu8EPS8Gwkro11Ig2m1YMtrokJr8+VWxCFwWmeDWoioS45lLmNtxusT6HzhmCXDxwlQWGPc/L6FF76tjVSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPE5oTdqQv0rdL5gDZdNlzOpVxtbGPFUWiTFxr57Skc=;
 b=oFKaKqz9HsQkr/EeoJO+CsCbX+5kZn7F/vaUrRZ85JasuXoEW/HmXw6pb+4GiefDDRbwj+WA6b7GPLZtSy/4Q35Wblivpck3yzi9Nj0g7O8nEgma1pH+/91SH7ohzgwLnDcGJLuShAO/o35L7AopF9magk6yeTww8n4qStpg6rY=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4899.namprd12.prod.outlook.com (2603:10b6:208:1cf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 6 Aug
 2021 15:09:10 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 15:09:10 +0000
Subject: Re: [PATCH] drm/amdgpu: check for allocation failure in
 amdgpu_vkms_sw_init()
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Alex Deucher <alexander.deucher@amd.com>, Ryan Taylor <Ryan.Taylor@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20210806150518.GC15586@kili>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ca0cfa01-e1ef-1ee8-8adc-ebd4fa253e70@amd.com>
Date: Fri, 6 Aug 2021 17:09:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210806150518.GC15586@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P250CA0006.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:18c9:395b:c9ab:9837]
 (2a02:908:1252:fb60:18c9:395b:c9ab:9837) by
 PR3P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 15:09:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2ebd3f3-f4e0-46cd-ce9a-08d958ec24a2
X-MS-TrafficTypeDiagnostic: BL0PR12MB4899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB48994B46EA0AB987489025E383F39@BL0PR12MB4899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UFFNiaTtir5ClVnxTG1+IU3uYox72xgDYyVjJgnCXekjejYvcgRfPOIHw/hPeMwMwpN/DBVXVxq/5WXtTOu+NeYwt5D+GDzSJuHc2rBTM7TIsN+Yaqx2gi83Fb5lRS8XNwN8hyX//kuIZHUbKNZMaGelEJ6L7xXgurjwkwqf5AOu4UaasoJBtrFLJj/GlCvnexnxv+KcFu8s3et4G3hWApf6gSkyKwjYDU9rFDP73t/Q4PiKdYfSU9HDsv3c7/E1D/KaBwyxDJ1BgChaeQlyWN9LzYMNP+kn8F/Lfq9fmKGieTSv38RqJBqcn9x6V0cfenKMNuLgvMJQ/dtcTNfwoapAkjT54qYR9CbVhTE4hCxJzYozCEjIAw50XCgcJvduroUYG/a6y3c684g54gpvdSXVuwtAHbLcr9X46AbB9z8gbg41X3tZzrCLYEYmKttq7L3o5o62P/vnBKcf+U54nHJVZvdyu7B7l10UZkXZfmardEsdcen84SNfIOu2il3Wy3IE3buJto7dIUkFfFJOnvfPZlDc51Ww5wfwpMx5DKTVV8Pr9Q6sX7tg+vPDcBV/Ni7lxsq45mdvLsES2muiKK+BASZFUNC8tM6JfzENBsaw3AhUNqIyORtYPd8V8UHsZzcCputYb4JZI4TNRYWjCMsjxmS738IRJqTysW+vqB/sS8OKveaIY7KZ9ILL6ZYL0jmhD6Qx1v7AJe4EH+75oWxl5tfopESRUZZs8qAEyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(4744005)(31686004)(186003)(36756003)(66556008)(6486002)(2906002)(6636002)(66946007)(66476007)(2616005)(8676002)(5660300002)(86362001)(6666004)(31696002)(110136005)(54906003)(8936002)(478600001)(38100700002)(316002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXhyd0ZYSEw1T2w0RmVuRmI1dHZLR1FXczNtdXpjMEYvQndnUDAzSHM5am9q?=
 =?utf-8?B?SC9RRUM3Rzl4bE9OczZmOFJPcmtITGVGc200ZURVNktxakRkbkh2UVQzZkdp?=
 =?utf-8?B?bkNTRU05dk5zclBEZ1RiNW5lcEVPdVAvdiszWWR2Tkg3Z2dVSEllKzlzaUEr?=
 =?utf-8?B?T1RycngxUGZOM0UycFFVVkxnODlqR3ZrUENBRUdlaldWMDlmQ3NESUlFZDBt?=
 =?utf-8?B?TjllbDhQSWVKVjl6QjR4bGl4YW0wc1pyTGN4ZGpGM0c5WTA3Rk1BTjE0WWFO?=
 =?utf-8?B?K3hjMnpXYlFBZFhpS1JaaHdVR3ZLNm95R3RBRGkyT2hkdkRUbFFremVKSmlF?=
 =?utf-8?B?bEJ6NGtYSzFuOUptUUtTbFdDd2dwMGFEUnM5VXIydERPUWlZbE51cURkaFNk?=
 =?utf-8?B?UE84WmRaV0psZ1ZsZHJzZE5BU05nYnlZS1ZMdjlKY2I4NCtMZFdXa29aOU1N?=
 =?utf-8?B?K2trT3BJZnpGdi9za2VkSGNzY0QrLzFKT3l5YWFYSDhYd3loTDBWb2ZyeDVy?=
 =?utf-8?B?NkIybldFSnRNVmQ3Tis0U2xpM2c4SEtqR0lzSjNCVXNabjAwK2pLVkhqY3hj?=
 =?utf-8?B?MzBQWmJwVmNPYWY0KzFra2owekEzcE41QXNtQS9rNEpIK3ZyNkU1bnBnd0RC?=
 =?utf-8?B?bm9LamV1VEFpZldQMTBhYTJ6VUhGVUZ1NFdnMlgxVENmd3FTWnRzZTVkcHRj?=
 =?utf-8?B?QjVOeWVVajVlbzlSZE1VT3dZMFZ5MTZhMUhoTXpMNWc0REU4OEVPdkFJTVZp?=
 =?utf-8?B?QXFkcGxlblJZSU9VUlF1VFd3TUVka0JmYmYxdVZKVWpRWG1uek44MHhDaTBT?=
 =?utf-8?B?Nis2bUExYS9UZlBYeXlSQ3B0aXhVRHNtcGg5cG5aZHRmL1dRa3l3Nm4zYkJU?=
 =?utf-8?B?aTdrU000eHRPMmlocHFHckpGazA4UGlLQnp0cVVHcXBBd1V0NFliQ1R2L0dQ?=
 =?utf-8?B?S2JtNS9LQmI5Sk15Y2dBUDJhUlpMc05QajNNQWVsTDYxbCtueC80cDhCeXRN?=
 =?utf-8?B?VFVMYUlYcVpCMERDM1h0ZklPY0swejduUnBYL09zZ0VDMHgwTTd2enFRQzVv?=
 =?utf-8?B?emRZTTNmMFJjK2YzY0NsSVM5MFpTVVBNaGQ2ODR4THJKQTdQMzRlTWN5TXo3?=
 =?utf-8?B?TzRHRzlHUkVxK2RFS3ZyZFVMU1B0ZUVCOXdQQWV5MW5SajU1anJOaElnVlQx?=
 =?utf-8?B?TUdYYnNUVHlBQXRsbzZoSEYybjJReE9hZGU3RjY1RFUzMlFnRGZkeC9XLzl1?=
 =?utf-8?B?UjgvOExvcTdPWnozZk84T0dZclVEQjF1L1RyNlRRcHZla1dKVjkvMTVIWm5J?=
 =?utf-8?B?WW4yM0ZRMjFmOElJSFJXdW1JTmhBSTVvWjBVWTlCcVFHN1BsM2k1ZTQwS2hC?=
 =?utf-8?B?RC9uYlVBSG1lZlNaeDRLTDdUZ0NZbzJpcUpxU21ncEdzM1oyRVp0cmtoRFJp?=
 =?utf-8?B?d1lydmtVRU1sWUhaY1Jka3hEL2xxc2pJQWp4ZkJwcWV5V0lhS3JKTmlZTUt1?=
 =?utf-8?B?ZHhVdVN2emdjYmRZVXJweUJqZ0g0Y1VJalMwMU9hdk5PRzZndjRDb3RJTTBm?=
 =?utf-8?B?Tlo3TFAyUDZwc3h5eFUvM3hOc0lKT0hTOWVrQ0pPY1FOcUZlS3N3ZjQrV1pn?=
 =?utf-8?B?aForR0tVbmdaRUV3WGFHQXV1QWFDWXpuWXlPc0hoa3U2bk9LZDJlMEZ1WHZX?=
 =?utf-8?B?eWlsVzdhM1FSbWtOam9pVHZ3N2VLajNTWDBHdzRTMXhQUEZBU1h2UXRCbFMr?=
 =?utf-8?B?cTMvcHpxTmVtTmtyWVc2SW5qcHpYbDdxSVRXa3JsenpaaWRFeU1LMmRFSVRn?=
 =?utf-8?B?Zmw2MlRIYmJtR1ZDMmlOOE5EMldNRzd0RmhUOEI1QTIwNmJWN29DbUdjbUcy?=
 =?utf-8?Q?ilPA4Fg7cyQXS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ebd3f3-f4e0-46cd-ce9a-08d958ec24a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 15:09:10.2130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP7HfP7bYVqWDpe8Ob1JNjdCeo9h2l1a/XMATU5rZBt4SpAMCCmYSwCsUg5KnCz6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4899
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

Am 06.08.21 um 17:05 schrieb Dan Carpenter:
> Check whether the kcalloc() fails and return -ENOMEM if it does.
>
> Fixes: eeba0b9046fc ("drm/amdgpu: create amdgpu_vkms (v4)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 50bdc39733aa..ce982afeff91 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -482,6 +482,8 @@ static int amdgpu_vkms_sw_init(void *handle)
>   		return r;
>   
>   	adev->amdgpu_vkms_output = kcalloc(adev->mode_info.num_crtc, sizeof(struct amdgpu_vkms_output), GFP_KERNEL);

Is the line above not a bit long?

> +	if (!adev->amdgpu_vkms_output)
> +		return -ENOMEM;
>   
>   	/* allocate crtcs, encoders, connectors */
>   	for (i = 0; i < adev->mode_info.num_crtc; i++) {


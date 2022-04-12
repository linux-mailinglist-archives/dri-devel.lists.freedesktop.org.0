Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F64FE9AF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 22:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0141310E79A;
	Tue, 12 Apr 2022 20:52:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E59D10E752;
 Tue, 12 Apr 2022 20:52:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3raf1EK1oWNGJ0N4zFmZ1W3+4mP4JJbmNeSWU1qkudXwjeIdomAzb8jOYJHlrkm6pj1uqtRIvDxHhr1lRiCr9RQEvU1/HAk3J+6b7Kmp9RWhLLh/DKvQ3aRjSlKp6S+Cp5VYVnPeFnFSF33VYdfTBQ6k/IHkfb/cCvtVD8WtBq0nuZ/35rDKhTDsDDDmn1L/XNokNbuAzKWMVo2TEAS1j9kWOug06D6btnZSAPaDtozFo0jgvgagrZSsXTYwGhm6l+khUCCcQdt1VGeKIoQHZrnZY/D5EytZSUYKTK1PpFFKtZQVIMSw2SgOxDnZZ3valBoNJxmlgcSf/w7/ISSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fOYpj/CZHYPcQuphC9Wcs6ImNt6KYcylM5y1cC9ffbM=;
 b=dHNR7U2GxwiPzbmY9oA2brOy3btHPvsaca6waQrQkIdt5PH/yUkacFPkxJNzclEfCVjjSwZgIEUYUm2RPjue2m0ctAJMNiEYEd8aGZyxrbEhj2+/aOYksCCxyTL53Ij3S6WaFVmBLMwR4b9hnzv1xgTAWIXQhcHge9Vqxi3uhiMiVjPQisLzFxgLdVsRzSUt+5TKEznPatk1Co+L/zwLpXIcKQRK5hKB41NaUIE88igm5HxWFy09WF4r5VTyo3Cv7/GaiajtxTRaByC8VG42ku8BfVv+Mu6n87FcCSDYFnpHF6Wcp3wlgznPmsVduCz/1dW2Jjk0/Dt7dk6wi6nFbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fOYpj/CZHYPcQuphC9Wcs6ImNt6KYcylM5y1cC9ffbM=;
 b=A3KRueRI2ojgPdmI/7mNODbnJ72BhNEMrcSeTJw0e5r2L/fSQWQnrn8KzAFC2s8QXQqTga172UrPjsq6ElTAnQCv0T0cViDIbOARteU83kUv4r/eYZJaKUtbHPBeVfPqjTRSDqzcHVayHmKxf+JDXSR2iHFSuBegQfJ6EMO+J5A3Ey6y85jlOaGvM+JSVoNV/gf5Zt8hg45N1MaTJ6nNPBxOBEKcVVBn65CkBXdwS/2luWt8woGwO8c7hrK/lWhc+epY2GjZVk5JlIZTvQ7mzicfq2KfkvcQPuLPwTn44r0uSbxdxWzwM6LW+qxewkhYem/XLGeSxrTC4zJ8h/PK8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 by MW2PR12MB2588.namprd12.prod.outlook.com (2603:10b6:907:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 20:52:44 +0000
Received: from MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665]) by MN2PR12MB4206.namprd12.prod.outlook.com
 ([fe80::211e:d78f:c944:6665%7]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 20:52:44 +0000
Message-ID: <60b41d41-0f74-2123-b51a-d77f66084dba@nvidia.com>
Date: Wed, 13 Apr 2022 02:22:30 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 34/34] vfio/mdev: Remove mdev drvdata
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-35-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
In-Reply-To: <20220411141403.86980-35-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR0101CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::20) To MN2PR12MB4206.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a302730f-799e-4048-8536-08da1cc664a3
X-MS-TrafficTypeDiagnostic: MW2PR12MB2588:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB25887ADDF78EB80E84AFCA5ADCED9@MW2PR12MB2588.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kzHGh8EkHxOfpxtflEeyZB3R3q82z8MQvpkYmcHR1EAdyYZeWOa3qCMy3adiOfiwGm1w54iEgM20TxEKDRLgUpWtjMMuqGcMXTRougyLEWdgDUzlENazxcjaiCaMgVpxAnQaKJBam3AHqwJn5ifd02UPneLLhFwGlhuG7F0mW4iHkorSwJ5aE0xM+/smFb/ZyiYJZTAdLUKKOy1OG6xQv25bJ6k471M3ESTBe1/ejSeMYDcncbxJL2SlJLPB60SZCKsqUdjddxrEzTzhbqg18g8pwSAMWFCKEWu0104bVuo8BDB+HwkLCd7b75bXdCGbEUZp76niql5xoh9YDZOfN/eJFsfTylGOOpHW7ch2LilBQ7Nxhn4LLvmH5hjd+3nWr96+4rf3vwpWpztW7Giu2eQ4TVUgRwbn4wYkJQ/+h9ap1UkXJDgVB22n+fg1AOiNOalPyWp/6KFpGx1HA8Li+1pDihrRAniz27aJ/ojj27uXhf/SU9twDfmqdAAmFVHY+ICfRgNb1X4ZPH9+znTTTUmaM8mhlz2L8yJYZrPe2HsTpcnFLoxH4tXPBYN+RoctnE3YDc4tsu+HTto4fnTQIruQoeP/YTAD4h47CT4OXZAsmloxSjxVU0JiUWhzb9HLaiTpYeNPrGNmNGnluuxgOJ0BxgyEO8ASjUb75VIyCiKfZEWVfyZ9efTsJUh6da60UdXkNXdVmMtCe8ZSiW1Fo4zZitsUv0OyiPVxuNd7d2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4206.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(316002)(110136005)(6486002)(4744005)(6512007)(5660300002)(6506007)(26005)(7416002)(83380400001)(86362001)(55236004)(31696002)(8936002)(2906002)(38100700002)(53546011)(6666004)(186003)(66556008)(66476007)(2616005)(36756003)(66946007)(4326008)(8676002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2htSmZHME04aGVvRFVFNnNaSG85UVptd1MwUEdUeStmdnc1ZmlhaE0wSEM4?=
 =?utf-8?B?VkVmVTR0U2tpVGxRbmo4enhENlErVlBOYzRZQ2hySjVxK1VZNUxjN2RQbmtx?=
 =?utf-8?B?bHlndzBZTVBLand2TXZ1R1ltUHI5YjVPNmhHZ3dlazhsVVRZY1lwSEptNXFL?=
 =?utf-8?B?MkNHd3JETVlQUWx6dzhzcGl4VHpyOHc0TFdIbkdUOGs3MDcyU2RIL2xITWZ2?=
 =?utf-8?B?dTZZRUsvSURVVE1qYXJxM0Z0RUwxdlAwMjhDSXdieFE2OXBUOSs2Q2F4SWRW?=
 =?utf-8?B?aXVyeEk0WnZWSFhXdGJRdWpCMjQ3Q3l4SnFrOVMvNXZaL3ZtcGhBMWswbW9w?=
 =?utf-8?B?VEttRTVMN2g1bXJIQW9sU1F0bHlYOE5RbXZxSUt3UmtVa1pScW50U3dNVjJH?=
 =?utf-8?B?LzhpS3ZoQTVUa1hSSzAzRENyWlJaMUx3eUJkaURialB5Wkl3elpVcTVmOVBM?=
 =?utf-8?B?WWczY3ZnVmgvMXlKa3l6VW1LdjN2WlhkWHNDYXcxcGw4aWtxb0p6MHQ3RVI1?=
 =?utf-8?B?TjRWZUR3elB3Yml4c3N2dmpzQ3ZhaGdKM2ZCTW1nZ1lzelNORDUwL2EzKzhI?=
 =?utf-8?B?SzlLZ3ZiYnZrSHVHWUZaai8vQ2MxRERGRFpZNXd6R3hDc3JiNUw1SWhWMzZi?=
 =?utf-8?B?YlZaOFEyTDRqZi8ydUdHUFZhUTFjZEE3K1NPM051M3F2VGF3OFdwTzRobFNt?=
 =?utf-8?B?QlArYUNZUjh2bW9NTzMyZk9ucGxKN0NkU2hXMEFzQXNTVWdYajZSOUFOeENR?=
 =?utf-8?B?VVhNTmtIWUwzZU5udGhTWDZFNzVPU0JoNHgrU2hUOWc3VEFhWG5WakxmL2dm?=
 =?utf-8?B?NVdpVHBFWTVtZXN4QkJnZzFDMENjN2wybGgwRjIrQlN2MjJ5TWhCOVRPZURx?=
 =?utf-8?B?VjR3Wjc1LzVLSWVScitzeWYyUVZ4a0htYUZKb0FpY2tTbG1kemtWT2cxMTFx?=
 =?utf-8?B?Y1JnOWNXcmw2Y1Q0aDFYNXJ4UXBwMFJQWGEybHltcEhpSlJtNlRxOHVzZlda?=
 =?utf-8?B?bHIxQ3hLNWtMQmlsd2k4RXNVcDNqdFJncEtWNDdMOFd5Y1pPV2s2bUovQktp?=
 =?utf-8?B?VS9XK3dRbUEzZnYyYzFEd3hZTTJ3aXo0ckhsSVgvMzlKOUFEbkFwaFI0ci9F?=
 =?utf-8?B?T3ZKL0xjOFJNS3NySWJ4R3FFNm5WRjdiOVh3TFhYYnU4REpOUTNCQ3hRYjRy?=
 =?utf-8?B?VVZOaUhqc0FWLzV0dHliVnY0QW5kZVVuTW5CMTJJYUVWSThXMWxxaEFKNnQ3?=
 =?utf-8?B?cTFSOU9iNmJlVXU4b3RNNHdQUURZKzZJa1NBb2U4UzNsUTJBWi92U2wyWlVP?=
 =?utf-8?B?TXNYNEVnU1FML2l5dE8zcExyRThZV3ZaK2FCNkUzckVUdjdDb3VIaVYwUEkx?=
 =?utf-8?B?akRUaGliS1c3MEVEYStwcWViNWhqOGdjUjcxZkhSVGRBUE4zWWQvRnhBUlZv?=
 =?utf-8?B?WFR5blordVJkQktsTis5WFRlR2hobGV3MURrN2ROL3pkR3NkS2JicXJ0UUxW?=
 =?utf-8?B?MWUzTERhS0J0MytYR0VMU0lMRDlqVGtFZGU4ZDE2azdRWHEwR0E3Q1dabVlW?=
 =?utf-8?B?SWlYeTVoMmJ5MGZrZWVLVGdVRmx3Ti8rYk9KbFZuTS82Kys5b0h2bVNqaE5q?=
 =?utf-8?B?V0ZtWXh3bEFHcTZjQkgyQnV0VWJ2REFPcE1ybGlHWjhrcmszQlNCeE14V2di?=
 =?utf-8?B?dFcwQkw4WDZQd09oTmc0WEtIUWpndHl0dkpsMTFzVmp6VTBuODl6K3JUU1Vm?=
 =?utf-8?B?a0h2MjdGMkhrZ3c4QWhoaFBPQVQ0cUg5WksrZUVnSnQ2RyszL3c5c3RBM2ky?=
 =?utf-8?B?cTBSdnNDeXRPcmZzT2FsamR3MG1yS2VpRzVieXp1L0kvSlBzcVF3NmRnVUFE?=
 =?utf-8?B?ODdxeEZNS284UlhyWFdXdjhPRnR1M1JRU2I2QTN1UWdCWGxKNDhsVnFYVDVs?=
 =?utf-8?B?MXZjVWk5SXR6bEtHakRDcUFjUjFsaTQwV3ppMW9HL01jSTlEb0lZZ0dzWTcz?=
 =?utf-8?B?Y0lmNkRsVGFGeTZZbGRmVU0yM01IQzV3NnFuRi9vOGtuZVRCeXlpdzlqTFJx?=
 =?utf-8?B?dFVqTDVER1hyU2xWRFYvWXZ4Q01WQmJWSS9raWhsc2JzYVpxNHQ3ZUZRbjNs?=
 =?utf-8?B?T3ZSeTFKcVQzM2o4dG1wS3BvblpGb29SL21XNHExMmtlWXZENVZSOWNFNmND?=
 =?utf-8?B?Y3NWVE9SQ1pxYnN4Ujh5eTVaUnRyWnZNWUIzcjVrTUhPUUl1Yml2L1BRZVdq?=
 =?utf-8?B?amVoeEVHNHRxbDJ5SDc0NGxsMEwzdW5LQU5iaVptWENhdzNKM2g5a01PN29z?=
 =?utf-8?B?aEs3Wng1SHQvVUhGeXVBRGVBYmViWXpmUmlVUmlxazZXSWpEZjZnQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a302730f-799e-4048-8536-08da1cc664a3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4206.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 20:52:44.8071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocgS4ZNdGueNpgulFxGlB9jXIiV+i2tFxT8j+2V5iJm6i+fXRPWu05B2El/zbkX3/Goa4qOgqblAbR6FTiYOzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2588
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
Cc: intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/11/2022 7:44 PM, Christoph Hellwig wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> This is no longer used, remove it.
> 
> All usages were moved over to either use container_of() from a vfio_device
> or to use dev_drvdata() directly on the mdev.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   include/linux/mdev.h | 9 ---------
>   1 file changed, 9 deletions(-)
> 

Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>

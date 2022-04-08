Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046414F98E2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991E710E51E;
	Fri,  8 Apr 2022 15:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2070.outbound.protection.outlook.com [40.107.102.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF3A10E1C9;
 Fri,  8 Apr 2022 15:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8Xtnx/Flv2ylHqjqD+4e7F7w4PviZJiN+0BeZ52BuGe8V4Z56//HAwbtKTIVTRJV7Lw0Ife0V3spMF8Ez32KBxu44DwelYmrObq8NstT1hWfh6IJzuP7ziKmDTWBErMGy4ZDCMvGFu1pfyYykzan/VrVDabO7LqyroLXL1ygHvAr7WooLK5Ob5Odr6wQ1aU8LwU6cPv/8N7mK+Mp8sNk5xumV0T3OlUBlIA4Ko/CB91xM3PSdUesCB5joM+k4Es0U3rHwdffh98y3vHeWwOLvvmA/TeOLwpbAt6Ow8FP6iWJ5TcbUXdd5/iUIBoAbaz24qsfgCL1Sd7RRlGXWLdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Alr3H4bDzjhXJa1CJELJElUeHOf8iZ77KeU8A5dRMDo=;
 b=KHiwM8ihcnwoZ/pWkFDCcQhu83Ahe928sWVY6I3dmZrEFqy7gZVQqx4hdDejvBHFh644Ra0dLBs9ZvQguzQgNdExn60t3cOis+d6OW9UtU9BW3FppKrBCqH+nuWdJ8FQOETX/glnFWueDkc0lvBHT/kAk+8F/vdBodEfYgp6Zd5tjPapA4wKYIEPP4mrJSAW/NrfIaI0jAsb/8r6neDgrPsUuyqPX3ien6NpEWJfes2iR568BYyed5epp9oiFRT1WAmS6zetBozXJE4VzxH3dCs41Y3K+ZHocKoiDc5CZiZd3BPD6arGBkdUPmNqoOl9DxRvyteSYdJecOhmFAM8+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Alr3H4bDzjhXJa1CJELJElUeHOf8iZ77KeU8A5dRMDo=;
 b=jf0LYNu9fJaHFvRZtrfz/S8BgCW2SGR0PKBC8Sgjz7PUa6XfJsqVWB/H4rHhgww45zxO4zTYmlyk4ZNsLlJ5oDSHA7WjdOLWk4kvOIyB3xl+aZcdlYnpWKOOGvwI1mWGG2bMUdUcLNT5OECQTG2uqU/Ia8b+dmi68W4JOeFSUws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BYAPR12MB2744.namprd12.prod.outlook.com (2603:10b6:a03:69::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 15:02:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::61e4:a6bf:9444:31f9%6]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 15:02:13 +0000
Message-ID: <375fd7ff-a68e-d5c0-ff0d-bd6b50e90b93@amd.com>
Date: Fri, 8 Apr 2022 11:02:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/3] drm/debug: Expose connector's max supported bpc via
 debugfs
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, swati2.sharma@intel.com
References: <20220408065350.1485328-1-bhanuprakash.modem@intel.com>
 <20220408065350.1485328-2-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220408065350.1485328-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::14) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4560155f-751f-489a-aa25-08da1970c2f8
X-MS-TrafficTypeDiagnostic: BYAPR12MB2744:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2744137A2AE878E77951416F8CE99@BYAPR12MB2744.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GX7Qp/jv8NYY7zCKffkRqn0hppIub2btXjc2weCb3dbTdiB3YuluVdRCa3OjjBOdm4XlfpP6mXFo0IWENIgtkB7AeYFG0iN45hVfFCO5XsC2ye8gFjHPTY9b7rHSglcJg1rrZKMVF2eKsqbEqIX9C0NU2cndW2mLB2LWJ8sP7UuKkmdZv1GMguZYsBFgkQFwpm2zMNJoJwYO5ZZmPvX2u5r3XSe3X/PpBgWri1ws7FRgb/W8Z342aNVgXsh5UViELUsLIxsbB0jvMKl0B3od18oA3fG+OWOGjN67lWXkyJ8m0iBuhT4di/m+y+6aQ5WGaRDcdyLE4xSpfHlG4rnCtHVwjqrP7ZTXuojuB9/eZn1F+4UEF2C3B6XLVmtdWFmnEOMfxRU9k4EvzdtT9ICkQQNzLDO+qHDYR/jcLa7gLSNTlHHJEuD/KjAUMycIDvW0fpukh633ahJAykDuFuPGwtsA4NiujSvF6fDaICm9+p3Bj2s2J4Aa/jHDnHUUDAP1e7xWYAMikDmJP/NiO4OtIwWSjcXD5pPOKM0cvuBb52zBjiJokV9CxyrWOXR4uYqBgXjxjNEvBGyWZVJ8kE+kLXKrA4lkRhPlvoQQ1Vy6pAbqzVXVx5tb1iWjC3h5deWXIsuVB56FAxSXWgQf4jXXll3jnIua96ZaEctua6eHdacRQaAPtT4QiItSolXGhWcw2jI+9lQ5KVCMgufXByQCwZxGS566Tg4TX7SA9mvs8Eg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2906002)(6486002)(6506007)(31696002)(8676002)(6512007)(66476007)(5660300002)(44832011)(186003)(26005)(8936002)(6666004)(53546011)(36756003)(86362001)(2616005)(66556008)(66946007)(31686004)(316002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHpnUzdtYml3NG5xV3dreHNQVThQeXN3Q0dRMTd4UHNDZVkza3ZRNUw0Zk1Y?=
 =?utf-8?B?ZXBSalpEV05mRk5Cck5pWVhIMmRyT1VUWlhoZ0dlM1hQRmdQT0NEYVprTjBo?=
 =?utf-8?B?SnlMRW5VZTdMV2pHMEREcTY3ZGVoaEt4bXh2ZGZOUUkxemxUL2JYQjdkNnRw?=
 =?utf-8?B?a05tbzFIMGk1cHc3Yk1iQ0M5TC9LeGd3RUsxL2hvQ3d6MFdLeVNMWjQ2dEVO?=
 =?utf-8?B?VmR3S2czenozRFNrV0VwUnhSZkV5YjVaQVpEY3hEUnhpUUpvRTV1RmszbU1o?=
 =?utf-8?B?dlhLMXlPRUtzanIyWEhqaTV4WDlzN2RiN2QxRzE5c2R2TEZHdTdQRzJPMjVB?=
 =?utf-8?B?bjRrR3N2Vzd2S042NjF1TFlPNzBEQXZhQUJrdXN5MlZ4a2hscm53OXhqbnRM?=
 =?utf-8?B?RzNlOFlrMFFaOG1qcVRUL2hkQTliYUQwVlRwd2sycXNuZG4wcWtpNXdoUUhF?=
 =?utf-8?B?Q0JRR3pRWS9nQmRETGxFd2luM3Rpb2Y4bmtWRmswcTExbmQrY0V5eTJpekpj?=
 =?utf-8?B?NkhZSkd3NE5aN2tyY2NRcXNmcnJHSmlUTVlnRjMrQVVnNExWcHNkanBrMXlL?=
 =?utf-8?B?Y0ZwRWk0eVFaYUlXcnhMWUNSLzFiOHRLN1VaeU1xTnZDV05HanI0NUEweGlL?=
 =?utf-8?B?aU9nS25oWjlOaHc0NXdNdllPbkxncXBMRDhZS0prbUhoQ0dnQWUyaW8xT0cw?=
 =?utf-8?B?cWt5NE5ncURXdnpsSklQenVlWUoxbVRIVzJBMzluVU5KclloQ0pqRzFsQjlH?=
 =?utf-8?B?anlaUmlVTktQOFRpK1RqQlhNYmtMSlRBR2YxK2VaWEo4ZVZHd0tDNXFmbjhJ?=
 =?utf-8?B?VzQ3dzhVaHJDeGR5dHh0OHQrQnZyOCtJWkp0ZXVZZXNHcDF6djJrc002VTdY?=
 =?utf-8?B?OGpqK1ZRQU0veURNRENZMnFzTWk1WXE2STZBTjZnOXhGWjRhTDNJRjZQK2FG?=
 =?utf-8?B?TG9BakJKWExNdkNGRGdDcFFTR0V1QXFhWjhSMUFoU2xRQ3ovaHNlWUoxZkV0?=
 =?utf-8?B?Q3dDUjA5cE5MUDdwV1hKNzlVcm5lYkN3a2J4ZGZydWRXbUxETkdwNE8waVBX?=
 =?utf-8?B?U2VJSWg0WUV1U29YMlJEMXhROFVTMDcyNlVGL292UUc2SU41TmNvSk9jYnBi?=
 =?utf-8?B?aGtBZjB4NWc2OWx5UUc1S3Zyd3VsQm1aMTRaM0YxNzZ1c0ZrMkFKNUhNZUp6?=
 =?utf-8?B?YndweGdyRGo3NGVWeXV5bURLdkVGeEFiSjdFSVlIRDdpeVJVb1p0aVYzNnZy?=
 =?utf-8?B?TWFBMU5JTWM4K0Z1TkJwblMrdlRaZ3Rqand3SkhEY0Ntb0NjNytmUXAxUFBj?=
 =?utf-8?B?K0w2dzVhbUhsMlYvZkNYM1JyUXhLeldDYmE5bk0yMU4vT3JybnhQOWo4aEcw?=
 =?utf-8?B?d3ltaFVyS0lyK2VySDI5aGRlQ0Y4OHUyRFVjamFiRFE1SkxHTDFuTHFjOWRj?=
 =?utf-8?B?TmRDSmVHdDFqMTlzVUJkUW1NdWIyR2grVFNSb09SckNOUTdnR2FBUmFKMXFD?=
 =?utf-8?B?TCtrTG1oRzhnV3dMamJFbDBNL1lFb0VmdmJFMnVCQnJEdGUwMHIyNDl2c3lG?=
 =?utf-8?B?bS8reDZkQ0FtVW91enJZZ0RZVWRLQVVONXlDNHhhUVA2YWN6WjRlOHNKbkpC?=
 =?utf-8?B?R3NacExsSzJGV3hsR2szR3NBc2U1NzNqNkd5aURVT055Szh5amIwVEFrUnRC?=
 =?utf-8?B?eEw2YlhuRFZOcFdEcTR6SFNJWG9IZ0M0VXlKOHNWd3FsVHN6d1Z6aC9Zdk5u?=
 =?utf-8?B?ZEE1Ui9SbWRDTjRLdmUrVERCTmZvZmR1Yi9iWXRzNXl0U0ppN1VoQmdpKzlx?=
 =?utf-8?B?c1VGTHFwY01ZUUxvU1NzWSt6amhuYm9DempLd3RPaU1Ed09ZTnU3NGljVjZt?=
 =?utf-8?B?eUxocGNxRnZUNGk0THNtSmwydndaQXc0SE1aMFN3bUxQSUZnTmpVL2ZtQk9w?=
 =?utf-8?B?M0VmRkZlOEcvS1dLU292SVlGbm5GbXZ3Yjh1MHE4RzVoUkg3RTNiWWJTWWFq?=
 =?utf-8?B?c24wQ0krVm44NXd2MUR3UzdxTHFaWFFsNGxkZDB6NTl6NmtqYjVnUXBLaTBs?=
 =?utf-8?B?TVVkRGdScnFOOEtwc0cxUEJ5TzZZNDZSY2tXWGxFT3puS09KU2dET1VQZTAv?=
 =?utf-8?B?M0VYc1RzeDRDM0UxM01Hc0YwQXNaWlBoVTBidWF1bVpnN3E1YTBQT29HSGFV?=
 =?utf-8?B?QlBqcE1tV0lnRGRGZGNnRlI3bUoreGxpUC9VSkxtOTB3cFhoU2owMHdsa0ZW?=
 =?utf-8?B?YXVKdER5cFBsQS96U01LZUR1aGJZVmc4eWZiWkZHRjh1TE53M0w3RVVWd25a?=
 =?utf-8?B?SENyS0xtWmtqb2JCZ3l0cXlZcUNuTG1qWGFoTHpEWm1RWmxpQVREQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4560155f-751f-489a-aa25-08da1970c2f8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 15:02:13.1328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Qatc6hHPAaAH3wTY28OhZz4xict5ystoEhjEwMoYuQznnzOj+2fHH531k/Bfjw0JaKMym996UeQQxLBU0wpQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2744
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



On 2022-04-08 02:53, Bhanuprakash Modem wrote:
> It's useful to know the connector's max supported bpc for IGT
> testing. Expose it via a debugfs file on the connector "output_bpc".
> 
> Example: cat /sys/kernel/debug/dri/0/DP-1/output_bpc
> 
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 7f1b82dbaebb..33e5345c6f3e 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -395,6 +395,23 @@ static int vrr_range_show(struct seq_file *m, void *data)
>  }
>  DEFINE_SHOW_ATTRIBUTE(vrr_range);
>  
> +/*
> + * Returns Connector's max supported bpc through debugfs file.
> + * Example usage: cat /sys/kernel/debug/dri/0/DP-1/max_bpc

/s/max_bpc/output_bpc

Btw, in amdgpu we have both max_bpc and output_bpc.

Harry

> + */
> +static int output_bpc_show(struct seq_file *m, void *data)
> +{
> +	struct drm_connector *connector = m->private;
> +
> +	if (connector->status != connector_status_connected)
> +		return -ENODEV;
> +
> +	seq_printf(m, "Maximum: %u\n", connector->display_info.bpc);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(output_bpc);
> +
>  static const struct file_operations drm_edid_fops = {
>  	.owner = THIS_MODULE,
>  	.open = edid_open,
> @@ -437,6 +454,10 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>  	debugfs_create_file("vrr_range", S_IRUGO, root, connector,
>  			    &vrr_range_fops);
>  
> +	/* max bpc */
> +	debugfs_create_file("output_bpc", 0444, root, connector,
> +			    &output_bpc_fops);
> +
>  	if (connector->funcs->debugfs_init)
>  		connector->funcs->debugfs_init(connector, root);
>  }


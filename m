Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D067942C8F2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 20:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12C56EA7D;
	Wed, 13 Oct 2021 18:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AA176EA7D;
 Wed, 13 Oct 2021 18:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wer8301AQOB2NeMW8eMU/0N6Wd5JfgT4HiXYUZtpUInu9U+HDB2kkLhOKKU4nvJU0Tu2ZjRVOpHZK48bF79WKa1tbDEa5UMIU0j7gRTCAuSQYiYSdQ5bf2xAYlitF4YYSdI+a+USe6ETJfMvu01G5PLTvmdjViev+kqPUotVIRtD8++hL93+ZiM/EglPYR2O5GPMzpJ1IUnjJyxeU0nm8xK19ZwOHtq3QSMOKE0rKJgQLu5GL7QV/ffTM5b7A9Pc3aNxcKJ5doFAAInwz2e1o8lnj8a5rJwtJ376iutP6WZDcBsM1maRpw+b8GPdov4bbl8K1ig7Ot/zlAxA792N7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6zClk6k2XhRSXUHhAqx+7TfcK/Tib4Wa0wZfhN4Nuo=;
 b=cY/aKyw4qFjZ7DYH2EUgArM8IzFWYFo9Y46J+73jAvA7GrfzIcNyBlXpf1IXO+9uZuJZ/uDZXrgOPAT5YSIva90Y/ldpzVpeoRon4Kza+aucJ/PHZf/nrznTjRkGCTZLy361x3Q5g/Ms38tWN1ML+sn48jYNfLoLx+tE/Sd0YxATEjItwHTlf3b73TGotI2AsQk0FJ6Bgw52mFEy4DvOdE1cw57vZuQ8yBav0RPd4h7udOwnGhJ01G2zZi+BABs8jYn/+jxpcoKkPmq4MsLSutto/oHSbkUCD7PuBOWpZXh8Tq+d4oz6NXWZJE7TTzedfr16nZPhiq9phuUMjv8PIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6zClk6k2XhRSXUHhAqx+7TfcK/Tib4Wa0wZfhN4Nuo=;
 b=bIE9DMbWxM1c05wbcWzem7+H/UoKIz1riz9gXilHPyH/TtO39vrU+O80t01/l84kbDQxwJwHqw3VNzjP2dVuGTMqx44GerOfNvD4AkNeQ1fDsrlFaVlJInWcPfk1BSM34WfQpqVyb/TJWsKLGlODloZemW9kPegJAxsElbfTxJs=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 13 Oct
 2021 18:43:13 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::555a:2980:a5c2:8d29%8]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 18:43:13 +0000
Subject: Re: [PATCH v2 1/4] dri: do not check for NULL debugfs dentry
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20211013183601.16514-1-nirmoy.das@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <94f2ac82-1447-54ab-3107-bfdfe11bbc1e@amd.com>
Date: Wed, 13 Oct 2021 20:43:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211013183601.16514-1-nirmoy.das@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::38) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [192.168.178.88] (93.229.33.108) by
 AM5PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Wed, 13 Oct 2021 18:43:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b0109f-0c88-46af-9740-08d98e794fe8
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:
X-Microsoft-Antispam-PRVS: <DM4PR12MB523060E06C68DEF4D53E23028BB79@DM4PR12MB5230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qD2jylb7Fwl6w6rj2wOx8NgkVng4LkH/YilpQCgZOGWSMmeWNgthEkUz+10oHYpBNFwIGOKF6zWOpQSqArsx6w4AFpgknzazFD35l2/rWUT7v9Lyg8WGUOtBwmExXYgAlJNa6X2tNR0X+huiMpJhrlqHTmQ2hQoHuBGprmDi/qRIxeEh4xtnYhHVZQ3JIV9JKsfTHlZlmZlyghR/LY6OyMQdddAbxPqucEMZyoVz/GbSJSy4PPXdv9TB2myvTgGBPfsbd6ADh4md7Fa7SzwthDdB9pTd4WyiOT72YSeQLoYn5uCvhZyZNTCor0nD9OG3dZf3nsF8PkdjsTkh5YeuSfag2KN69jVec2jzo7VLklQvVlsdv+WUhWZdcn6w2sQBhmDIxkAWeAC8H5xlYUvsqPO6EOIkq7+HoJdaFMN63ntEl6t4eYgRIU7HYqJO8ORz1nLPTQfHDlP9pYX8eBIHx+ndpBf68cnAd5DcYTQ36tZBrKIwyfVm5+eI5piOSvYXrXQrSYUOMO1/+uXxVqfRW41cjFa6hb+hc8PFoNvhXJqLw5021FRTbCbQ2mMJz4zi/jjAGXXwQaonL5i/HD3wGaSrZjcH0r+lRaah6+8nY8v9IL3fO2HhY7yYBrbgRq17kaD97Y4VY09nIoWA2GLZO0WNGFj/csHdjn9eoQlE524P14SAVwt6+83OXdUiSxfnivNWVixn/LJZIMiFgYNyfMkfT2cnJpBF+mn/ktl6Mh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66476007)(66946007)(66556008)(8936002)(6486002)(6666004)(8676002)(6916009)(16576012)(86362001)(53546011)(2906002)(316002)(508600001)(36756003)(38100700002)(26005)(31696002)(83380400001)(186003)(956004)(54906003)(2616005)(31686004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnZEQXRTNzkvK1k4aDlhbWo1WkF6eGdFOFg3cmN1VHhJeUN5cnI2TjZQdXdB?=
 =?utf-8?B?RVlFalRNOFZCb2YxamlaMWpINDdxR2VNWllraTZZM3lnalZmbmlSSFFBTm1m?=
 =?utf-8?B?MHk3WnRsMkRTc1U0dFBzbjVJQ1BaWjBhVmRNQjF3WVpUU3grbHcrcGd5TDNo?=
 =?utf-8?B?OVI3bUViQ0R1M0JQb1BkUFBXSUszY0xnRXZJY1JNb1JsVFB0MThHQ2l2VGhm?=
 =?utf-8?B?M1lydHNCd01jc3BUY1EvWDVpMTBMUFNyRWZaZmNlV0NUMjFjVmZYNjJjN0Qx?=
 =?utf-8?B?aVZTcXdRTFkyYmpVUUQ4bThzTjg1b1B1bnpaZkI0OGUxcHRCUU1HbUxpM28r?=
 =?utf-8?B?eW8zd2NId1NicXNqeW9kNnVwMTdTMWN5U0RoeldQdGYxVlJqeWtmbytoSkE4?=
 =?utf-8?B?L2hUMnN6NUdpaU02MXZQY2l3Ti9iLzR1NjU0K3lybVhUU0lEREQrRlJpYTRX?=
 =?utf-8?B?SWFJMk4wc3lrSnA3Y2JHZVpicGRORks3MHIwaFhMcUh1bXlpSWIwRHM2TVdw?=
 =?utf-8?B?RWk4d3pCNGNtTkQ2NjdQcExFaWtNU2VUbSt1aEtzSW1YMENQa0lvSlpscW5O?=
 =?utf-8?B?REFIUWNWUHJCMC9UTWx4eEQxU2VNK3JjSzYxQUFpZEpJT1hXM3YyZ2I2QTR1?=
 =?utf-8?B?bXZMdlJhejdHMzR1eEhOdjJaQlB1QVZBYktuZ1ZDUi9ScHgyT3k5TEE5SlhC?=
 =?utf-8?B?WDQ1cGo3NXJtNlc4ZDh0N2UxSzBKVGxUQkhXd0diYitSZVRaU1ZzeFFZZXRw?=
 =?utf-8?B?VHI5K3VhOWpZUE8xcGZjS3Ezb3dZbWpIZ3I4MjVrUUVwZnltbC8wNXo0UDVo?=
 =?utf-8?B?dlNnQVdDdzdaOXNJU3FwdHh0dXRObEhxaGc3dkFZTEU3VFY0NllIUWJZSUht?=
 =?utf-8?B?M0k4a25DRDI0c3hTNU4wTlFNOWtUZElnTVAxMnhucGExbnZ1WXpYQm4veVFj?=
 =?utf-8?B?YUI5OFFGUEdkMHNzMXk2bjNSaWhySk5HK0J3T0I1Yk1pa2pSaVM2YVpvOGRZ?=
 =?utf-8?B?dGhwZWEzTDVja3NTQUg0S21HaHFnZ1ZNdmdxOEVydjZzQ0FwVmlmNFhEWWF1?=
 =?utf-8?B?MkRFSVZuUzJkSzlpS0Jubm9kNExCUlhaeXkzSmF2Z3kvbVBKNGorWU15VWwv?=
 =?utf-8?B?UXcrRWRBdjVXQ2p4T29oVllGL3QwZHFYMXk2Y3pDMTd3bElsVFg5OVpjWXRs?=
 =?utf-8?B?eGM4SjBnS05vSU1KS3FCT1JTTzdDcmgzZk84cmc3MTlTdmx6OTI5SFFVY1Fp?=
 =?utf-8?B?WThncEhva3lWQXpEalBXTGdTQkVPK1FvU2srKzJDdldBK2I2ZUE3NEFFTTlE?=
 =?utf-8?B?NzE1Qk5hTTRpdHg2S3o0T25PaWl1Ylp1RXhVMWF4UHZYQ2VpTXM1emd2bFhO?=
 =?utf-8?B?bjRDWndSa1FPZGlSU2xtMFFqeGZOREIwTXV4TVV1eWp1QTFDbWQvejhkd1Uv?=
 =?utf-8?B?c3YvTzJXbDFITUI4RWdObFJCNXBxL3d4RlNmUGtjYUcvWEp4U0l6V1d5ZnB1?=
 =?utf-8?B?ellLSzlkWEZyQ2xpdTFob2ZONkx6SzErYUE0U0M0cFIrQlp0MStCalkxM1Fx?=
 =?utf-8?B?TkhBQkFTeDNTTFUrMHZpS293YVo1Mkx6bFZONmpka0krQy9Ub0lJZm9ETTVk?=
 =?utf-8?B?cTJGdSs2b3M1Znh6VkZhMEZpMGU1ejZpdUkwV3JFeWh2VXh4NTQwcUJkMUJZ?=
 =?utf-8?B?ZWQ1TGFlQk5xOVlFaE96VEZZdUkzbmlpL0FDb01ZK1NXa2dvc3AxWDZoUENK?=
 =?utf-8?Q?cH4hvBdEbWXLbEk+xSyDZR6iye+fNJBZwo/bHdS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b0109f-0c88-46af-9740-08d98e794fe8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 18:43:13.3541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XT2dYD5jigUqooa51C1YamndiQ7MXa/gltdLXE7pnjWKd68cMBZra20KXph9gX/s9BlF51u1QP3TFEaioNHIkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230
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

Ah there are three typos :/

s/deference/dereference for this one and for the 2nd patch as well.


Regards,

Nirmoy

On 10/13/2021 8:35 PM, Nirmoy Das wrote:
> Debugfs APIs returns encoded error on failure instead of NULL
> and for drm primary/minor debugfs directories, we save the
> returned value in the dentry pointer and pass it on to drm
> drivers to further create debugfs files/directories. Error
> conditions are handled by debugfs APIs, so no need to check
> for NULL, as saved dentry pointers will either contain a
> valid pointer or an error code.
>
> Also document this for future reference.
>
> CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> CC: Maxime Ripard <mripard@kernel.org>
> CC: Thomas Zimmermann <tzimmermann@suse.de>
> CC: David Airlie <airlied@linux.ie>
> CC: Daniel Vetter <daniel@ffwll.ch>
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/drm_debugfs.c |  9 ---------
>   drivers/gpu/drm/drm_drv.c     |  1 +
>   include/drm/drm_file.h        | 28 ++++++++++++++++++++++++----
>   3 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index b0a826489488..0073854a4383 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -272,9 +272,6 @@ static void drm_debugfs_remove_all_files(struct drm_minor *minor)
>
>   void drm_debugfs_cleanup(struct drm_minor *minor)
>   {
> -	if (!minor->debugfs_root)
> -		return;
> -
>   	drm_debugfs_remove_all_files(minor);
>
>   	debugfs_remove_recursive(minor->debugfs_root);
> @@ -419,9 +416,6 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>   	struct drm_minor *minor = connector->dev->primary;
>   	struct dentry *root;
>
> -	if (!minor->debugfs_root)
> -		return;
> -
>   	root = debugfs_create_dir(connector->name, minor->debugfs_root);
>   	connector->debugfs_entry = root;
>
> @@ -440,9 +434,6 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>
>   void drm_debugfs_connector_remove(struct drm_connector *connector)
>   {
> -	if (!connector->debugfs_entry)
> -		return;
> -
>   	debugfs_remove_recursive(connector->debugfs_entry);
>
>   	connector->debugfs_entry = NULL;
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7a5097467ba5..918f302d9c43 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -64,6 +64,7 @@ static struct idr drm_minors_idr;
>    */
>   static bool drm_core_init_complete;
>
> +/* Do not deference this pointer as it will contain ERR_PTR on error. */
>   static struct dentry *drm_debugfs_root;
>
>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index a3acb7ac3550..3a30fc4d8905 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -69,15 +69,35 @@ enum drm_minor_type {
>    */
>   struct drm_minor {
>   	/* private: */
> -	int index;			/* Minor device number */
> -	int type;                       /* Control or render */
> -	struct device *kdev;		/* Linux device */
> +	/** @index: minor device number. */
> +	int index;
> +
> +	/** @type: minor device type: primary, control, render. */
> +	int type;
> +
> +	/** @kdev: Linux device pointer. */
> +	struct device *kdev;
> +
> +	/** @dev: drm device pointer. */
>   	struct drm_device *dev;
>
> +
> +	/** @debugfs_root:
> +	 *
> +	 * Dentry for /sys/kernel/debug/dri/@index debugfs dir. Do not
> +	 * deference this pointer as it will contain ERR_PTR on error.
> +	 */
>   	struct dentry *debugfs_root;
>
> +	/** @debugfs_list:
> +	 *
> +	 * A list to keep track of debugfs dentries created using
> +	 * drm_debugfs_create_files() by drm drivers.
> +	 */
>   	struct list_head debugfs_list;
> -	struct mutex debugfs_lock; /* Protects debugfs_list. */
> +
> +	/** @debugfs_lock: Protects debugfs_list. */
> +	struct mutex debugfs_lock;
>   };
>
>   /**
> --
> 2.32.0
>

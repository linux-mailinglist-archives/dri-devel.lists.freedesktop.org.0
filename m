Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6633A76CC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 07:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9989F75;
	Tue, 15 Jun 2021 05:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6915889FE8;
 Mon, 14 Jun 2021 18:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcjgQYyy2IACCBcAnG9Nmf4XJ/8xaX4aWE+3rGG6ulomd0wy8s3/GsPcxqUHMj8phZP5bXtFOAjmmRTJnjR7ilXLTx1wtLy/TrByJU04YJk3YrcWjytsoZ9A0HWhP8IRYELOftirrBv+HhFxzPTkWayWQTVJWb9HVc8muB2zu1dSOIdJyP9Bt3eZ+R1AzvsRXypu90p30+UE+D9dRSdz+NiqWpEaZCkq7LAlRHhMNFTV1K+MKHYd8c3N5ywo4NUk8kZvKGbiKHvTigy/Oun9WlYZg5/C5U6R8KdKdiZlAv0CCUQBaNdYEyv1xP9GFPyboi5M8PBu9Q6FWy3JfF2RPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lUtA7rG7IndFm1Q7eX+K2c1M6radf+0tc74Zcvy+7E=;
 b=ex3HKgF3nB9A6XEujCa//x4Bfo4stJENvqA1T36yboVO7KIhtzvPUyfUQN4l1Cd/YuM3gXoUjQ42GZLket2WGK+zL0pYN7HGy1/Yy4stvcBtlyj3VpO+8lBFJ4+WM/ptNINfa4y3MNBOjOoMe7h+P+HdEPZnyiP3p/Dk7PijKwyal1WDHKlO8dPL9ccOzhngYk5Q44+w46tZm2KApc3I/y/ccYOrFE6AG1es8kL6zQK/LXzN65rN2/6iph/LZYsK1b4LAKo8PtyOZxQPmYQBcxF/PeFVGs4seYfQy4u53Z86FXEjbRyO8lDidOvx4PHXIV2+VFdMB259rDKPxxhpjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=lwn.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lUtA7rG7IndFm1Q7eX+K2c1M6radf+0tc74Zcvy+7E=;
 b=OTeJ2dFMemKYY8MeHc9QCTsT/ch24mbjuZQZ8A4C9qxCuBBtzH3C4oM+g60DYYn5Avy1QBT/+fMkWtUR0bNettwgAKA+N1yU7YTg0KMFfjVKVfUD6dJzVtyNhCaG+dmcz7zq2jlrgC+2iEscZcIMjvxcZIAzCB7s42DjpBRbE8aQsOtuUwkkF/sJGGmuLxFOmXcy3tNVAtMLzkBtKsTjwmmZu40g9qsgZl5RZrkT+UUuGcSN4Qahy27jrYZLlv7yCz7xQCf/PItvpSXK9cvhjODRQwlfSanT4wIWLI70/ZRyIF5jgw20t8VMrsAfTnkSS6/o468Hr95Cy+5RU38C+g==
Received: from BN6PR22CA0034.namprd22.prod.outlook.com (2603:10b6:404:37::20)
 by SN6PR12MB4703.namprd12.prod.outlook.com (2603:10b6:805:ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 18:48:04 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::19) by BN6PR22CA0034.outlook.office365.com
 (2603:10b6:404:37::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Mon, 14 Jun 2021 18:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; lwn.net; dkim=none (message not signed)
 header.d=none;lwn.net; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4219.21 via Frontend Transport; Mon, 14 Jun 2021 18:48:03 +0000
Received: from [10.40.101.248] (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Jun
 2021 18:47:56 +0000
Subject: Re: [PATCH 02/10] driver core: Better distinguish probe errors in
 really_probe
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, "Alex
 Williamson" <alex.williamson@redhat.com>
References: <20210614150846.4111871-1-hch@lst.de>
 <20210614150846.4111871-3-hch@lst.de>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <8002c963-ce48-ecf8-a209-58195818a160@nvidia.com>
Date: Tue, 15 Jun 2021 00:17:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614150846.4111871-3-hch@lst.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e4fb0ea-b64a-4fa1-de95-08d92f64f155
X-MS-TrafficTypeDiagnostic: SN6PR12MB4703:
X-Microsoft-Antispam-PRVS: <SN6PR12MB4703602F19E7BE3DC5DE804EDC319@SN6PR12MB4703.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pd9FPgaDis/th8MdjU5hiYAvIBou/c73tBP/EubbPPDBoPapALl/KSYcDtj4kPOTgES2+Gdb7jrrJSXxdhgUeSVu69JfuOElL0ZV2/0PYZye5cNt8kNvFjLOG1ZQONJRsg9xracqwuzjm32r7ULCd2dIu4BjO9CNJFB+4tqGxXJCe4XJ2d+mFNfz1Tnb47iPsarHwRm+NKDYQa+dooJjEtN4xAYhhowaqREZmeG4jmzsMACkBkwueIcADsZjuRMlTaw6tRJo7jXSbHq94tKt9S998lNbI8nBDoV6ZvOrZc5vSU9cYm/xukbBxWGkuxD/DXQ9yrspgkvi0c7bcvVgCv/FlLwEw7nRlpozUS8nOjsUllUTR0PLMR/4ucpQ86yQYpSbg9GIy0ToPO5zNUBzrPyP/A/hHM9zJhJLKRRS/dOa41zH34MV4TQmgJnMKUXusrOdEQYhd/8zPLqcYjoGrCbxCurmnx66rK/uW4xYvvcX1hXI0sdrQ+gemcnAdoytYNFpmDuR+ldplJsykiI12obi9ercJ3m3Kp8D8hbw+TJitoiZTFxv0qAKnNwSliHfiIg0xCStoFdTPGJSnXSc/Ot+qzbuj2B08oY1wFdaTV9jmXgSqBsps7/iK+WceGVNk92+Qc2J5adzly7ahSZBzneZYLt6HXLLtFyaluImzjmeMLzp0T4OTLycxUSIjYC4
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(36840700001)(16526019)(110136005)(54906003)(8676002)(478600001)(186003)(36756003)(7636003)(2616005)(5660300002)(86362001)(356005)(83380400001)(31696002)(4326008)(70586007)(82740400003)(316002)(8936002)(2906002)(16576012)(31686004)(7416002)(426003)(26005)(53546011)(82310400003)(36860700001)(6666004)(336012)(70206006)(36906005)(47076005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 18:48:03.9998 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4fb0ea-b64a-4fa1-de95-08d92f64f155
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4703
X-Mailman-Approved-At: Tue, 15 Jun 2021 05:52:29 +0000
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 kvm@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/14/2021 8:38 PM, Christoph Hellwig wrote:
> really_probe tries to special case errors from ->probe, but due to all
> other initialization added to the function over time now a lot of
> internal errors hit that code path as well.  Untangle that by adding
> a new probe_err local variable and apply the special casing only to
> that.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/base/dd.c | 72 +++++++++++++++++++++++++++--------------------
>   1 file changed, 41 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 7477d3322b3a..999bc737a8f0 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -513,12 +513,42 @@ static ssize_t state_synced_show(struct device *dev,
>   }
>   static DEVICE_ATTR_RO(state_synced);
>   
> +
> +static int call_driver_probe(struct device *dev, struct device_driver *drv)
> +{
> +	int ret = 0;
> +
> +	if (dev->bus->probe)
> +		ret = dev->bus->probe(dev);
> +	else if (drv->probe)
> +		ret = drv->probe(dev);
> +
> +	switch (ret) {
> +	case -EPROBE_DEFER:
> +		/* Driver requested deferred probing */
> +		dev_dbg(dev, "Driver %s requests probe deferral\n", drv->name);
> +		break;
> +	case -ENODEV:
> +	case -ENXIO:
> +		pr_debug("%s: probe of %s rejects match %d\n",
> +			 drv->name, dev_name(dev), ret);
> +		break;
> +	default:
> +		/* driver matched but the probe failed */
> +		pr_warn("%s: probe of %s failed with error %d\n",
> +			drv->name, dev_name(dev), ret);

There should be case 0, that is, success case before default case as below:
+	case 0:
+		/* Driver returned success */
+		break;

Otherwise even in case of success, above warning would mislead that 
probe has failed.

Thanks,
Kirti

> +		break;
> +	}
> +
> +	return ret;
> +}
> +
>   static int really_probe(struct device *dev, struct device_driver *drv)
>   {
> -	int ret = -EPROBE_DEFER;
>   	int local_trigger_count = atomic_read(&deferred_trigger_count);
>   	bool test_remove = IS_ENABLED(CONFIG_DEBUG_TEST_DRIVER_REMOVE) &&
>   			   !drv->suppress_bind_attrs;
> +	int ret = -EPROBE_DEFER, probe_ret = 0;
>   
>   	if (defer_all_probes) {
>   		/*
> @@ -572,15 +602,15 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>   			goto probe_failed;
>   	}
>   
> -	if (dev->bus->probe) {
> -		ret = dev->bus->probe(dev);
> -		if (ret)
> -			goto probe_failed;
> -	} else if (drv->probe) {
> -		ret = drv->probe(dev);
> -		if (ret)
> -			goto probe_failed;
> -	}
> +	probe_ret = call_driver_probe(dev, drv);
> +	if (probe_ret) {
> +		/*
> +		 * Ignore errors returned by ->probe so that the next driver can
> +		 * try its luck.
> +		   */
> +		ret = 0;
> +		goto probe_failed;
> +	}
>   
>   	if (device_add_groups(dev, drv->dev_groups)) {
>   		dev_err(dev, "device_add_groups() failed\n");
> @@ -650,28 +680,8 @@ static int really_probe(struct device *dev, struct device_driver *drv)
>   		dev->pm_domain->dismiss(dev);
>   	pm_runtime_reinit(dev);
>   	dev_pm_set_driver_flags(dev, 0);
> -
> -	switch (ret) {
> -	case -EPROBE_DEFER:
> -		/* Driver requested deferred probing */
> -		dev_dbg(dev, "Driver %s requests probe deferral\n", drv->name);
> +	if (probe_ret == -EPROBE_DEFER)
>   		driver_deferred_probe_add_trigger(dev, local_trigger_count);
> -		break;
> -	case -ENODEV:
> -	case -ENXIO:
> -		pr_debug("%s: probe of %s rejects match %d\n",
> -			 drv->name, dev_name(dev), ret);
> -		break;
> -	default:
> -		/* driver matched but the probe failed */
> -		pr_warn("%s: probe of %s failed with error %d\n",
> -			drv->name, dev_name(dev), ret);
> -	}
> -	/*
> -	 * Ignore errors returned by ->probe so that the next driver can try
> -	 * its luck.
> -	 */
> -	ret = 0;
>   done:
>   	atomic_dec(&probe_count);
>   	wake_up_all(&probe_waitqueue);
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3ED3D09AB
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:28:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641CF6E841;
	Wed, 21 Jul 2021 07:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C5589CB3;
 Tue, 20 Jul 2021 16:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a39oUMFeEEB9IandKct/tGfoXChQkjAM7XpoiMzE3SbTHbrF/P6EhFdk6iKN8+pWehT+PvoBrqEa4k3ME1rRxISRqDgXlQKl0FFEsZYt67obaETaDMATRgkbjRaJK8uakY/wTXLMrbX+y4Hr63z0h+jqR+JCuKS6xTsXG8ZBeASjmp+fhUnXi0/BNAfaT0U4JzlsE/sUbG6MHtlxh2CJHWKsVkrxsAX3RtuH/imQ4nzICG3d38NAya8RQO8bYVH6ZCg59ki+YU7icxTTDdYasA21R4mNE41A1C22XxIVdbM4lQ3hr50SwzwDrvw6ZTfzHy31hs5x6N5+U0L4s0KTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raDI1fzGPc6dGjz2Gh9/XBlvvSdVsDrlWoOtLG0MYN4=;
 b=TVYBnA+hS4eerrUwGOsk8Iz3IrFLe3/PVSdFki/YZbUpRTRseHnYxEhm71CWKyvFt66JL8MOPw9bPNr7h2lV+5A22h0Ptgmurv1f5xxBHnrHPFoBT8s/DR/2BGnkleS2JXNJ7tbiLDCcLve7fH7oRWOt7Avc9vo2AEs9sjRtMf9svD/DBw5pyUiSancnzSSV/awVvojWiDLQXjA8qsKFbL2II0ncablNlsMRuYkdd6gQcfQAo5DRw8ij6FJnH1L2LmK2yz3WIMgI3yJCA2fShaQisLHQUVx8JivGpK6jMio8CIO/vVza9KkB5RK35ZKemIuT1L1+Xjt2SMF2T7Hfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raDI1fzGPc6dGjz2Gh9/XBlvvSdVsDrlWoOtLG0MYN4=;
 b=MIg4EjtYHxwvgHVBVhZiz4xi0/MFpDHaobAK9RwzMbaueAQOoqqazwioLb5y2tvkVhhfbOvehiICiO1DUhAnuNrgN3TCz1tkRItWWaWiVjqez7/EqhrOfeqO+ggPyk3VHpSS9TEYbto2fQqTtE4m8VY0DLJOjsE+ytqcY9yhDFE=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3503.eurprd04.prod.outlook.com (2603:10a6:803:d::26)
 by VI1PR04MB4160.eurprd04.prod.outlook.com (2603:10a6:803:41::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 16:23:52 +0000
Received: from VI1PR0402MB3503.eurprd04.prod.outlook.com
 ([fe80::c401:1dd0:8b6d:27a5]) by VI1PR0402MB3503.eurprd04.prod.outlook.com
 ([fe80::c401:1dd0:8b6d:27a5%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 16:23:51 +0000
Subject: Re: [PATCH 05/13] vfio/fsl: Move to the device set infrastructure
To: Jason Gunthorpe <jgg@nvidia.com>
References: <5-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <44639398-d50f-ac6a-d52b-4e964465ca6f@oss.nxp.com>
 <20210720161713.GB1117491@nvidia.com>
From: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Message-ID: <5181d7f9-0a4f-c594-c5e9-820bdf97f6f2@oss.nxp.com>
Date: Tue, 20 Jul 2021 19:23:35 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210720161713.GB1117491@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0161.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::30) To VI1PR0402MB3503.eurprd04.prod.outlook.com
 (2603:10a6:803:d::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.211] (86.126.4.153) by
 AM0PR01CA0161.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Tue, 20 Jul 2021 16:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18f77e96-cd4a-495d-a7f8-08d94b9ac2be
X-MS-TrafficTypeDiagnostic: VI1PR04MB4160:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4160179399F5768932D398B0BEE29@VI1PR04MB4160.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WaedbUM83DxpNlQhdIOJUJDmPzkeDF3Be13nz9KLx2ZsDF7uMMyQov3KfWf5HDAJWOEz2rzmZ00wNCdoJ3IxLUysOlxKlvyEdyocvXM3L/geogsVe+wp41NKRYASFMi12x+kEajUcBS6qwXjEBPhdZTcxqmCM9Qgvmdr+hWVl+miLLJDZ95t8/btgLg4aGlanP4GI5EyAuFOuqCIbLQhudz0mQJYvxi7zdl3xcF497nSUecw5FtCVjAgYc/Y2XVinSg6Xqwiu1F7LKj+tIRvWKtLNANmm38NxEo4zNRVxEsLqmRXDgFETlmnBYNJDT4kHgbvYpwlECE205hLcToi2tujdZ2mKtr8TtAJ5TeiaSQQSNN6/UU0huOWYkX+Tl+FN41myO+Qy+io8uL4SV06Wwg1EU9jl1R0phqoNsr2VdPV4qfF+DcRdMLxa0IfB/AaiuDssiGIk9otfgFRCSmjqtRTQoHLLMoO5EVpK0mDdTzKtDTb90JIqoWvsq8TGFbS+xAhM5vLrNz+M5PibuBRAdP2wQYKE7gRApkiEqzRgDh114OEjo9FpeQ+Oi+fdO5yWbD7X9y9aso6hXIAgKUnI19rJp9NItj4+4KrPyd2WfO+MNfeSf++hkJbVtLnWwmgHcrjtIhufAYrNTEAzsPgBU10NC9p7T7EkEU9UqM0JG2wRWYlctpaIB0QisD8AIsEXde2sSRq8XpM1ZWcvuL6ffQI/r0A4M4M0Rvwws7phsg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39840400004)(396003)(136003)(316002)(38350700002)(38100700002)(5660300002)(66946007)(66556008)(16576012)(66476007)(53546011)(2616005)(956004)(31696002)(8676002)(2906002)(6916009)(83380400001)(4326008)(6666004)(54906003)(86362001)(31686004)(26005)(6486002)(52116002)(7416002)(7406005)(186003)(478600001)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVR5UERxRk0zelI1RU45NFBPWVA1WUZUb0QrZmpGWS9Md1FpZ1dpbm9jYkxk?=
 =?utf-8?B?dE9aWnRxR3FneTlmeDJIeWNUM0hNeWQ2UGRneDJFenVhNmNlTmhPT0hWZ3ZH?=
 =?utf-8?B?TjJPLytCeFdETVhIMGIrSmI1MVBqazJVTVhDVGl5c0dkMkE0WWN4RitaWUFV?=
 =?utf-8?B?WWI2ZVRCTG55QVBzRWJBaWdmbjR1WlMxdjBnVnVvdGZaMG1GQnFKMWVqUnhn?=
 =?utf-8?B?ckUveWZhU0xETHpsNFp1WGJ1N3hjVWdOZXZyWXN0dlBWKzlGYVMveWQzcHZP?=
 =?utf-8?B?clhnTlFsZkhqRDhCdll3N2phN1QwZnB0NVE2bCsxZ012WlMzQXpoM0Q5TUxo?=
 =?utf-8?B?TTlGWThHRDgwbVFOcnEwNjZKdVhFTEFESE5kcFpnbk82MmpwK050SWozdm9X?=
 =?utf-8?B?OEVjeTlKNEZIcTB2Zi9vZjduNW8yN1l3bTA1UHlmQTYxTER2MVN3cENpRWRK?=
 =?utf-8?B?dkFtMTBDc1VXa0xBZ2JBbFdyZlBCUjl5RXhYTDdPUDYxSkkyV05FbnNjZXAx?=
 =?utf-8?B?VEhaclIvNzNRWVdmSWVwWjFDME10aTQ0d0RMYkduNEpUaEdxNjR5MURaanRZ?=
 =?utf-8?B?SVRJZVhrRGVIeERPdi9BUnJPSUhFcmRIZHBNUGh0Q3RiSEFMdjJlTEFET2lj?=
 =?utf-8?B?YWZVOW1jRFZNdG5MRHo5RFpoTWwyQUhSNFV5MGgrVWVjbDhHWTBSbDE0bXRK?=
 =?utf-8?B?Um1kclc2c09VUkpnZGhPSTRTYUdUQ3lBWmZyZG5YUTA1WGlEYnU3ZjMwVy9D?=
 =?utf-8?B?cTh1M0VWSjFjYjQrdG51SXJtTzQwV2pldlFKTGdEUmNGNEVaaU9lVHpaWis2?=
 =?utf-8?B?bVlYa25pN1l4cytlYTZjendiY2wxR1BNeDlvNkJzQ3BDTUxidjVLUHh0QlJO?=
 =?utf-8?B?U1FBMnpUN3drMHpoTTM5alBkblZQT3piV1d3Z0VVOHJwbWhZb2lxeXZJbE9t?=
 =?utf-8?B?blQ2OVpvQW5VL3NlL3FQeUdUeFV4V0ZxZjZHSE9DenJyN3JqTDVMUDRBNHZY?=
 =?utf-8?B?R2Z2emNvUWpqK0RGRmw4QTAxTHhRSlJnUm0wT2RyaU43OXFqLzNaeEhEZDV6?=
 =?utf-8?B?TnBJWnUrdlg2T25LVmhkSUtLd1NQUHo0L2dyeGNhSzBwN1RoT1Y1eWhXTlpu?=
 =?utf-8?B?MG1RRThGWFNVb0g1SG9EV3MzYTFPZ290SHVSQ0xqR3dqNUQwdFB5TE1tOS9a?=
 =?utf-8?B?OFdIVkNHblhmRlhQL2twUXZ4dHZ2SGYxNi9aOE9MVXNHT2lsczlJd2YrbEZ6?=
 =?utf-8?B?U2RSV2dtK1VrQkhoUjhDeHVyUGNsMWE4VFlFZXZXYXNQdjhqeVgwUjVXUklC?=
 =?utf-8?B?aW0zanR6Q29aUTNFcGRIQW1XUHBYUXlibGFVa2p6SDI5Vi9tU2x4WWR1Q01B?=
 =?utf-8?B?ZVYwanVIRUttNXo0VUlOZFhGVW45OVNValRpY3ZZUi9kUHl3M2luVmxpV3Ir?=
 =?utf-8?B?MXkzdXYxaDlSdzFFSlJacVduUjkrbGJmM3l4SVJwZkZ3Y3R2QzAwVnZEOXEx?=
 =?utf-8?B?dG1EWnJIQjExWXFmTTE2L3ZTR2o3VzlyNUtZVHpmY3VHMjAwejFSYTV3OWtH?=
 =?utf-8?B?RjNxL0hpZG81RGJCbDRhRFV6L3h2TDVWUWpmQ0dEeG9aR01icEhZUXpBL2V5?=
 =?utf-8?B?QkoyQVJ3SEswVnF2ckdacGw2NzhDcUFzWEszNmVKUU50clJzUk5BckMrQ3RF?=
 =?utf-8?B?amgzR21wcURoVTcxQVpVOU40WHBWUCtObDRSb1hLUDU1ZVcxc1RHNE91Z0hL?=
 =?utf-8?Q?yPbZi10RWcMomRhC7SgTqcNYGOs1Y7lSENLuDVW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f77e96-cd4a-495d-a7f8-08d94b9ac2be
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3503.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:23:51.7975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xdXNUXFHh4srNMNqMsOHPYtwXBkld2ElYcjhIuhZy0steB7MZxar0LQz0XnVEVxjkjrjTfQjeV5howg8ol7mKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4160
X-Mailman-Approved-At: Wed, 21 Jul 2021 07:27:54 +0000
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/20/2021 7:17 PM, Jason Gunthorpe wrote:
> On Tue, Jul 20, 2021 at 07:12:26PM +0300, Diana Craciun OSS wrote:
>> On 7/15/2021 3:20 AM, Jason Gunthorpe wrote:
>>> FSL uses the internal reflck to implement the open_device() functionality,
>>> conversion to the core code is straightforward.
>>>
>>> The decision on which set to be part of is trivially based on the
>>> is_fsl_mc_bus_dprc() and we use a 'struct device *' pointer as the set_id.
>>>
>>> It isn't entirely clear what the device set lock is actually protecting,
>>> but I think it is related to the interrupt setup.
>>
>> Yes, it is protecting the interrupts setup. The FSL MC devices are using
>> MSIs and only the DPRC device is allocating the MSIs from the MSI domain.
>> The other devices just take interrupts from a pool. The lock is protecting
>> the access to this pool.
> 
> It would be much clearer if the lock was near the data it was
> protecting, the DPRC pool seems in an entirely different layer..

Yes, I agree. I will think about of a more clearer design for a future 
improvement.

> 
>>> -static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
>>> +static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
>>>    {
>>>    	struct vfio_fsl_mc_device *vdev =
>>>    		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
>>> +	struct fsl_mc_device *mc_dev = vdev->mc_dev;
>>> +	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
>>> +	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
>>>    	int ret;
>>> -	mutex_lock(&vdev->reflck->lock);
>>> +	vfio_fsl_mc_regions_cleanup(vdev);
>>> -	if (!(--vdev->refcnt)) {
>>> -		struct fsl_mc_device *mc_dev = vdev->mc_dev;
>>> -		struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
>>> -		struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
>>> -
>>> -		vfio_fsl_mc_regions_cleanup(vdev);
>>> +	/* reset the device before cleaning up the interrupts */
>>> +	ret = dprc_reset_container(mc_cont->mc_io, 0, mc_cont->mc_handle,
>>> +				   mc_cont->obj_desc.id,
>>> +				   DPRC_RESET_OPTION_NON_RECURSIVE);
>>> -		/* reset the device before cleaning up the interrupts */
>>> -		ret = dprc_reset_container(mc_cont->mc_io, 0,
>>> -		      mc_cont->mc_handle,
>>> -			  mc_cont->obj_desc.id,
>>> -			  DPRC_RESET_OPTION_NON_RECURSIVE);
>>> +	if (WARN_ON(ret))
>>> +		dev_warn(&mc_cont->dev,
>>> +			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
>>> -		if (ret) {
>>> -			dev_warn(&mc_cont->dev, "VFIO_FLS_MC: reset device has failed (%d)\n",
>>> -				 ret);
>>> -			WARN_ON(1);
>>> -		}
>>> +	vfio_fsl_mc_irqs_cleanup(vdev);
>>> -		vfio_fsl_mc_irqs_cleanup(vdev);
>>> -
>>> -		fsl_mc_cleanup_irq_pool(mc_cont);
>>
>> There is also a need for the lock here. Eventhough the close function is
>> called only once, there might be a race between the devices in the
>> set.
> 
> vfio_fsl_mc_close_device() is already called under this lock:
> 
> 	mutex_lock(&device->dev_set->lock);
> 	if (!--device->open_count && device->ops->close_device)
> 		device->ops->close_device(device);
> 	mutex_unlock(&device->dev_set->lock);
> 

OK, I missed that.

> Thanks,
> Jason
> 

I have tested the changes and everything works as expected.

Thanks,
Diana

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D66724DC938
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 15:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B32B10E056;
	Thu, 17 Mar 2022 14:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C5F10E056;
 Thu, 17 Mar 2022 14:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBxykHons+QNbiIRkL4Sn6hlNcPEG/LVYkQQCWdEalpuIDicAf6LcUMqDQmubnLBDTYkP9vgjDD77bp9qT3+8eoVtnHBQXFrgkkKrSwUb4kP/4QhC3sWK//JpM857Zc91iaUwUx0FWcOjRjZZRWqHlX0aNyhE7gH/ME/U4pembf3Bp1UmxSwWbanAuAIBzqGfdz1TwtW3NJNUR7RiQ7LvNo0AHW6i/QmVR20jIZdKDY2RBBmBcEi0BsyIckf72lggWb0kmH3u0eG8ucJRXCV4P2x1GAScElbWWCCmyRuIvs/zmGRQa4c6898PM7UrxbQcEk+IQudymT/bhZxHrQdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omhxDS/0RIGbNYKp+5JPK6Hol/Gw2D+tHO1cVIX+FYE=;
 b=BEBqbWMbyLEYng+KYYPVRHdvyG4doOMSSj5Znt01nSJDNvq2fLLauvQpjMPxhBlSbUEPhotEzviijm/N/hdM3oNXAiUrPJsyzb6/Y62s77hMRHgnbchDd8G7g6oCR7Ly5BzdqC3ugKGX2QXXDiCtW5ln/qxQ2+USBb2La0SqddmsIfK8oSFDMCRvI/JPyh5S0xiaX5ewJjAm73U2HX2y/I+gAj3EEIFkWAYSdEGlkZ8FBB6pJbSoVdPBH0IvQdtJcdws6+QLpZSvtEhD+X1HoMyaI7l54NEgBRfIwQJUBHIL3h7HltIXkM4jAyaQQkHGrXPuQ3XX2oxzB+JP3nXaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omhxDS/0RIGbNYKp+5JPK6Hol/Gw2D+tHO1cVIX+FYE=;
 b=LagAAvEHB8SXGJzRhcB1NkERICnpfKA5B1hO0QLSnImdl0Dix+xCj+Shg+Ub1y6Qgg7YGRuulklvPPbZxVurSdRVY2lUMp8fwY/oLCeQmHqkxMQzsFzTiBXkDhRZmKIKuAMnB8DWDyrvdE1yE39F6BTXVxbNvxAojwUXkEoWdmw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB2942.namprd12.prod.outlook.com (2603:10b6:208:108::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 14:50:09 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::4839:9431:1040:5cd5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 14:50:09 +0000
Message-ID: <8702f8a5-62a1-c07e-c7b7-e9378be069b6@amd.com>
Date: Thu, 17 Mar 2022 10:50:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/1] drm/amdkfd: Protect the Client whilst it is being
 operated on
Content-Language: en-US
To: Lee Jones <lee.jones@linaro.org>
References: <20220317131610.554347-1-lee.jones@linaro.org>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220317131610.554347-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::18) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18281f27-5cf3-47c5-cea2-08da08256eb1
X-MS-TrafficTypeDiagnostic: MN2PR12MB2942:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2942FB7401002BE404746A7492129@MN2PR12MB2942.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8n1bySeWbZMkeuF1Cs/ONN1KjS7J6fkNm+Cp08kgO5clyygx7MVR642tGThdCnYDYC0uXiPvrWRBODJtxZgahIbOmTaz77amVkwXSX9/8Ipgvaai7PuekWPBCrE1Iv7RXvBzFX8e0f0wBtsPlQx2pBy79arpdVASq/uqZnk30IoYGaaVPlQnXgmv4hC8daatpaHbpUPiKf2QUKxBlc1ZmqZZDzHf2adOdIH+NXMXgSYDYz5Tq4VYfSoRgcUrup1gUdopE48KzshoRfODxwJPi7D25WgvsB8vycYKOrDSTZwJHfZkv4KHLVPR7pnw/FIsIfbnggxJyeIlBVpHsbjFRXT1fA/DK08KvvlYZStKE877JzBRIR7U37eLLHsVEBZoVK6+HLBoRXnTUDFWVN7vK3JJNLtZvUr33X3P7JCtm6svmRyWNRSUsjXHSRzUKgEdADgdt+9u2Xma4LeBPt58Xkvvm3ptxoc2J1KaC4ine8XPzcadcEFs1dcSXPOhrWo5VK3tAdXNQPZNRLTFp2gjR/w/4SM6A9N4N13j3G/OPGKWdFXlstkL0hsIbYMiqTV4sD348ri0vdKwohw5gP/vE7B0ok0hii01YuR3WQZQnSSQAtyOaDLNlAJmZX1vnQz73NLHEkJDvpZxxdjeqADuZtzK2KeuVF1M6f4Nc92f9c3aoJdks0GuFYlCf3Wd/PwIR6cIqYAdPBeoLXwtBaEex2lG91lcoULThzv3f7pRPMRNJo5g1CvdFoPj+4CZNjGO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(83380400001)(6916009)(31686004)(54906003)(66574015)(316002)(44832011)(36756003)(8936002)(2906002)(6486002)(8676002)(66946007)(31696002)(86362001)(26005)(186003)(66476007)(66556008)(6506007)(2616005)(4326008)(38100700002)(508600001)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1dJSW9hOHVqSDNHWWhMUCtMUUUrVlBTTjF0UzE4WVYwYStrbnFWRVBJK2ZF?=
 =?utf-8?B?THFvQUdhK2RwVUNaeGVkenV3b0pXbFlqejJ6YkZYb3U2VHFWb0MvWTJoUFRT?=
 =?utf-8?B?SmpjZjVnNGdGSlBBb1FoZExQQkVaTS9mdXFteUUzaTZJbDBUeWthSHlIOC90?=
 =?utf-8?B?eG1jVHp6Rm1iTVo0ZXJVUyt0VmhFdGc1amdLV3UzU0hESFBNWXl0UHJCT2dZ?=
 =?utf-8?B?cERSWDJlWkZLVHY3MllVQmJIT2x3UTkrVC9XdkgwNVpQQWZNOHpMQnRxekpy?=
 =?utf-8?B?WCttNmZ0MXR5Z0p2T2RHemVVcjZnc1dlNVArMDluOUZSWGN4OHpubWJuU2VC?=
 =?utf-8?B?azZDWExxLzdzdWFRcFl6WXdsVElENWRiZzliYXJNTDZtRTVZWDlkVXFyWEps?=
 =?utf-8?B?WktBcEJMVXRzeCtldElhalNvVjJ1VGJsUUJnMUhsVTE0eEVPdVZlcDh6MmhP?=
 =?utf-8?B?TTRhbWVoWk5QODhtTkp4ZUs0OS9TMkdMWlh3QlExcEZnTnRTZDUvVzNzeThI?=
 =?utf-8?B?eHMyb1VXeFlmYlR3QkZFQ0Qzdk42MzBSWDJpdXpVL0tqUExUVEpVQXRjKzlV?=
 =?utf-8?B?em1RdVZPbXRHU1loUXNhck5UemxqTjVCMWlDUkt0NURzNEoxdlhxbXdGbGtB?=
 =?utf-8?B?VTVNSkRjbWpiUlVaMTBTdlIvb05SMkMwdXd4aTI4SjdiaC9qSXMyckJCd1Zp?=
 =?utf-8?B?YUJNTDNvb1BTbnZmUVJrRHVjMmRtRnZReERTaGZBQmR6WU5uRG5XQ2p4bjRV?=
 =?utf-8?B?eDd1Nk03d1h5aVJvZHR6STJocUU0dHF2eUVuOUg5V1N0MEtWLy9EZldLUUpj?=
 =?utf-8?B?MTdSMVBsQlJWMjlsU0J0ODMrN2N2S3BQTXdWZ1NrSTROZU9RdWE4czRvV0dZ?=
 =?utf-8?B?Q0xnVW5BNU52dnpMWmxDNnhhYlhYQ1V1aDVrYTYrWWZJUzRyQ0U4V0dRNWJS?=
 =?utf-8?B?RlZxK3RkUlo2V29sQlBzQlYxT09nMWw3WWFKVERIL21kQjRuQkxRTGJsQU9r?=
 =?utf-8?B?dmlOZW50Y1FKWTRiV3hNK0VZazd2NzVKaGZWMUpMTmtWaGxsbUlIL202RmpR?=
 =?utf-8?B?aVZCMk8zOS90VElxKzBrQnkxOEg2OWZWcTRxbGM5TFpLNFRaQWp1UXUyemxk?=
 =?utf-8?B?UjhZVzhTRlBGVFNnRHRDVW5pTHhtVHpuaitrZWNXdVFZUnMyc3ZZTlJqYXhu?=
 =?utf-8?B?YkpYRXFtcjZYM05EOUU2aGNNc0xIMXowRGR3dW1jaEx0MEVsQU9ENDFjdkhI?=
 =?utf-8?B?c2dPeUZtdEViQUN2MmxNT1dzY0Y3U2FuSnN6UHVMSUpGV3M4d1JpVVhwZXd6?=
 =?utf-8?B?SHB5K2RUVUZPVmppVDB4dCtjblVDcWw1a3VIbDMrZFFGMjRyZG42bk5xbkpD?=
 =?utf-8?B?LzdjQy9qUE9DUGFxSFdaTFpvdEZBRDRBVlQwRWROS1NQR2dxQm9DUFY2eEFQ?=
 =?utf-8?B?QldYNzJkK1FPaytEcTI3ZXV1K25IRG5qMkpZQ1lmOEptUkhNM2V5Tmc1VU51?=
 =?utf-8?B?Wm1CbnlwYXgwL1Y4K1BZUzNZSFB3cXJLL3hoYTlOV2xMWmV1MGFwSVdUcUFV?=
 =?utf-8?B?OVo3NTM4ejRDU0lSQUttVWFLeXdyb3gyU1dzZEk3M3dOYlpZWFhTM3FwR09w?=
 =?utf-8?B?bGg4b1J3bURMa0ZTZjlSeUtVdTZ5Sjh6dnlzREJjM1dwOVVkVlhIZjhWRDVu?=
 =?utf-8?B?alFNNUJyRlBoemx6c3B3VVV3dFVFTmpiMDlyQmJxTEJTR0t2RUU2bUFIc2hM?=
 =?utf-8?B?YktncU5XNUJpbTNGMHpqVzBmN1Q4Nk8wV3NpbFMySXU4cEhUWWRjU0dkeVIr?=
 =?utf-8?B?K0VDMzZZZzJiOTExMnBaZ0lNSSsxb0Zsc2Y2VUN5bURCRlRydGdpZWx0ckhI?=
 =?utf-8?B?VW5iRlpLaWZMNTlsRDRySWJzK25NNTZlWktFUytVWXFYMldFMW5FdjZWYkhp?=
 =?utf-8?Q?wRm9gl9T+sLdAdaQC6Pqtx9pXIcBewnE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18281f27-5cf3-47c5-cea2-08da08256eb1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:50:09.1554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxxsvWu3dPwhKDPl0je0doMhuHSc6CsltZlMzl1GOlqwGStJGo8aZLZNlg5aRgwkzK7Z9tls3XPg7n+wrBRB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2942
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-03-17 um 09:16 schrieb Lee Jones:
> Presently the Client can be freed whilst still in use.
>
> Use the already provided lock to prevent this.
>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> index e4beebb1c80a2..3b9ac1e87231f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> @@ -145,8 +145,11 @@ static int kfd_smi_ev_release(struct inode *inode, struct file *filep)
>   	spin_unlock(&dev->smi_lock);
>   
>   	synchronize_rcu();
> +
> +	spin_lock(&client->lock);
>   	kfifo_free(&client->fifo);
>   	kfree(client);
> +	spin_unlock(&client->lock);

The spin_unlock is after the spinlock data structure has been freed. 
There should be no concurrent users here, since we are freeing the data 
structure. If there still are concurrent users at this point, they will 
crash anyway. So the locking is unnecessary.


>   
>   	return 0;
>   }
> @@ -247,11 +250,13 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
>   		return ret;
>   	}
>   
> +	spin_lock(&client->lock);

The client was just allocated, and it wasn't added to the client list or 
given to user mode yet. So there can be no concurrent users at this 
point. The locking is unnecessary.

There could be potential issues if someone uses the file descriptor by 
dumb luck before this function returns. So maybe we need to move the 
anon_inode_getfd to the end of the function (just before list_add_rcu) 
so that we only create the file descriptor after the client structure is 
fully initialized.

Regards,
   Felix


>   	ret = anon_inode_getfd(kfd_smi_name, &kfd_smi_ev_fops, (void *)client,
>   			       O_RDWR);
>   	if (ret < 0) {
>   		kfifo_free(&client->fifo);
>   		kfree(client);
> +		spin_unlock(&client->lock);
>   		return ret;
>   	}
>   	*fd = ret;
> @@ -264,6 +269,7 @@ int kfd_smi_event_open(struct kfd_dev *dev, uint32_t *fd)
>   	spin_lock(&dev->smi_lock);
>   	list_add_rcu(&client->list, &dev->smi_clients);
>   	spin_unlock(&dev->smi_lock);
> +	spin_unlock(&client->lock);
>   
>   	return 0;
>   }

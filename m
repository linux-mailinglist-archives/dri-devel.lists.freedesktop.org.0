Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DB0510399
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 18:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5893410E847;
	Tue, 26 Apr 2022 16:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8B910E41F;
 Tue, 26 Apr 2022 16:36:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ev73eQ1GX8+5bN0MDCumocBdKbTM7wim0KS854E5wDw4j8QoIZ20KYg0ylRi3BNpSkVtpzyUIlAqZMYR+9tLGyaQVbh1rnH5TM01+2qVtlxoD07fsnkAzXIrzOTDXegYkERojGTTYNOlD/HTwO/HX2leTVZLISP6gYqBk6id/e/8t1aQhPkx35GWjz3yOYrXMV0dOUKhYhQ4gtbFoZYHTehr4M5WtoK/3yuanmiDr9olDZWF0qHrYXV4+F2+qnL5XqZHuYrIiwwtf7tbTLcMfnOGbFebID84redbhH/P53PmwZaztFb1e90nU2fgIrpW7H3rGrdWgsiezX/EdvvHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UramC/tIGGMfBcHJ4Q1NF6oF3cmvmer8faSvQGeGueU=;
 b=VzjsRKrQcUYWEyE/btM/pKO7sGTKAZ5PdqrWcq2uWWeVcVFnuCx8dI0igWxP4+U/rqpOVzkGmxPURE3cizr1D5NscjUWYswQ3wk+KkuQWOa7LrfnPQhTbjiFeJ9PhpwXrrfLIxWjI2yLH3a4CJsEOl5jwKisef/Wfnb/gaRyuB8AHqh74ND9vONpLTAh77UhR9rUd8/+BJUARd0A1+QwMlIzp/jRwZ76G6NbNmghSavdxX08/X9leXGgLKh0JdZ31Fo6/LeLY4x/m8j/7XqrGV0evdCQm+cdf+TJ6KIwPPMxeOW/0Ua3SMgM5GkfSIKZ+Ky1FsCMD0plb1xsIWmm8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UramC/tIGGMfBcHJ4Q1NF6oF3cmvmer8faSvQGeGueU=;
 b=F8Fek8l7R1g27ZMCvte7tcYgP1mnCczcsix9i7LtTun5Su33t6dKhCPE2+sDelvQtJInpRKEQY5so1jlGSxWW5DYvBrfGDAg/hXMgaXpG5bJBMu6rwxyZiNaNgXZ8vzOn0DJL+4hDXAuMFVLmf0EUts2u3GvwjgBHzZdI7xleis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5404.namprd12.prod.outlook.com (2603:10b6:510:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 16:36:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 16:36:19 +0000
Message-ID: <c0facbf4-0e14-fde5-4334-499135a36f0c@amd.com>
Date: Tue, 26 Apr 2022 18:36:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
 <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHbf0-H5uE4RtZwY0L8Wz0VG6QnU1+E3yhg3fDFVc3n__=nrNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0101.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::42) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c224870-7d01-4640-d4c8-08da27a2e43c
X-MS-TrafficTypeDiagnostic: PH0PR12MB5404:EE_
X-Microsoft-Antispam-PRVS: <PH0PR12MB5404E24FCD4B363557BDA9E483FB9@PH0PR12MB5404.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 95NbAXWDY0zYSZiSjbZ/DRB8z387NHQz7xBNKE2wLUumpkpuroa2V+9l0prrDldi6dpcOGDaASdKK4PkaMDKeq8wWtIWfU2qI2m/pUx5/6dF8/BThFkVl4nH8vMQjXW3nDNxq19nUgMYKZU0WY5hbtkOsL964OZi/tv7xMFBdKctoucmK6vgAc6RW0XPJtW1aLkU1Lk54cJLYKkXQG0Jv+kPnHspIDTFvI0RWtWTT90GA4nWyCXlOBUh1VX6oYDhsbmKRrBXOacmq9I2NQ7C+ZAmtGzwqu922dEPgFUmnfe4SgliDoOrt2fmIBjws3fOm6qh5YmOo86vkhWsw+wVT6jaxmkQJbJdVbTH84cI5QWlgPMq7BiuAIiNW1CzCTOKCOc11wgXlhNL72DrJiPqJZDqSADJoY5BdWZ4708z1WQAP+EOsDcH+mY5GmFb1zwzyCCSV8eeh5QlDWRQym5HmzRn+cLzHpIfKkRlqgx9ZV7EVK29th3XsbhQW8o1fVIwd45c8NrFaum+F0UrlgzTxm+rPtkOO6HfkVOiaOny0RTVRoQHAVk4XQGzEK78z+3G9GLVhpF+RQmxv2+3Lo93bfACOIu2d8MdTkHuxtRynHF4W/TqbHOMbx2QR8j2ACRBaalVuCFF7MM/XoW2+KWteZpnZjQThw1W2/uHjVPcaY0lrEO/NKOSjhIllzETY+sUdgN7rwBxlCGNNe7k8qF5J+7j4vwtS0KEU00cER1nbFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6636002)(66556008)(66946007)(38100700002)(110136005)(8676002)(316002)(4326008)(86362001)(45080400002)(6512007)(186003)(2616005)(2906002)(8936002)(31686004)(4744005)(6486002)(5660300002)(966005)(36756003)(6506007)(83380400001)(31696002)(66476007)(508600001)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDQvZzRkc2w3Y1g3eEk5eDhVbDNXbVhjM1ZvbjdVU3MzWS93bEo0cDNkVllV?=
 =?utf-8?B?azFQYklIUEw4V2NBQ2pYYmdjZVR1eEl5czdIZ1JYNHVyaUVuUERvOWdMUmRk?=
 =?utf-8?B?WXgxU1dIa1NMQmhJTGplNG9uVFZtQ0FJaTUwMU50cEU3SmZQRnduUUhWeHQv?=
 =?utf-8?B?UnA4OEVFUmZNM1ptYUtNMzNJdlJaVnpnOGhGanJVK1BrUWx6Y0hyOTVHd25v?=
 =?utf-8?B?S0RIUncwQmtQMmYyR01ZRTdBMitzb2hFcThlYVI5VURTckRKTUJ2RGtSN1c1?=
 =?utf-8?B?RGp6Y0VST1ZCbnB1TXhtdzFUMFVFYjlBdmttZ1B3Sy9SV25Ja0tQNHVTeTJD?=
 =?utf-8?B?cm1UWG9TZUQxd2ZjZm1jK2U5SmlvRzhtbHloNE0rZ2JqaTlTdGZZeFZnNTl5?=
 =?utf-8?B?SEQwM1BlQTNBMldta05uNitqR3RtN3R2OWpuWGQ2QW8rTzZ0cDdTbWF0dHNs?=
 =?utf-8?B?OUxyUXE1QVJSbENjUk4yYmlGV3NqTGNUMUtMRUxicTU3U1ZCWFJWaXc4OUpp?=
 =?utf-8?B?eGs4SldpUWFBUW12dHNOZFpNNUpXOEIwTTRCS3R4Z2EwN1NhUnl3SEE5SG1F?=
 =?utf-8?B?KzNmNUJ4cnNiVzJrWFQ4alZWL1l0LytZbVFockp6L0YyZXEyMWF4TmVZNkFj?=
 =?utf-8?B?eHA1TER2RGRpcm54L1J5MkhVL3g5dVpTNkVaZ1pGRHp1WUtOMFlkNzQwYWJ6?=
 =?utf-8?B?dGVXZWpDYTV5WmthQm9NVk1OaXVlNjdyWGxwSWJTNFdsaDVsS2prcTZ1VzVs?=
 =?utf-8?B?RldzNm05RHNzMkVGaUZoYXo3TEFacTgydnd1UnBmN1V4byt0TlczRVJaUUZ6?=
 =?utf-8?B?K3ZxdFZmaFU2NUJzaHBYVk0vTmNEN1hsU1ViZTJ1TmVTUEdTN0ExZlB6eFRw?=
 =?utf-8?B?MURuVk5LNUNJZDdqbzBmeFJpLzIvZFFkSkZkcmppTkdOTFdmR1ZHbmVoZ3Ja?=
 =?utf-8?B?dlc0c3MrZ09LQkpFbFVEeVVXTGlqa2RGOENFVW1rT2thZnNiSUNZak9mOTR1?=
 =?utf-8?B?elAwTTNjMHduZGUxNFdOak1UT0ZkaXVJMnVOMVNrZGdyejJpY1EvVnlJUUVM?=
 =?utf-8?B?cXZmaHRreE5OL3JRaFR1VEYzTVh1SExMN24wT3l3NnljV1FEcHdIelErVEZ0?=
 =?utf-8?B?UDhxZGVOUmtjeXc3ZHFaNWthbXVlUjJkRUtkTXpiRVpGeTRFRlBHKzNlV3pt?=
 =?utf-8?B?RWtJOERQVlRqbnFvanBYSHA1bjZ6em43NThSVHZ1dXVSYWs3R2VXMWx6eGlr?=
 =?utf-8?B?ZkFtcHA2TkU0UGwvd2pyOEhXbVdUQkJVbzc1U1YzYUN5ZlNjUUhGNm5ObXMv?=
 =?utf-8?B?K0RUMVhST2tXSUJtQ0d6c2hlalNtT2lnWDdmZ2hpWXBvSDNscXg0RGtNWi9y?=
 =?utf-8?B?NVRaeUh5V1I5RC9OYko0ODErRlc4bTVsMnphcDNGZ3hFbzNEY2taT1VWSVdI?=
 =?utf-8?B?d244dVpmVzBhUEM3V3F5K1ZTcG9PTThCSm5PMWhzMGJ6M29WRkF6Q2VWcFNq?=
 =?utf-8?B?YXIwSkFrb0wrT0RNRWQvV1ZiTU5oNFk1ejRuOCtsY3BFR3ZRMENkV1dsZExm?=
 =?utf-8?B?YlVrMHBmOUxqM2xvZXJ1bGdWeE5MOTFLaWw5c2swcTBqay9NamlZN3BWNDZT?=
 =?utf-8?B?RkRuVEltOXRWY3hhenQ3aUdYemcxY2ZYb09SZXpmaWtkK3dRY3N3TEZ6Y1Uz?=
 =?utf-8?B?Y3pnYm5CVlphU3FENy9JRXJYUzVHQWh6aU40WC9EbmN6OVlXcHQ2a0ZXbWY0?=
 =?utf-8?B?N043RUdZNUVDNmREalVmcmg2Ty9hUzdLcXZ6NTNOYU9uOW15Ym81SXRKSUtD?=
 =?utf-8?B?dFJZSmtHL1gvMDNaSEd6QzIzd1RHc0RSK21tWFArRXBWTHhPVzQzMFZkMUhN?=
 =?utf-8?B?eitMV1FvNm5xM1JpNEg2dCtVOHhoVnFKc1hMZHZRcnY1VnZVWkFobmNKcVJF?=
 =?utf-8?B?bjArdFBoeWtxVWpvS2hHSlkycXA5cGJkSHNFWWR0dXJ0bXFyN1RHek1hbDYr?=
 =?utf-8?B?S1lNNjZxc2ljVk9ZQXZOTlVyQ0Y4RWxseENCWXdoaGN2azZvamVjYmtGQW0y?=
 =?utf-8?B?L1RsdkZwSFU3MXZNOENuNjlEMWFtWlBjTnl1dUNJV09KeVZicExHVFVyRWpt?=
 =?utf-8?B?dzd6SEtrNlF0R3ovSlNsMnk3eTcwczBkdTZ2bVptd3hHS0djYzBtd3R5S1k2?=
 =?utf-8?B?WEszcXRhKzVvWnExdkUxTDNYeTYrbjNQMStDODJaM2FrMEVVbkhrdjRKUHpY?=
 =?utf-8?B?TGVucERrSncyNzNlalQ3d2l0MlF1cjQycWp3emY3a3VuczlsU2dwQ0lsVFds?=
 =?utf-8?B?YWVOQlg2Umk5cUQyS3MxK1lVRjhiT0dkQkIrYkFrNFQvamdJMmpJUmVCWWdw?=
 =?utf-8?Q?i37PvMkaXx2SgsFWOdEwVlNiR11sVPBUcmD8aNH8dlvuv?=
X-MS-Exchange-AntiSpam-MessageData-1: NToOcPWhbvB0xQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c224870-7d01-4640-d4c8-08da27a2e43c
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 16:36:19.7942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjeNhZD1gYw2RCconQ98FEdPIuFGeg8q1nYlNDIMy0fxgsb6PsqrDXNsrZtijHZB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5404
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
Cc: alexander.deucher@amd.com, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mike,

sounds like somehow stitching together the SG table for PRIME doesn't 
work any more with this patch.

Can you try with P2P DMA disabled?

Apart from that can you take a look Arun?

Thanks,
Christian.

Am 26.04.22 um 17:29 schrieb Mike Lothian:
> Hi
>
> I'm having issues with this patch on my PRIME system and vulkan workloads
>
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1992&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Ce18d158769fc47b08ee708da27998e7e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637865838441574170%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000%7C%7C%7C&amp;sdata=hQu67WrdUwZn6%2BdXziGz84nMGepI6%2FnlB8XFCFKCnpA%3D&amp;reserved=0
>
> Is there any chance you could take a look?
>
> Cheers
>
> Mike


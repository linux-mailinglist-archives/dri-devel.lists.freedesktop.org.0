Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH2nJ31tl2nxyQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:07:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0654F1623AE
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 21:07:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F50810E744;
	Thu, 19 Feb 2026 20:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="lIhmM1X/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5454110E744
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 20:07:22 +0000 (UTC)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 61JJs2Ea2203158;
 Thu, 19 Feb 2026 12:07:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=Ysl7kvSII/MCaNiI1HqkK4A2VvqTLMEYhyCvu5kBRSE=; b=lIhmM1X/LsUC
 1hXzaQeXWG+5oyDuzX4T8rRFhOq+W5iQuhQTP46LWfk1OVbYUZb/PEWYX1R9LNsj
 w7KZs9lMEyckCe8ORVbej2lUtUPZ4flP+TS4v1DZ4mJZl8rcLUa8YbqcgiJnSCWm
 JUJMkncvzpXGclZ8UxmQj4GhhOXVT0EPjYc8/hn+YUYK6p1SodGtr7WwitcxjZyX
 vCVQVwNwcOt0Bt4dEflFm+F3Sgg6t6SEEYRSJZMbQabuaD7e7qwl+SfQg9nvnOxa
 XFc0VHpqGDS3+KQ/Rxz7vboONQCsfWv+VP/7ni08RsR9c0aKEGvwjm4hd2OItCjg
 MevqKf2pog==
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012010.outbound.protection.outlook.com
 [40.93.195.10])
 by m0001303.ppops.net (PPS) with ESMTPS id 4ce933r3xt-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 19 Feb 2026 12:07:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNM+Rb8VuOer6BG5F97dXfdnHI3rcuclMF3FNkI/DAwj5gvBy7ub46aKC9RyfNjPRt3J7gx6xIWal4k6fnXl0HmYsrXonINohVeW9W5Qx7el0er5OvsjwPOClsjhthvrd2nCFBduocZPEiXpo1HsU0TO9fEv+seyPFgmt4L2Nqa8cGsTW0uSlBGvvFT5gadlRGGQZLMzq98bH11e6LMHXc7Ghit/t2QqFM1Km36GZur3/OGEQTrwg3DavBegdvHwlzuh0/R0L3jdnfZtEQyEMX+IGx0qHqh5Th89DULwY7tJgcTzE6DSnq84mGo/zM8ZV7cMrIhwInwqfzRpNWzvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ysl7kvSII/MCaNiI1HqkK4A2VvqTLMEYhyCvu5kBRSE=;
 b=ahkkVKwLF2LCvnsWi8ICcIE7dJm1yN+R3f8Fmbz55YoidxnfxiNuSQ/4fHl97BDgzly+s5WusXl220WKDmYxXxO4NO2ht88xvydbR6/A+J0XJuyyyaD39mXTDc8B86et0rJGlxYidGG/S9a6xqdl67ZflZczKZDN62Mlo4bPAOgjwryfREZgE+c9gQCSf5Kl9iGAOI0er/U7+kPVPQHZxaoFYgqKG2OFM5sKLrKWXMsk3zopUr5zw9QRb4hnQIn0if39ulSyQmWL9Y88z5+NPtNr9LPZCshkPHumPejsQ64kdxj649oLEzbRf6zkBiFuaqftuvB7cpL9jPzmP6Teow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from PH7PR15MB6463.namprd15.prod.outlook.com (2603:10b6:510:304::9)
 by PH0PR15MB4877.namprd15.prod.outlook.com (2603:10b6:510:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:07:16 +0000
Received: from PH7PR15MB6463.namprd15.prod.outlook.com
 ([fe80::47bd:d7d9:dee5:82fe]) by PH7PR15MB6463.namprd15.prod.outlook.com
 ([fe80::47bd:d7d9:dee5:82fe%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 20:07:16 +0000
Message-ID: <997a6286-ff12-4d0a-a0ce-c87870ab9633@meta.com>
Date: Thu, 19 Feb 2026 15:06:54 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: drm AI patch review hacks
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sima Vetter <sima@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAPM=9twmmLhc-DJV2hFKJ1kahzxRUY5j1cLH9JjZ33LEjjBNbQ@mail.gmail.com>
 <7de4b6c4-f230-4c66-87d8-7766a95cd10b@meta.com>
 <CAPM=9tyPS=B9WEwn8BydwfpY1qLY+umUQxsJBbXT13nqxK1aTA@mail.gmail.com>
 <d1603a67-8956-4d01-97bb-e9b6f17a76b0@meta.com> <aZdjQb7JFa5HGYFq@intel.com>
Content-Language: en-US
From: Chris Mason <clm@meta.com>
In-Reply-To: <aZdjQb7JFa5HGYFq@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:208:238::28) To PH7PR15MB6463.namprd15.prod.outlook.com
 (2603:10b6:510:304::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR15MB6463:EE_|PH0PR15MB4877:EE_
X-MS-Office365-Filtering-Correlation-Id: 72ec913e-8ab6-44a8-7dbd-08de6ff27a6c
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEM1L28vbUt3NlFzNXNscGtjTWdqeXVjbVJkMWZaMWdnSWdjMk5uT0tFdy9z?=
 =?utf-8?B?aUg5bE1FUE9Sd1Y1TTh3cVBzV01vWHFTWGp5Ty9NV2gyU3JQM1FBK2ducnlU?=
 =?utf-8?B?R2JjcjJGNW52STBCSzBtY0NJcVRZN0plZGgwaDdQSmo3ZEI4R1NzZ2Jzd2hi?=
 =?utf-8?B?L0hyUndPTzJuam1palRvbWJHbzZZVjhzUkVHa3UxYXlNOGRsb1BXM2FCTXdk?=
 =?utf-8?B?Q0xWVXkrMVZWYnE5NlE4ZlowUERxWndiQUkra0JUT3pYL1JPTllBeFdiRG1U?=
 =?utf-8?B?ekE5bXlvR3Z3MjducVJ0bHNIWTJCeC83MkhCRTVTYXZiRWJWdUc2dmFVOTNN?=
 =?utf-8?B?Si93bWxFSHFEdEttdzJPUzhPVGJFWEZrMWlnalJUaTE3ZlAxRjFKVkYzNXdU?=
 =?utf-8?B?UTFjMWNobWhUZTk4WEx6WXlnZkVYUE1uKzNObTNxcm5LY1ZPcDVWSUd0MXJw?=
 =?utf-8?B?QmZROXlZcUdvM0Q0Mlo0ZGdUSVpsYzRGd2drNE1SOTVIeTBXekVDWFFJRnJW?=
 =?utf-8?B?T281QnN0MVJ4VVFETGtvVUM2K3lIQVNZeDBvbTVaRXpNZ1Nhdjh2dWxZMzdN?=
 =?utf-8?B?ZVM4K2JSK1BFc3FneWhSUmJIRXh3NjR0L3NUK2FXMFpjU0xHeXdBWVQwSkl4?=
 =?utf-8?B?QUtvdkI5WmlCVkFCQ3VZWWRKRUFNZ0o0QVNxS3Qyd3BuZkFDL3c5ekRpSkdF?=
 =?utf-8?B?S0N1K1RrWnBiWVowbmdCVEs1dVlOL3Z0TTN3Q2RhNTByNFcvWHU2M3p4UkFF?=
 =?utf-8?B?R1lOVHl6SjRocUg0MVQ3WnAyRVY3T1ExTmJUZnorNG1xcG42b3pyU0l5eWZn?=
 =?utf-8?B?aGZpUko1TkxWTlVqK0dyM21scW5sNWE2YUFLZUZ4a1g5VG9pcTdxMk1QUVBU?=
 =?utf-8?B?NVhOeXlpT3ZvUVRkaU5ZdThHOWVhS2hGY1FqMkJGWkdvVXBtTDVNZVg1VFBn?=
 =?utf-8?B?OHpMRklPWFdFS2h3elVWWWprdlVraVZPZE5BdEFVTGZsbE1jVVBPS09ENXFp?=
 =?utf-8?B?ME5NZ0duM1JxT3Z5UHo3aDJxejRraFJTZk11cEYrYzdPQ0JYZEhwMG5aTk9m?=
 =?utf-8?B?T3EzWVc2MG42dm5CTG5JdTUvdE5JVzZ0QUg0VEdBUUtncGVMRG5wQU90dFdZ?=
 =?utf-8?B?RFdUT21xQS82QWV0RlBkOUZXS3pTdzhtUTNFV2pRSFo2RjZ6UjRieHZRbmds?=
 =?utf-8?B?Rk5IWm9wK1Ntd1Vld3ZiKzZiSWdOalNpRm9maFJLd1NYcmV6Qkt3Uzl5RzBK?=
 =?utf-8?B?eExwR3BIeWk0TGU5MzlUeXRENnN0MElaSDE2SlloM1BWTC9qK3ZYS3pBazky?=
 =?utf-8?B?OUw3c3RrZFdmVXp2a1VKRWRZbmV0RWRKWEdBRmE5VjhJSitXaVZjL1pjWGFo?=
 =?utf-8?B?Q3BNZys5Q1J1Rm0zeUtiajNnTTFHcXVlaWRQZ0RaRVRnMms4MWp1RDA3YUpP?=
 =?utf-8?B?OXZrRFlDc0p6UnJ5VWo4TmFnd3BsaVZ6b0FUMW1tejBvSks1WHVHa0FmNmpl?=
 =?utf-8?B?RXV0VWlFRXlDWjdJL2ZNb3ArMS8wVzcvSk5QNlA3cWJOdm10ZTdta0F5RVBU?=
 =?utf-8?B?a09XME5yTkNZK0lxV1hYdEtrR1dvbVlqKzE3YUtXNkNWYlhCQTc3aXJUNkR1?=
 =?utf-8?B?WUhpa0xDNlJtR1d3K0VFeHh0elI4ZFVLSGRzaFdFbkM4THhTRTN3TTl2dDhF?=
 =?utf-8?B?bFRpWkJFR3JUNjRJQ1dvR0s4Ui9aTG14TlJQc2xqaWZ0QTZleE9oYml1TFpy?=
 =?utf-8?B?eUc0TWtrdE4wdnVvL1ZQME56c2hnY0FCcUJmTW5Ca3hMU01RdUNwWEhmaFNO?=
 =?utf-8?B?a0ltTkFXYWdJS1VyYjErcGgyMGh3QVN6azBlcHliZWpNaVo2azVEY3kvZTdi?=
 =?utf-8?B?YkxZQWNDMVNkOTd2NGUyQWJBMmhRWmVYSEU1MHNPK3o3SjN0bHVmeVdmM0Zx?=
 =?utf-8?B?YUtxc2UxamRFbytaMGFDZ3RTNXNFcG9LWHRoSHc5M1RQd01SUml3ZWJ4TFJm?=
 =?utf-8?B?YWhNd2NxcFdMdWRPdGNTdXFlY080a0JXRnVLZmM4ZlJSckhoUEdyRFF4QndO?=
 =?utf-8?B?bmQ0MWx4aW90UjUzMkZxcDNVNHczQkF5UDdmTUlVeWhRcEpLdHNKRHEwZnZL?=
 =?utf-8?Q?EfECDIb+LNeFv2RRem5XmvHbu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR15MB6463.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S08xNmpFYWJKbm9jdjZqMVRQS1ZlNzhQSEptYnl2WmpHdEl0ZklwNTB5L0g1?=
 =?utf-8?B?ZTVtMkJ5T2pSSG42K3NaQXVvMDZsT2NNUHdqYkNmWi9mNHVJcGk1MGdjRlhr?=
 =?utf-8?B?UzhLOXpZd1EvZXdGYm5Dd2Z2WFFDV2w1dmErdDRTK0ZkTVFRaFlpSFRBQ0Er?=
 =?utf-8?B?c0prS3U0MnhwZjhZU0JSK3JGcDNIaTN3RFBaSFRxTjdnUUNzTGFTaUFVamth?=
 =?utf-8?B?R0FySnp5S1VlYy9VTnBPSWxNYUp0TUMvZjhVL2JQUHdUM1U5TXZySXVMYmFn?=
 =?utf-8?B?THphRGtiUzE0WmwzRENMb3MxbFFYWXE5MFBKbXQ4amYxMjJOZldoditPSXRu?=
 =?utf-8?B?b2FLSmtpVEhKWXhGa05CcCtpTE12QURqbGx5YU1adWM4dUhic0tpUEYxNEJT?=
 =?utf-8?B?VEk2T1hIWWpzMjFvN0k2Q0ttOEdwZmdab2hEc2tVVCtEMXkrQ1pNZmRTSnFM?=
 =?utf-8?B?a1lUa1pZVW4yaHhVQnpGTS9pRGZ1QWhQWWpkS1JnRWlNWlI2YVFLRm5KVDJi?=
 =?utf-8?B?Zkk2cmN5bVR2djAvY1QzM2t3Zzc2TUVVTThQZmErMjI0ZGZ3cmVlWXlDQ1Qx?=
 =?utf-8?B?OURlU3dNYWxYeHQrWTZZUG9CZ1FKRFhQVHEvZjY1NDNDb2dwcDQzdW5pVi9V?=
 =?utf-8?B?TUxscndpazEvWmFRa1VnOWp0OERCT05WNWJkKzloOFp3K0gyVkE2NjFTQnZa?=
 =?utf-8?B?L25uKy8zeU1lYjFDQ2xoTDkzWlYwYUd1cHZhaTJJcmZpTG1EK3dZYVJKRUJp?=
 =?utf-8?B?QWo0RU5sWWZiQXdJVi9wSlZabHZZQk5SeXlhaHdVdE5ucXZ2c3ZBR0t0NUsz?=
 =?utf-8?B?ZU1iZ1FiT2E2RGQxcnkxdVFzS0tnQnRETFVqNWE4QlBhcW9QMHJaUUpab1dl?=
 =?utf-8?B?K0tMWGluL3lDRUVpcCtjN05zU2N4c2dPbjR6bWVEcWtraE5NNDRpTDZhNGJm?=
 =?utf-8?B?aHluWEZaRzhGa1RhcVhCRng5eHRZY0pxVy90eEx1N2JBY21HVUMzeUJzMnJq?=
 =?utf-8?B?TFVjaURMcit2cGRPU3REOGw0U0pQVHd0V0VDVDJacXVnVlhmb09RY0hwcExU?=
 =?utf-8?B?alprQWMzdXEvbGVxUjZReCtzN3IxQ2NYZ3llZDJxM29zYmU5cGhhODdMUC9x?=
 =?utf-8?B?RllLUzVvNU9FbUcralI2WnlFTXU4ai9reFRWdStnMmppalg5NU5IRTd0NGZH?=
 =?utf-8?B?TU01bG1YTEF5RnZ1dExGQWZZcmFBRkVrR3lZT2M5TEVjRis2aUdLVjdDalkx?=
 =?utf-8?B?Nk5lS0d2ZUs0SVlOY3BDOWRyM0JOWTdiTTRxWEc5Smk1cXpXMU11eGg3UDZ6?=
 =?utf-8?B?Q0V4WWpNL0xhZ2NXcXEyTFljOHBHWnBqWk4xeExrZXUzZDhBR3M3cnhXdGlD?=
 =?utf-8?B?aGc5WCtJM051bW1YZlpDZTdCZG9hMzVtSlpBMmJmYjRzNVZwL3k2eE51Z0k4?=
 =?utf-8?B?V0V4czJMdGh5a0NDYy9PNk9GZU1KWml2RS9RblcrR281Y0tKRDBWaWREZ3pS?=
 =?utf-8?B?M1FZV2xBK2w1bTNsVHg1N2plb2NYNDZYYVI5TUtIa0hybUZOSkw0MDhxSk1Q?=
 =?utf-8?B?ejhTYUNrQkVTd1c1bDhRTnRxWWp3QVQ5S21yMzR1N3dJMXhjeTRKKzlFbUNs?=
 =?utf-8?B?ZUNXdDM5QW5VRjZ1MnV6MndxNDI2SlRrVEI1SmhJdEc4K0RMTHJqR2xrQWV4?=
 =?utf-8?B?MUE1VzUyL1FGYzJJVjR0VkNuOVNUbjIzQ0RPSjUyUVl0VWJZYmFTMlBZUm5o?=
 =?utf-8?B?emR3VDhOdmQ3dC9JbHc5amRKY2pNN2hQOFp3SHl0Rzl4VFlJdk1LdmFGZDVQ?=
 =?utf-8?B?c3Z0eFZibngwTTVKcFFKK0VRZVJvYUFoVzgxVm9ocVJoMGpGRjBKYWxqNDZt?=
 =?utf-8?B?Sm1vaU43WDF2UHg1R2R5S0RzUE9kcnFtMUw2NXBWbEpQTnZCV05QOXF2T1Jj?=
 =?utf-8?B?UjJoUExUSTNieVI1L3haWW91VkhWU3poWmU0SW5UdzQrZ1FxU1lIamRiT1ZU?=
 =?utf-8?B?dHUvV2VzQlVsZ3ZyaEZ5YzlaQ3dNVGcrVXJMcjV0bDJuMUwrdUFMZS9iN0lh?=
 =?utf-8?B?N25HbFUwZ29BbFR4ckFodmJhNGlDUXBjdnJDTllGRnBnZkx6eXBSenF1akU2?=
 =?utf-8?B?dm5sMUhaNEQvcWI4ak9neVBManBIYllKZkR3eDE4SWJRTFhTZDBlQnkvZVNY?=
 =?utf-8?B?bVlYWDd1dUpnQTJhQ0xCejA5MGo3ak9JQzFoQnB2Y1JBMFRhQzU1alArbkpH?=
 =?utf-8?B?c3hiZzBqaFd1Uk50ZmN6NVNNUDhmZHlYLzhCelJxU1hMcTNDVkpNeWZGdFFy?=
 =?utf-8?Q?DaQktv/ebfZ3vxw9jY?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ec913e-8ab6-44a8-7dbd-08de6ff27a6c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR15MB6463.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:07:16.4552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cF9HlCM6Y4xQNP4q7yMwQRf72DsrbWYErSJT4k5w+XWPqLzgpWVtDWZ/tgv1R1Mj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB4877
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE4MiBTYWx0ZWRfXwNH7W4YnoIyf
 IWEsi47nEIvpxuZUIMUiKgZePK/cJTDUpfL+Btuooxv+dxtwypWR09PDoxrY7FMZmX5cUZeH3xj
 nkHJJO11eXuIdVan4X2mkoFzQpiQy7WXpxX400rtU1ghIa6rSr26I+My8CiqSLhaOejpmBPO1Yl
 E/V4C6gHQoQiKRWw2G6GnCdcd2w4j+Pv4P9wp0D8gE1x9REECUKg5VU+33IpkoFfqlJTxTjZCUN
 H4n91XUBiBax2FZ4OHN0TqKtipcqn364bRWTY4FjmWX3bMRcGum6fvAf4mUmiaw+wxK7EZItjsn
 pSeExK7EVmgYERB4aPzApsFKPp05/q4R1TYbhinUU0C1bWHuod/6TL6jhjbIATSf4Dcm3gNIbgw
 EuByF7R/fxtHRGhjE2F/Wh8m2qhZ0+txGAc0wrNGo2RT8OpCdUJ9mzOG0UblczGFjhzU4pVQjGd
 4MsU5zHf9xrnSNMFtsQ==
X-Authority-Analysis: v=2.4 cv=TN5Iilla c=1 sm=1 tr=0 ts=69976d76 cx=c_pps
 a=78/F3YNzMekUCeQDO2i9lQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8 a=SBWdxWoyx6EP6-zuGI4A:9 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: LcAYQP4jGICRBcgUolv1m3Kc9JbD9cFW
X-Proofpoint-ORIG-GUID: LcAYQP4jGICRBcgUolv1m3Kc9JbD9cFW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[meta.com,reject];
	R_DKIM_ALLOW(-0.20)[meta.com:s=s2048-2025-q2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[clm@meta.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:sima@ffwll.ch,m:torvalds@linux-foundation.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ffwll.ch,linux-foundation.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clm@meta.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[meta.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,meta.com:mid,meta.com:dkim,meta.com:email,false-positive-guide.md:url]
X-Rspamd-Queue-Id: 0654F1623AE
X-Rspamd-Action: no action



On 2/19/26 2:23 PM, Rodrigo Vivi wrote:
> On Wed, Feb 11, 2026 at 03:24:49PM -0500, Chris Mason wrote:
>>
>>
>> On 2/11/26 3:05 PM, Dave Airlie wrote:
>>> On Thu, 12 Feb 2026 at 06:02, Chris Mason <clm@meta.com> wrote:
>>>>
>>
>> [ ... ]
>>
>>>>> This is also just an experiment to see what might stick, it might
>>>>> disappear at any time, and it probably needs a lot of tuning.
>>>>
>>>> The output is pretty different from netdev/bpf:
>>>>
>>>> https://lore.kernel.org/bpf/?q=AI+reviewed+your+patch  
>>>>
>>>> Which might be what you want so it's fine of course.  But it looks like
>>>> it didn't actually go through the report generation from the review
>>>> prompts, so I'm worried it didn't use the rest of the prompts either.
>>>>
>>>> My stuff should be creating a review-inline.txt which is the lkml
>>>> formatted review.
>>>>
>>>> I'm happy to try things out here if it'll help.
>>>
>>> My plan over the next few days is to refine the code to make sure it's
>>> doing this, my prompt asks it to load the patch and the kernel
>>> prompts, then do a review across the series and individual patches,
>>>
>>> I'm guessing some of the results aren't making it back out the other side.
>>
>> I had to change the prompts a bit, I think my original instructions were:
>>
>> "read prompt xyz and patch abc, review the patch"
>>
>> But sometimes claude would read the prompt and the patch and then follow
>> it's own review protocol instead of mine.  The current /kreview slash
>> command is a lot more reliable:
>>
>> Read the prompt <path to prompts dir>/kernel/review-core.md
>>
>> If a git range is provided, it's meant for the false-positive-guide.md
>> section
>>
>> Using the prompt, do a deep dive regression analysis of the top commit,
>> or the provided patch/commit
> 
> Chris, first of all congrats on this work. I definitely loved the results
> I've seen so far.
> 
> I hope my question doesn't bring here the old LLM discussions. But based
> on the old discussions and people afraid of AI slops in the Linux Kernel
> and the potential increase of noise in the review processes, I got myself
> wondering if it would be possible to add in your tool some prompt to flag
> if the patch/series is a potential AI Slop.

Alexei had asked for something similar, so I did put a few lines into
the prompts for it, but I haven't spent a lot of time defining the
signals that might get used to detect AI generated patches.

Right now it mostly seems to detect AI generated commit messages, and
while I haven't been paying really close attention, the ones it does
flag don't seem to be better or worse and commits than the rest.

Example, scroll down to the end of this email:

https://lore.kernel.org/all/2ddebc81fe2a7d80441d6cf3d27bf6973a4d0a233d6fdbb332d09700775d7f86@mail.kernel.org/

There's review metadata at the bottom, you can search for
"AI-authorship-score: medium"

I didn't find any "high" in a really quick search.

If you have a couple of clear examples, I'm happy to try and build out
the rules to better catch them.  I'd like to focus on bugs instead of
the slop part, but one does tend to lead to the other.

-chris


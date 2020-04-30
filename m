Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D41BF586
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 12:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3D96E21A;
	Thu, 30 Apr 2020 10:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9156E21A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 10:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJOUrnNEkitKNsjEoC4ru4wIslxGNOAWGFwPOzLaCA3yDWTLFIj4/K4T5hVDTjp3iJqqBx98V+WCaQxbhrhqg2ci6grNEkDvwKYVe7ZCL7z0/O9ew84ia9l1Hc5PRuEBMlx5hGmIerfJi+0chu+GlGVCVfBiPyWO8BmVB/9o9UMhg57gL5TzopTe/BOhtBCFsAzKEQScfgs2rUwOHcExbeskasmIfDkrCnMu70S32wHV5nmeTqw93waRJPY+c3Cs/20ATGEFL8mpVKX5Gn///DpXBT9OKP48y+LfmQ++/rx0THLpU68Hx2Mm5+a6+SpMJj7/pc99Kv5BRXsLjED9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf5/7cVIzA9V/79cA4mUSPXIcEZngZq4Ixcyuf6nq+4=;
 b=MfH/fHgoHWV8c1/QZh5eNMPteDBhVeD2WSuI5Vs21m68YUXycHLqr3qCfE2iekTWdf6k/P3nRiWETnojZPh8M6ZObV24QMQTqW88trYAlOCNfoE5pDCqXleBiM/NTlfP1ITF3J51CGoqgKMarmrFz4PW6QxcRLX7FKqM3uhIoczE3hgcW5msB60Y/F4ssKPEiMlvVGPnWpFX+vpZnTqgNokzGYuE8QO8TNBldfl5zxy6jy61g/+SmAMcLGx3WcFKPhRtoL4hgm1F/z6X8cwJp9+fyqUUDMBfSLMOuP0kKIOXuu7YDF8JgkFYh175rCytujghBpNapfPpM+GrgWigZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf5/7cVIzA9V/79cA4mUSPXIcEZngZq4Ixcyuf6nq+4=;
 b=L1ZYo6h2y4I6S80LncthXsOXrwodZluIJSQIHPv4cb+eAN5Emzawg5KnnxjgNgh3omfS+qfyzdhJWPLjTnUq2OJqRgHBkj/DnSm7TcHRAJsHM6GAN8g0PoUmR11sejpeQ9UxZKf9AbS0WdG4NoUmeLx+i6ZKsZIOgu4Fk6ZWq9Q=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3872.namprd12.prod.outlook.com (2603:10b6:208:168::17)
 by MN2PR12MB3168.namprd12.prod.outlook.com (2603:10b6:208:af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Thu, 30 Apr
 2020 10:30:50 +0000
Received: from MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c]) by MN2PR12MB3872.namprd12.prod.outlook.com
 ([fe80::c578:193b:bda9:ac5c%7]) with mapi id 15.20.2958.020; Thu, 30 Apr 2020
 10:30:50 +0000
Subject: Re: [PATCH v2 1/1] drm/mm: optimize rb_hole_addr rbtree search
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200430095839.6474-1-nirmoy.das@amd.com>
 <158824170487.7361.8387026848955948115@build.alporthouse.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <d5789d27-bf14-c1e7-d9c0-71fce6e16f24@amd.com>
Date: Thu, 30 Apr 2020 12:30:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <158824170487.7361.8387026848955948115@build.alporthouse.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0105.eurprd02.prod.outlook.com
 (2603:10a6:208:154::46) To MN2PR12MB3872.namprd12.prod.outlook.com
 (2603:10b6:208:168::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f21:4500:5588:d474:6d32:bfda]
 (2003:c5:8f21:4500:5588:d474:6d32:bfda) by
 AM0PR02CA0105.eurprd02.prod.outlook.com (2603:10a6:208:154::46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Thu, 30 Apr 2020 10:30:49 +0000
X-Originating-IP: [2003:c5:8f21:4500:5588:d474:6d32:bfda]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b931a40-4339-4b57-76c5-08d7ecf18da1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3168:|MN2PR12MB3168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB31686D55441C4F5D730EEEA68BAA0@MN2PR12MB3168.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0389EDA07F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3872.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(2616005)(316002)(110136005)(8936002)(66476007)(966005)(2906002)(36756003)(66946007)(66556008)(478600001)(45080400002)(31696002)(8676002)(4744005)(5660300002)(186003)(4326008)(31686004)(6486002)(53546011)(16526019)(6666004)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3+LmfGonn/MS/j6QUm2Tw89DY6xWWt/dkTvVReCRrnm6X8QiMRqAx1lXZECnZhTbfi8SojQFMv81WSphU40IKozc4Bw/tBDiSjcdrSJXEjt4X4DOacN27AyDD141DDYH9IWIhauXt+VQBtZsuudfuywuO6Wp7nN85S+hEZJAryc49bHuNBhh2tJEbDql5BfFrAlFAa9Sdpi8Gby8sGq8nOcgeQ65iENBTlDkavfJj7Sc4+8/jCS2eEtsCUhsx7JJ28qFWRkWsTI9iP1GPmXqcY/dA9Eq4+H4Wyv+W6B0/Vq8NoTEwneD8YlzVcIu4mgRM9enOZ7PVhlzJ10Vd59YVQsmfq1Fa2ozcs20PaKI7pK/6yqYqSsJZoHGkPd70N7SmwjHtEpXMZE0DD8RZkRJY2ngEDQRVKkVTuY+0kjZR8/T8QwL5PhhT/M/0HdgJ4uphr5r+GO9O9E0MJd8JdLVr2+7o3PNHFcUUEpfDD3lvw=
X-MS-Exchange-AntiSpam-MessageData: OJ/UUxpDZko2XqG07EM4ro8xV5FdqIVTjQp1Cptc2Sd0jDd14OfU2C5MYOksmPLNVKxqAzlfDf70tuM3UIPNvbVqIBQnDEXpNhvNUCdsylVGPcOpaIK/o/yVO1MEULQm9EKcuAM5UpX0q1GtXZEr6oYNORD08Y+rFklOm2WROWu+Gn7yCPdDEo77RwlUj1EHQaJ5dLe7GGDV+9J7IySM+jFPo7+azXqsOTzZEqPJDE5bZV0D26PzAcWzL6yA0dB21b8ZRWjNvW1A5hAVWAfqjkqEjM9642YGV9BbZYneGXkdjweuW18gbtsA3Rjw1/RF9TTq/fSAiBVQjWQH358doBTFPQa//rmKRtt6jSkQjHxx7tWm6dsrC1c59EyxvkwAJKn+2X8qtWwcyVf25alpRCbz0S86E6NtWvsZvfEQz9qxD/t9QiRBijR7aRtxVzo1cPIafNhrN/VCV4NDz/lZxZZkkBrdMMzvGcdxOBgue42OtSgZhUzKShhLyrNH9lP2AV+V9fMRtlmDaWsP16HIDe+PMKibyaKPXXjK70ldqylGDpjgj6wJN4D8ud5Bph8wAr9oKTWZ9hcGEUWxqi70sC+QCfO82UUq+p3G48gTLRPuzeegX/a2OAB+aC9bspHPQWgSrdzP6KZg1y/mgyCT5CAP/9HnhA4nAh520we2HylZOsvM4G9hTC68QPAEb4BKvL8SqXbRE3JGhHAhP1OkUUy8iHO/iEygR9dtS1FFaiaAfr6nZKlml8eJ3rNj4OZMq2MGTUZ7pdtb+K731JDWVT9pmGMHT0YqPEsOlDM9HlByM7RFdopgS5RdYaDGPC+Rn5ngvjVhZijEfO9UfyY/D3R9qQ3tDzgl6mfMGNmZKCc=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b931a40-4339-4b57-76c5-08d7ecf18da1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2020 10:30:50.6055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7xvb+YqilawB5iSVKz6Uy6xzGdlEEUSDR9f9Q3vYG4cAhm1k+Q/6udPt5D6UViithbJ+puGxzGVyETnukJdqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3168
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
Cc: nirmoy.das@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 4/30/20 12:15 PM, Chris Wilson wrote:
> Quoting Nirmoy Das (2020-04-30 10:58:39)
>> +void insert_hole_addr(struct rb_root *root, struct drm_mm_node *node)
> ^ static


Ah I forgot!

>
> (sparse [make C=1] or make W=1 will spot this)


Thanks for the tip :)

Nirmoy

>
> Looks good, I'll check more carefully later.
> -Chris
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=02%7C01%7Cnirmoy.das%40amd.com%7Cfa3f0888c45546cdd9c308d7ecef60eb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637238385206441661&amp;sdata=%2Fnn7QOOukYEcawU0bZ5WWjy99TVOpWouNPxlC8%2BW2FU%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED42ED443
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C856E4C9;
	Thu,  7 Jan 2021 16:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2486F6E4B6;
 Thu,  7 Jan 2021 16:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW0vYZ6wcKqoUEWGzunprh2qNNKvhGUNCgbFo+M5Lm5jvUQpiakIM3RGOAk4p/8R89DmeiQZgZvtdzc0HrWXcmKXNb80OG4YR5mdN43qX4AOFrN3tl7PoqhJYy0IvnC7xVrVWmnbegDcf2NRCIH1njxRKcQUfoO5dvD+HQWYLZgCJDZGUUTtm1c9AQ7jNPBOpNZPfdOEtnvTqcDqvVPskEKn8YqO+R+xwgCwAmGUUvFmn7HLnTt9EZlDUlFFXg6dcPJAG0vkLVuml/hSNjSt5VU0BkLdH5FPIIE2djm1C91jorMk1I/0vfOQwXclGLadHA0VG/ym3zYQZ9qVFAelqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU7IyNP88rGb4ssW7dxNcJYHHVR3yksxcogbu1YiQ9Q=;
 b=OTlKBEazccYBG1cSafFKO/MWKtwJhMXf+I2SL23tu7109Z5AeFMyo1ZEFCxwGlVx25hLRKEvH2ztHzc4IH97XhSn6A1EMEC/FNAdW8CDXcm2PKR+rZyKguoRTsNIHf1gG/5nUIHuwH4GSlFCfPrTcvdn7a0Eq1O61YOIqfhfiZa5ZBcRK/SCMVqog9LU8dSmvfYTfQJf/Xnpp57XdOzz7vqV5/9n18h+E18dHSk/anm+pq6eI2NKVcdk/O0vfMxdH1HQ38NEgj0HNBuhld2WVBPNBZFIpjrCWE3wNb4OihxAKPrK6VT+Yd1eFJSio5mphCu4+0gFajGlIP/LorXzAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IU7IyNP88rGb4ssW7dxNcJYHHVR3yksxcogbu1YiQ9Q=;
 b=bc+CcoWpCwKNzRgSHmV4uP9UA3pbztc38XBHkICLwGb55pP8H/xe4CShO06/oFAp4rfL0wZZ3hxAT8lvnLj9zIfhacsj0gfuFt4/L1wlSwDrjJqS70kykEL7vUFno9ORlWHt4LwP3npMHN3pvbw+6FDPG5qnARFXXs5Ouy88qjY=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 16:28:37 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3721.024; Thu, 7 Jan 2021
 16:28:37 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
Message-ID: <8db832b8-b1f3-68fb-6c5b-c74728832f0f@amd.com>
Date: Thu, 7 Jan 2021 11:28:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
X-ClientProxiedBy: BN0PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:408:ee::12) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
 (2607:fea8:3edf:49b0:3021:14a5:28d4:9466) by
 BN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:408:ee::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 16:28:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec1fc1da-0d51-4969-be6f-08d8b32948ee
X-MS-TrafficTypeDiagnostic: SA0PR12MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB444749D1016DC81FDC4D5349EAAF0@SA0PR12MB4447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h73mzz+8fs8IK3pSOUhTC86U/x7Ma6i4SThtdS+k/una2gBcFgVHBIE9zaMXZRmfiqu7ZHS2FfpYrN45HeqlVw9S4N4hI4zLd/ShCISGPqXwoDG8nyG3BOXLoG0CDI8cGoBwExL9FjSll90HM/u5t1InMEDHJOyl3Sfw1ziyagVecjYm18ZzGjiw/zH12/E1HcjCh41cYCytVTbnfhHH+J/t9+4hxwGrT0viO6H3AfpB0XGzv+4l22iIMgPDCDU4CvzfeLKcGdZV2oZqtqlB0EIRQu7hZJM3gqk9HFFNGO1qUsz1PQaKUvT0okhsdOQaX4bzojT7NsHUOruUmwiYcWrDvThWeVzEPGyAg4slJtGM3Hq1GpySifbDk0Q7wXqNp3/+EpJPOJXFe4Guf8cV08RHiJ5Kipd0uqwt23MbTNN/kYG8I7JoEt4GriH3q0AJQIko9VQQG7kzW90BmXGkkoD+Z5W2KYDFn/GYaSV/GJo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(8936002)(4326008)(86362001)(316002)(6486002)(31686004)(8676002)(5660300002)(36756003)(6916009)(31696002)(16526019)(66476007)(66556008)(186003)(66946007)(53546011)(2616005)(7416002)(478600001)(2906002)(33964004)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THNrMUdITlRGMWlQRFhHRk5va1JXM2p3anR3V1RHY01ueFU5UHdXbE8yZTA4?=
 =?utf-8?B?akxBSmt6Qm5TM0F1MG5IWmZJQUFpYjk5emdqaHpwSEIybkFpS3drNktZem1N?=
 =?utf-8?B?MFEvTlM5SGNGdmgrUWQ3bHc0S3pCc2JUTFhqSGRWV3N6NlNKaHBJNjJ0YTl2?=
 =?utf-8?B?a25mWUNxQ2g2WFZpMkttTGNSWkhVWVlKTGc3NjFxOXZ1L0hCS1dwQlM1VklI?=
 =?utf-8?B?dTg2RExTWnRjK1hteWd3bHpUazJBSjBFWHZoaXkxcStWcWJ2ODBXKzJWUVRs?=
 =?utf-8?B?TUtxZFNKUGVoKzNrcmw2NHo0VXBPcllEeFJ3alBJbFgvM05DcnpXMWNOL0ZQ?=
 =?utf-8?B?MHBMYkx6MEo3bzVFNno1eDUwSVpzYm1mdWhxZStXckVzaGpEcStCSHFZRlA5?=
 =?utf-8?B?V21nVm44V3dUZjdTdThaOVpVTVgxanFRdXM0VXFRQ3dFUFJQTVVtbUFWU3cz?=
 =?utf-8?B?dGF0NS9oRmdueHlUNTA5V0g2VHJhNDdGeXdZMWVxTGYvOE5WNmtJZG92TXN6?=
 =?utf-8?B?a2hSczhEZlVwY1pma05JV1FPSVJEbDJqaEFXN0RHNW9ORFRqcVpCYnZHQWUr?=
 =?utf-8?B?cnpaV2tub1h3dmRNek1RVFpTQVhPYVB0WHRRS1l6dGV4RkM2YmV2Z0syS2hC?=
 =?utf-8?B?SkJsY0ZBUElOdDZLMDMrU1htTXJ1azVTYWN5KzJsc2V3aUVZeGNLQmM2bWFa?=
 =?utf-8?B?eTdobXg5dEdBNmJ2V2NsdFlhTlhIVFJvVkdHdjhjZ0FrYlVHdGZsVVFiWExJ?=
 =?utf-8?B?UUt5REV4a1JHZFhjSEhiWHY5Nm4xWHM2Y0N3dCtOM1Jla2tySWxPaUNlZGFs?=
 =?utf-8?B?aDlZM2xNVmRTL3dNNXNyNldrQU80RDUxRmpHeHRZdjZ1cE1rS1pWb3JTU3Ra?=
 =?utf-8?B?TFhIUmlQVnR3Ty9qTEZLK0xwY0o0V2k5dGFFNWk1WWtRYWhmUXJsa013dTJy?=
 =?utf-8?B?MGE1K1dHRnUwazlHK0VhZ3pyN05nODYxSlRHRG13Ym5WNTFPamlRQ2VaMnVL?=
 =?utf-8?B?ZXY2eis0TEV2T2U0bVFhQVZyYlcrZVFkTW82Z09YWlFtU3pHbU5FeEMwNnAv?=
 =?utf-8?B?cDRaaGVBVXpyQWdxRXlKQThZclI1TzRHVDh4T1dOT1VDdjFydTM5dnBZM2hi?=
 =?utf-8?B?ejhSbTJMNXFuQmJWYkVaSTBiVTJud0lIcWpxZy80aUEwUEpjdFpLYktDRXh0?=
 =?utf-8?B?MExmNURta00yQkt5dDJzL0FoNGFSNmxFdVQwSGhzaDkvdFZPaE9aM25xMFNk?=
 =?utf-8?B?a1Y5cWpvVDBhQUlTK21reWcybWpXM3ovUHI0QXdKM1d2dmczaW1oelFERVRI?=
 =?utf-8?B?aGZFdUhSOGdseEpIZ3pQZ0MrUlVnVjNvcVY3WHhFNUFiS1lBaGFmRjlNRENN?=
 =?utf-8?B?UkpyRDdFSVpCTzJzYUZRNmpPY2o0K0JzSVFMbG5uTkhIdmZoY2x4QThneC9T?=
 =?utf-8?Q?AP3cbau+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 16:28:37.1202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1fc1da-0d51-4969-be6f-08d8b32948ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDXswYL+Nh58NxKcL6VuZDa05odQeD7IkfREFsibYiuk7YprbX8jBiAy4ETe6eT414adnhm+2SGwt4USvZGpeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com, christian.koenig@amd.com, yuq825@gmail.com
Content-Type: multipart/mixed; boundary="===============0369290550=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0369290550==
Content-Type: multipart/alternative;
 boundary="------------3D68879E40D28E69B41A01A3"
Content-Language: en-US

--------------3D68879E40D28E69B41A01A3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Typo Correction bellow

On 1/7/21 11:26 AM, Andrey Grodzovsky wrote:
>>
>> Or is the idea to save the struct page * pointer? That feels a bit like
>> over-optimizing stuff. Better to have a simple implementation first and
>> then tune it if (and only if) any part of it becomes a problem for normal
>> usage.
>
>
> Exactly - the idea is to avoid adding extra pointer to drm_gem_object,
> Christian suggested to instead keep a linked list of dummy pages to be
> allocated on demand once we hit a vm_fault. I will then also prefault the entire
> VA range from vma->vm_end - vma->vm_start to vma->vm_end and map them
> to that single dummy page.


Obviously the range is from  vma->vm_start to vma->vm_end

Andrey


>
> Andrey 

--------------3D68879E40D28E69B41A01A3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Typo Correction bellow <br>
    </p>
    <div class="moz-cite-prefix">On 1/7/21 11:26 AM, Andrey Grodzovsky
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com">
      <blockquote type="cite" style="color: #000000;">
        <br>
        Or is the idea to save the struct page * pointer? That feels a
        bit like
        <br>
        over-optimizing stuff. Better to have a simple implementation
        first and
        <br>
        then tune it if (and only if) any part of it becomes a problem
        for normal
        <br>
        usage.
        <br>
      </blockquote>
      <br>
      <br>
      Exactly - the idea is to avoid adding extra pointer to
      drm_gem_object,
      <br>
      Christian suggested to instead keep a linked list of dummy pages
      to be
      <br>
      allocated on demand once we hit a vm_fault. I will then also
      prefault the entire
      <br>
      VA range from vma-&gt;vm_end - vma-&gt;vm_start to vma-&gt;vm_end
      and map them
      <br>
      to that single dummy page.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p>Obviously the range is from&nbsp; vma-&gt;vm_start to vma-&gt;vm_end</p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com">
      <br>
      Andrey
    </blockquote>
  </body>
</html>

--------------3D68879E40D28E69B41A01A3--

--===============0369290550==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0369290550==--

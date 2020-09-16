Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B12126C389
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 16:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753D588C5A;
	Wed, 16 Sep 2020 14:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F16488C5A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 14:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPckStrmAvqrF9qczfWbKFzrUEJu3fxdVkIn4CGR0h8MJiIZ5/MdH9OmLc7+CNmXTWqFEolhY4+7p4kRHCbqHr32NR6vlnKQsrLnRoc9FvEHwDm9OkDQm6uhLKOqZhO/5T9/ZniUdljJZdGMxUtpeapUu6zOXFuSaHJ3Y6CcW0ObotPdBMdepu5I8TuuXS6RZTk333HYRnljSaqEy1xBZuqigetXJxpRiiKWpw0Hp1soNUj33/AOQUzSVlByy23C7kUSunb408UwklDE84mdoffrXlTdVDUIfnVyhyLV1ekYI3AKToMYODruvaCP71v3nbdoK+o9l8AyXjqGciGuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rez1AarHQgPeuHFvhBkKF/WjIJALwOz78hL2C0zvC4c=;
 b=RQCVNMhsFp+llnR2YtuzczBRIfcC2tC8mcIUN1wIVjuvGm+3IxZWxDdmI3SNS8bo3yzVoMgP3/phXrMD+FJrpJAtt2xumUm9oem8g4yU1XDilNx8oDGXUUz/Ocy04PMJBCB1HzAX9Hdqg1eVb/lYmGxCDM78X4ZvFPEUzKKdLqosmDadVk6ST24qwnXAiCfJBUiBWWeawRWllYFXfx5g+GkvD3WBK+lJHRKaSesK4mqVYWzxmmQOWtNReJ+Yi8hgwqnJLi8/HxzKI/qVDvxQ7KLcxfD3fZtu8CAEIo+zBcR5e9WbwK+3fyuC5vBt2+pxA/pP5jL1+rX8Hw1+l4qbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rez1AarHQgPeuHFvhBkKF/WjIJALwOz78hL2C0zvC4c=;
 b=qNo5jvdL6RW/0CmXMexMFohsZXbspIwWzgbpCXRsi02iPAUNbKTsAEtJz4ejSLaBkKuT1OiXEzztfGJwtbCn+t5OK3dSEX9pi8epq1AYBpl56KJa5wH80awkOaVUJS/46WVzeZh4v168fvu/528Za8fyY+JE7C7cDG2ge7h5pS4=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 14:14:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 14:14:24 +0000
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
To: Jason Gunthorpe <jgg@ziepe.ca>, akpm@linux-foundation.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local> <20200916140710.GA8409@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8db2474f-ecb7-0e17-5f5b-145708fe44d5@amd.com>
Date: Wed, 16 Sep 2020 16:14:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200916140710.GA8409@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0099.eurprd02.prod.outlook.com
 (2603:10a6:208:154::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0099.eurprd02.prod.outlook.com (2603:10a6:208:154::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Wed, 16 Sep 2020 14:14:22 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 74d6b4a9-dd56-4ec4-e1e7-08d85a4acfff
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4438DA0A247D2BFDA26BBD8783210@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ubN5pZ7Gk9tchSXD73JfxeDr5XZBdWSGuN+CDmFy3a5Lp/lnOsw6/DYKuzAHx88F5xXY8OZp3qVBbLQs/koyrdpmOKbqhZBVaGoXyRjJoQ4vJzwSVt5kBtEoDDKNC3973CfUMXDfBazsGqMWF5cX9x+XrVaX4k/ig+tO0ufPMcZgHYy7l5Szpun80fB646HJ6Eh7+4uklXiOko2OyGb7S+W+lKd2vqmrtqVCHWPFwQS8NGRhvdfl0homPVrfa7tJNDXhFnkJnOdDZ5vsTgE+Xx4yMNCij6O/Dl9zPmeDaQPyUDzS0QzmauxuAle2H+/IamtKfK9bI0LkJqjVr7pumf0S4GSLfwgAy8WaNT0wfAjtv5gG1fB3Ii6mvAjnTA3S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(478600001)(36756003)(8936002)(8676002)(6486002)(6666004)(31686004)(31696002)(2616005)(5660300002)(86362001)(66476007)(316002)(2906002)(66556008)(66946007)(16526019)(83380400001)(186003)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IrNcftLaojgvOQV/gpCVeEmJsz26wCk1QiPA99h6t+vMuuGH3SudJ62veDV3JUnJmokHRCMLfuQX8U4aQiGg7zzqLa2cf2WRxUiIZXjpYOp7FcQVlgegzIrT+tbYeY8WLfYZtbxLg6rXDJ6xtLUWusSTJfKI7sgf75toYtTufMzAOY3R4iFqU5F9F60zfxtcNT3SrzLfbQLlyL45YmJVe+3D6Zxtyx3LPsZ8RrR3OjLZIzENnT6/oEEL5iHkCLgFHvvT+uwM8HPuMf1Y2JgdUm7VL+JG23zur2k/+0OggRawg88jM/P0jv6V022DwwfuujRRePw3a0cEXQDix7z3gJdMFJB32AYxU9gVCQa53v7LVWC/8sxoEhqP9gIyuVjZk8An5qyR0zzVESUMr8qufkaPt7BS1Ss61VvXFLHfXqqZ65spedHXAQysZhq6qR5RPEWXARFAc+IasBRIquKkUJT2oTF694+3Chys/ai6qr5pX9FZb2BkesJJwaEDZVad7ZMAoLnH0mMO5kfhpHV6OWZw2HoguOl+T/ymMLMAmwjryJJgKBYdcnMMUD6xGPyuibQdYfWKZYWR1H6ChUDc48ms+Z+1c2174wZf6DWOdmfXUIq/EkIqkZrGy+tO7wISaN5TZR6VTY2060BDc2vVfpxH24K6qU9LoeOhV0gIrSEd1UMtMdbvHETm8C7htZJe+r4gg424knabrjEbdYZWvg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d6b4a9-dd56-4ec4-e1e7-08d85a4acfff
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 14:14:23.9056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t5AgoaBMnnoRyOLqXfqqk6kHxdRciQrBcNfPC0xsGD4GG12Lxa1yzMSNcMXHTIS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.09.20 um 16:07 schrieb Jason Gunthorpe:
> On Wed, Sep 16, 2020 at 11:53:59AM +0200, Daniel Vetter wrote:
>
>> But within the driver, we generally need thousands of these, and that
>> tends to bring fd exhaustion problems with it. That's why all the private
>> buffer objects which aren't shared with other process or other drivers are
>> handles only valid for a specific fd instance of the drm chardev (each
>> open gets their own namespace), and only for ioctls done on that chardev.
>> And for mmap we assign fake (but unique across all open fd on it) offsets
>> within the overall chardev. Hence all the pgoff mangling and re-mangling.
> Are they still unique struct files? Just without a fdno?

Yes, exactly.

>> Hence why we'd like to be able to forward aliasing mappings and adjust the
>> file and pgoff, while hopefully everything keeps working. I thought this
>> would work, but Christian noticed it doesn't really.
> It seems reasonable to me that the dma buf should be the owner of the
> VMA, otherwise like you say, there is a big mess attaching the custom
> vma ops and what not to the proper dma buf.
>
> I don't see anything obviously against this in mmap_region() - why did
> Chritian notice it doesn't really work?

To clarify I think this might work.

I just had the same "Is that legal?", "What about security?", etc.. 
questions you raised as well.

It seems like a source of trouble so I thought better ask somebody more 
familiar with that.

Christian.

>
> Jason

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9851B25AE8E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 17:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6E889E11;
	Wed,  2 Sep 2020 15:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F361A89E11;
 Wed,  2 Sep 2020 15:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jtgrsqa+rXytBmCRhA0WYlqdSQ90ozLUtzPtLrCJ8OrSrYAExbCYCs9WlFBT0xd/DZKjZsM0/+3JHAZ9iHVM+aVHg5U1nHXGSdZc+uRPoaeInf2x2cm9sWDmVD4WDlj5oJjCVdF964m6HqchBSgV7C/As/62PGaGM3wnY/hW9Cz2/+OwzIHqZYyB3JPzUotiCTLOa7IgY8/hOtsQ0cqehsilqyn+7Oh18rLCHrKp2qfyu60sjnX2B9LY5F9A23E0VI2t/zCtnF356jD4jGNx4DkDWplhcBZZogFhG08Fw5WwC8ee0wy88YNbYUPEBTfqe6W9I+XTljXE0D2hazXkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WytRVJDATW6K1/ySJyOAjs0YpbPht5N4plOJPYBohRI=;
 b=XLdpMtj8mexReDmjrgn0EeZ9ogmK1oAidreIJ/n1NkEYmIOK4GO+Ushag6Kpiz2tJqXzCjw6zyTwwhU9IpyZay3fH/w6TiTI775IhmScIcKILsnPwiytylsbjxLjyBZi5WvOvtNC0ovlMbv5ObhtFcV7f4ywszEqShI0JkdoyVyOAnyAIdGXQ82V1UlRGSHtBk3/IxNvlsXZx45AWLUCf0HoXKtHvsknGOcWZNdxWxQIRzOB5E8Wd1l6Xv7QApGTkYJ8EgifMVQN9l95BIpiBhGmHaL/mQbmlIrSZjwZ/85RTorqcVAaEhRGuItylEaA0I8X04sQBdOVRdRNzBpc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WytRVJDATW6K1/ySJyOAjs0YpbPht5N4plOJPYBohRI=;
 b=ijr3DDQV9nIbkyzGjg4WvxzP682IOW9vjxOIFP/AY+PPMKsqYIBGc1E4IwoCQHxqWrd38v/F7nR8dWsJAn+arhS1HpnNaeyI+oOb3KP3CHM6xk2w7uHJQzJWTdmquM/pGtRyzQxja6j5PPM9CR/L+EdZTcAoekgDIE+e+se+QPc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 15:16:25 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 15:16:25 +0000
Subject: Re: [PATCH 0/3] Use implicit kref infra
To: Daniel Stone <daniel@fooishbar.org>
References: <20200902010645.26943-1-luben.tuikov@amd.com>
 <BDD53312-3A34-4761-A7C3-6FDFE66A6C1F@amd.com>
 <e6916b3b-60cd-e223-4f87-478aab3b2468@amd.com>
 <62D0EAA9-E3AD-4FA7-AC24-9F5F9C594EB2@amd.com>
 <0f336bb9-5d78-30ed-d217-c5905d1dc08a@amd.com>
 <CAPj87rMRemGSZGoPV-BYrAZCK26aB-rFsKL6hVPRsha_850SXQ@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <20a86ddb-df88-225d-a33d-7feec82a46c2@amd.com>
Date: Wed, 2 Sep 2020 11:16:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <CAPj87rMRemGSZGoPV-BYrAZCK26aB-rFsKL6hVPRsha_850SXQ@mail.gmail.com>
Content-Language: en-CA
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 15:16:24 +0000
X-Originating-IP: [108.162.131.176]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 494c36a5-07d9-457c-9ec7-08d84f532871
X-MS-TrafficTypeDiagnostic: DM5PR12MB2469:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2469D48D500175D0EC5EF538992F0@DM5PR12MB2469.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q6bLXYIfIl0+2n5CtXz3CSAUOW1zNlKKF6Kmb7+iX8UMShsO9DDKifgG9pIfeNmQW9C0boe1+KdbltuNv5DQCPK+aYD87zHbvLmBntPPMKONA14Y2k1hNq8e9rhzG31uYfMxAxBNRxcx0NRpK5Sv726MnO5aEpjCW4P4qqPKK/OOIbZFJcwfAVF8zeLOR6RdX+9msHHnomJgvzTKJxCMEbxatmXzGmL2+RurWjznyLyyFVm/S4hpMPOr+i6qAVDXgw26AVeukVk3Bo5LjM/tHfYTnPwjTcGq7jAUAf/ElIkbEdZi1KU67oUfWhdaJN/Z4Iblb6bkBfVvcjUXS99rBTxsz+WD3eigPKmwL625ceh0a9SewJ+kvdo9Vcd4aPZS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(366004)(54906003)(316002)(8676002)(8936002)(6486002)(6916009)(53546011)(52116002)(66556008)(26005)(86362001)(16576012)(44832011)(4326008)(2906002)(2616005)(31686004)(31696002)(66476007)(5660300002)(55236004)(66946007)(36756003)(956004)(186003)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: I/xUlk4nJUp49YysiqffzxctPoyM9tC2AdS5TqmZI21W6sjZ8qPWQDiUWLqCuXPNWnuhx4/CuJoQGh5cJ4bUWTBMh2B0qPk72hT7eTqas1wMue7zvjn+BvOHObK/cPFLJYXFXN/InOv3KcahNZz/fFOs0cphj0ZKv/9lhmkNOLzfrQ2dhUZKKCAt0o8wbVwNNHC7a/9nNVfj/QnOHzYxqmTFdYdWzc8vvDQUGGAbJz1kjMI49YQJCsMCLFowwG2bUo5OEU/cf2RX8sr9DU67yVCHRisxzP3DbCHWCyDWmtN74ezCwz53XKSJy8WbBH/qcAA5QwXXuHiGO/6f+z1ZadVY4TJjotqjW5y5bQon4QFJ1WJPLbjHqC6xSDGf6dYAGmTbwntl8HT1OaM8+3juVH+RxrDV1WBwOHLTYi+aaN0eiABl4OBvQorKxuFzdTJ7J61iQe4LrQOaIWLJy2hKM3Tdo67DjyQ8IMQNROhSJOXtWuPOaSk7P5I6D7s8RcjC6gEpiDLTIerS+8FYGop7ErSWvrDxZG2cDk3+Fp9HEI8ZaKlEp5KbqYe8kWv/ZKbX3trZedhs+8sv1rnXuyx8YOQAqeLPX8lnZ95dpJ+EDvDhTYJX0kBf/6ArXBLik9/AqNLVaX92edf7T91Yx6SQYQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 494c36a5-07d9-457c-9ec7-08d84f532871
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 15:16:25.3629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RNTf1x7y/Cw3m9YiykIb3FllpyNhJTU7n8R9qJSotaGOLNWVrC1qMrR3JQGSsnya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2469
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-02 11:00, Daniel Stone wrote:
> Hi Luben,
> 
> On Wed, 2 Sep 2020 at 15:51, Luben Tuikov <luben.tuikov@amd.com> wrote:
>> Of course it's true--good morning!
>>
>> Let me stop you right there--just read the documentation I pointed
>> to you at.
>>
>> No!
>>
>> I'm sorry, that doesn't make sense.
>>
>> No, that's horrible.
>>
>> No, that's horrible.
>>
>> You need to understand how the kref infrastructure works in the kernel. I've said
>> it a million times: it's implicit.
>>
>> Or LESS. Less changes. Less is better. Basically revert and redo all this "managed resources".
> 
> There are many better ways to make your point. At the moment it's just
> getting lost in shouting.

Hi Daniel,

Not sure how I can do this when someone doesn't want to read up on
the kref infrastructure. Can you help?

When someone starts off with "My understanding of ..." (as in the OP) you know you're
in trouble and in for a rough times.

Such is the nature of world-wide open-to-everyone mailing lists where
anyone can put forth an argument, regardless of their level of understanding.
The more obfuscated an argument, the more uncertainty.

If one knows the kref infrastructure, it just clicks, no explanation
necessary.

Regards,
Luben

> 
> Cheers,
> Daniel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

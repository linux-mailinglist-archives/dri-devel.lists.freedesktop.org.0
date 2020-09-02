Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD425B438
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 21:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279E26E043;
	Wed,  2 Sep 2020 19:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C476E03E;
 Wed,  2 Sep 2020 19:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZnGWrFHWXh2eCv1S/VHl1+dA13i1YnSGyVMYjp/w5fIx/mgVsv8xauo/K5HjmZHxfB/ONSn3DIiY3Hz//SeIO91F2jUKNbVYZgH1kJHQzMJJG4arJW1lO3KFzGIBb6noP2z3lh84ZFigOSfYqLS2JVBk3sm3pgytqGtvQYSnrQgdYYNxdRKbKs9v9DeNOTwpwuFLW9FvN59qqNE8YRiQ1/lW5iAA3K6HkYf/vFC8u/t9L+oTugJ5A7PDS2FfIJJhoQJz4hcT+iuM2HMuVPkHC9TP97l36T9voJp7CoejvcvIDgt07OEpYhwelGSZclLGzr2b2L9eC4Mh+TWl+83tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lueJm1IMm04+xwaZ+dxNJ0eUe6wt2H4E/0iVxV0arY=;
 b=DchkYP946p8LZl15RrJGwCsio/thqIELxXgbQvbkLMZG0MF7V3r2J9+WcHTkrqGVm9t5wXorzwNbpEeH79BYn4+rAxKbwwZdGYhBDref5yDzt5sKoLOLO3Pr/3lF3dycHif3qPmmWfPL+ANaf7wl9f4eq7nKJ84fTxsWlwpCzFJxQ4bx5e2jYzerBrOA9Hs/JHv9MHe8PWxamLsq3bP5+nHSsaarx8IjYnL8AahVYSRaRtu7SiEHjD38kWYocXg6VaUODjPPtZMb4VmvmhbqDUwMOADxQWTALfmrEVjYtaJbFscKs4Fx33IyPTeBjv9n/sQ4Ru8HUWr+seru5ODYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lueJm1IMm04+xwaZ+dxNJ0eUe6wt2H4E/0iVxV0arY=;
 b=nGGn0VNJk2r+SYWDdXwJKuAeeNCD7LaCnOMb/C7vqk9/I4Rji0ARH3EkXhRwX4l2TVZmIsXly2v9TS+hD9vHOZOIlr66b0l14DWhZDJatzKgtvNAytM77XOBI62OQiQuGm32Eibq3y9MmH3zYqXn+yc8KP3DXBsXPLMVoBXgQqY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 19:04:07 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 19:04:07 +0000
Subject: Re: [PATCH 0/3] Use implicit kref infra
To: Daniel Stone <daniel@fooishbar.org>
References: <20200902010645.26943-1-luben.tuikov@amd.com>
 <BDD53312-3A34-4761-A7C3-6FDFE66A6C1F@amd.com>
 <e6916b3b-60cd-e223-4f87-478aab3b2468@amd.com>
 <62D0EAA9-E3AD-4FA7-AC24-9F5F9C594EB2@amd.com>
 <0f336bb9-5d78-30ed-d217-c5905d1dc08a@amd.com>
 <CAPj87rMRemGSZGoPV-BYrAZCK26aB-rFsKL6hVPRsha_850SXQ@mail.gmail.com>
 <20a86ddb-df88-225d-a33d-7feec82a46c2@amd.com>
 <CAPj87rMKNZfP1=kfsHPbRaJtHMAEKY+87p6uTAt=Hh76FwZVcw@mail.gmail.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <fc9b026c-e7d8-3cf6-92e8-7ef0c389e36c@amd.com>
Date: Wed, 2 Sep 2020 15:04:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.0
In-Reply-To: <CAPj87rMKNZfP1=kfsHPbRaJtHMAEKY+87p6uTAt=Hh76FwZVcw@mail.gmail.com>
Content-Language: en-CA
X-ClientProxiedBy: YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::7) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0128.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.20 via Frontend Transport; Wed, 2 Sep 2020 19:04:06 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dc96b467-b2fa-4690-16cc-08d84f72f749
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB42185A213255168612A9AD58992F0@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BTejNnIEjE8C4pD0pMmZFLG6vpY6YYN1FUtiOMroy259axF6DXQnHpG6Cq8MRpHDXvy4hvO6jhl999Rn+Yk3cOUA5Bz6E6nPQIycJkKdq2/ffQ0LDYUoEKiZpt5DCiNm5UoyUpqIisn/P4YPbdTI1BNCjpZkM8CQAHXoBXJwXYbVipmcWx6K2wMmge68hMo/q+ynDXEt22ncIV2+11NNf5va/LCBVLQOMxuAqZJJU7966f4hys1NQbaew/YUSNIbSSyHbPbekGLyhwRa26YYzyEn1c4pwxRhGQ2IK/LCgHEC0KfsgpSSBvhmX8/PDNcS9NYg8i3vaoVefb6K4bJQuzWCjVMnZunAgfGARas8dQMTipW3DuLOGSWaSOP0xJma
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(8676002)(31696002)(2906002)(478600001)(31686004)(53546011)(66556008)(66476007)(186003)(44832011)(4326008)(316002)(66946007)(2616005)(6486002)(956004)(6916009)(26005)(52116002)(5660300002)(54906003)(86362001)(8936002)(36756003)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FuMdYTdGdwN80tSLhHF5ozzmwowvEM5gX8RKmPRtU2mQ4zEcYWbTTjdkrMf5AWPFbAPFPL+Q1Dwe1x5vr9eEBOOGwT4Tzr9eIB8QTVokwDp0BnVq0NUcTn82jWvVa6/ei6+/cETpbRZ/83m8xjEA2/BOc6LZP8wCo4IdjgoLfOOvViGXrikP38bZaM6r0q/ZssHE5wF9eFB6sDCg8I42s5XVsnCXiocgHmWOlNghbfI5z8BPJl1F/2wJR3V9KzG5YS+EPer01CSwiNdUweIp+1IznA9Ua4IFkqoluQf9hj00iBcHdOIFLlVj2UFYahv/w7IMq14TmFldRcSrp4f/lZwZXgPCuGIQEfYVm56WuKufv5YLe2Wi+mN5e7jKZb5Jg+GmMyJMbpNQLfTzI5oL0WUvOeSag/gnBxny2GHpOIcX/hLOrwK0mfm9WIA1geS8oUtsPxgJ9ZkNlK5uE6FpMKvPdR6dYBTx6f5/uKyLXN3HpUo/zdLHl17rcIvLlMlp1iwOCQ00hB5TYxXdlvoKhgGbDzZ/eZDytEeAuYRPh8vgiuSjUX8RUFuWLDn9XAls0zQy5UHQFc5wyrfqw2mJO3owU16C2b61UpTDFQRRGvtUiLSONG8tzEkbJxRNGX4/M+dF3rzizVEK7yByRb+E8g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc96b467-b2fa-4690-16cc-08d84f72f749
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 19:04:07.0781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3LtYCIzWBQ7+Td94Es7e4aWyRcQ6WvCJaOAOty96qmuTqw8h2qagqzl20DEQRjv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
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

On 2020-09-02 11:51 a.m., Daniel Stone wrote:
> Hi Luben,
> 
> On Wed, 2 Sep 2020 at 16:16, Luben Tuikov <luben.tuikov@amd.com> wrote:
>> Not sure how I can do this when someone doesn't want to read up on
>> the kref infrastructure. Can you help?
>>
>> When someone starts off with "My understanding of ..." (as in the OP) you know you're
>> in trouble and in for a rough times.
>>
>> Such is the nature of world-wide open-to-everyone mailing lists where
>> anyone can put forth an argument, regardless of their level of understanding.
>> The more obfuscated an argument, the more uncertainty.
>>
>> If one knows the kref infrastructure, it just clicks, no explanation
>> necessary.
> 
> Evidently there are more points of view than yours. Evidently your
> method of persuasion is also not working, because this thread is now
> getting quite long and not converging on your point of view (which you
> are holding to be absolutely objectively correct).
> 
> I think you need to re-evaluate the way in which you speak to people,
> considering that it costs nothing to be polite and considerate, and
> also takes effort to be rude and dismissive.

Not sure how to help this:

> My understanding of the drm core code is like something below.
> struct B { 
> 	strcut A 
> }
> we initialize A firstly and initialize B in the end. But destroy B firstly and destory A in the end.

Regards,
Luben
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

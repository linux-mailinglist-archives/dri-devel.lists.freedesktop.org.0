Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC5E228126
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8098926F;
	Tue, 21 Jul 2020 13:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D874789235;
 Tue, 21 Jul 2020 13:39:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IlIkYVXmVuFunV3t9En0g7IHeAJxAp5bEwD4PKSsrvo/zOelr18t4VLS+7X4Hg7929n/ejX771fHtoK/wKYxAa/DcD5MKJC0sDTEUXiLPOX8UpZ9GlhrIBJ0LBVZVyO2ONRUlt4deRHIp5loi9NRM4TVbAZecreCqpnYsvx6ifdQNQ6kQa5uXdaGAkkOpeuEoPB47DUV+tRNCKN9oAqZWF4D4mp9vMnrPdFXiyDG93KCRGSzNJrjTz3KOGwkCafgJy030OkTG0mhUcmUkxbrliG9eBst1MEdv/1HuPteTAT37xyj0MdxksS3XCNQzC3agg/wRNDFle3kpjOz4zBu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sInsOcPh2KO0GdgKp5s8bNTAMWDJ7yXWNqPU/4FdSQQ=;
 b=XtLI8AX73/9APotvH4wcK7oDqbfMSdgzz4NWMGNbgfQZyVH/nyrVblIg2097xvyJ+cV0r1/3UTVCToVo18wfeDskTMK72m5mR30nD2kHkTccrlOKH7ayny4JSIbKLyrySFJkibccTDrDyS/aSA837GV3gCC0zA1MaPdayD7F/aC5usvek/OH+LPMyLWahW3e4Z6CdaKNfh7lbKrQsA3rnElnlFIa1xT/KcqpG6Te/4duIozQhzKxFtTDVz2tV+reFep4dJovZWJt4Suqhkgg9r9JeDYmx3FrUMGoFaaSX7wgOUT/VlVHQrABKEMkAq7Zh/poUblS4CI+VPHvqedEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sInsOcPh2KO0GdgKp5s8bNTAMWDJ7yXWNqPU/4FdSQQ=;
 b=32IurDhQ/3fRQvtp/YdwEGAo/sd5MzMjkFH0+URwhw+wFew2mc0cRFYY2uH+oiOTlTbBRi2/2iQ90OU//FDBVnLTUdQVrXofBxnWdyqCzjYp+OgruDAG5LnwYQTQBpYiG3RdRs/3YrvnQ2WopTJ/3HXWC6NxYPZtb81LhqLvhYs=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB3077.namprd12.prod.outlook.com (2603:10b6:a03:db::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Tue, 21 Jul
 2020 13:39:46 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::bc19:eb90:1151:fc7a]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::bc19:eb90:1151:fc7a%3]) with mapi id 15.20.3216.020; Tue, 21 Jul 2020
 13:39:46 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
 <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
 <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
 <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
 <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
 <dbb2e7f0-85b7-f9e0-7875-144a8cca4993@amd.com>
 <2cef1ca3-115c-44ee-9caf-6cb8d6404796@amd.com>
 <e38c494a544d7e0607ee89abcc6a85419e700011.camel@pengutronix.de>
 <d4368e17-cbdf-d67b-7386-03b6eec7ba17@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <de43fd14-47a5-3089-0cce-4b39a0ae47f6@amd.com>
Date: Tue, 21 Jul 2020 15:39:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <d4368e17-cbdf-d67b-7386-03b6eec7ba17@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:208:be::26) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:208:be::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Tue, 21 Jul 2020 13:39:44 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d6930438-41e3-44af-d072-08d82d7b883a
X-MS-TrafficTypeDiagnostic: BYAPR12MB3077:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB30771CBFA20ABCF16618F79D83780@BYAPR12MB3077.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0LC7w0j23EQdPp5xufjWoPDnvzRm7LNP/q2fwGvEJoZOXhSd4ei6vj07CK3X6U/b+zjCHoPdLPI96eoYHfa4HxRAkAs1y6BfVEGM5RXagH2Prgrg/aWEB89O/PYn97E2XituVGTZVmlR9WDGNxIb/+Nzr3sscRlyDEL0vnYEUXTpgtXUUrYx0NuWekCLKu8ogBImzrPCyBREkDhm/gE/MeJL8iduWk10ECjuyHe+pu6d3mutBM34tPQOLgAp+vY0rOV3hhvxHjmEeElFDlErtE0XvG/vG50BbpmtI6eZqFgw9eo5c3aIl3JZJ1alhJ3Z3hD8QFPiSNpBi5q61AdCJ6zkJQ9687RTRob96jVvQrV7keED4gHyNqefyT9JzPt7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(86362001)(6666004)(2906002)(31696002)(53546011)(31686004)(66476007)(66556008)(6486002)(66946007)(16526019)(186003)(2616005)(52116002)(54906003)(110136005)(83380400001)(4326008)(8676002)(36756003)(478600001)(8936002)(316002)(4744005)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yt9fKAI+efAJcy89QYFHgT9nzb9c1Y06xmKavi91VWDPQhBIDNro7F8fsJ4ddJ/dGDj51hjnp/P6I1Y3H/Vm/bShKGzkjXRffsTh+g/9lPsqS/1CQ98MOm1K4U/fX2FG09zZfmVl8ggfvRZd6n+EPdn8iQP8dNnwh6IbFEGr/OevmBVRivYd360p53yJeQPuk7XLMcDWQydseVEET5xYRdC+iL5c1CMoAimmXIhG980YKXFvW2gda/Yz1wAtZ9dOTDdgP9q57RI9CaIRJsZfNBeQ3xTBvjZMrSe5dqJiAtsPqGvB06bMUVIav4A9yDD8S0vNKda9QmfpKr1wjzw9wfP6uphzhDKq/aZoYk/11XbIP9FZsXvNjwaRSTu9HnFQzC3sXSbvZiglDWEpWNHMoMW0T3/eLI+spMOm2G+UYRNAg+VI/KSGZ/1F0recHD1LrfgoZbyIPo4dRpY9K9NxMthG/VUfdS2+bG2d8066UMsRDe/xNBGGCUkRmEXvanILfzgR469WzknSpp5qVTCAozaOEByL45hHUoZWj8zBaPo9AQo03rUrAcPP3AbGImeY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6930438-41e3-44af-d072-08d82d7b883a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 13:39:46.5166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVksi2yxWlirFr3erMFlORq/MapauSt3Rsxw6nINq6o1n4Mi7P4mcJzmNIpnJw92
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3077
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
Cc: Emily Deng <Emily.Deng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Luben had a good idea how to tackle the whole job handling.

Andrey/Lucas can you work with Luben to get this cleaned up because 
there are a lot of requirements on this which not only come from AMD.

Thanks,
Christian.

Am 21.07.20 um 15:36 schrieb Andrey Grodzovsky:
> Lucas, Luben picked the work on this a few month ago as I was diverted 
> to a different project.
>
> Luben, can you update Lucas please ?
>
> Andrey
>
> On 7/21/20 7:03 AM, Lucas Stach wrote:
>> It seems we all dropped the ball on this one. I believe this is still
>> an open issue. Has there been any progress from your side on fixing
>> this?
>>
>> Regards,
>> Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

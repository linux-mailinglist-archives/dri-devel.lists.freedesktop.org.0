Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E5622810C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4846E2BD;
	Tue, 21 Jul 2020 13:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662846E243;
 Tue, 21 Jul 2020 13:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCp643lT7LC8YTqGBFRsraAsgUtGjjQs+IKGTm5t/dXbEz/AzRq8mpgKnFtOoSV6/nUGpgzC6h/6B2rCQ/Xhv+8PzKvwwqU46MdTthkjO5QvrA3fBntu0uR4xDxZrSeL7RdLOoEneEu58d6dmVIgSVeWyGpY05fFyekfWmop3vPa08p9qfPzlxR+GfYFmaiW07TjYQ/l3oTcdPzEADwba1WneU+7QPVsKJe5GVmpFIynW1FXLVqMzSQvSsFfxzApxRZ4yJ2ogMpjASDYas84WSh/3wxPPDdpYMuQGuy1ZPgOAYj/ZEtbNNR4J4IFmXICUwW70iQRLWZ63NCBmF1HGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuW3btc3T2QGd8NUT5z0cvVvtBDJhFU4+TJzSt6CA0I=;
 b=F2WL6OPmGBKnJR3C2oFo1VTkUI4WNInMj7+hlY9th36NOkVldvpXmp4HuceYEbUtwQXUbT3JJpedALqqBf+I0S0OWyU0MPdNlu4WW1b9SRH9UCwHlI0ZzXDyUgblPfJvg68bEr4XgwHVKTNcwmkD1bRNqgZW5ffTQpbs5r1STEZcf4iXXRoTigECNcYJwh11eYOynvZCAiCC4Lx44bPUL79B4B2rGrMyusGqp4JjttcE09fMjjoY9Q7HnLQyhG/QrqzQl/NzMLpIBjytWm3gx/5z7TdLj2YNIMcGkPj7PUxHd6o7GyUMS443QwpsLlHXb6VEX1rYsL9myHTC0uRjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuW3btc3T2QGd8NUT5z0cvVvtBDJhFU4+TJzSt6CA0I=;
 b=z7fyi1Ihb5BCDie2uZ7zdc2iGFxl/P7DkaDFvlsJza4LI7vqjz93dbivl2jp9HO5lJlwVrlp0E76phJm6c21lZX/RAL4c5nYJnEjWBj+G7gD/Xx6KcmFAcxPqG29UeOwDdlGqTgMiNmd9P0ErffrcX4fOn4RQcJGK3+gghbf7P4=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB2485.namprd12.prod.outlook.com (2603:10b6:4:bb::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20; Tue, 21 Jul 2020 13:36:38 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%4]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 13:36:37 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: Lucas Stach <l.stach@pengutronix.de>, Luben Tuikov
 <luben.tuikov@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexdeucher@gmail.com>
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
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <d4368e17-cbdf-d67b-7386-03b6eec7ba17@amd.com>
Date: Tue, 21 Jul 2020 09:36:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <e38c494a544d7e0607ee89abcc6a85419e700011.camel@pengutronix.de>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22)
 To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:a414:dede:29b1:5f68]
 (2607:fea8:3edf:49b0:a414:dede:29b1:5f68) by
 YT1PR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20 via Frontend Transport; Tue, 21 Jul 2020 13:36:37 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:a414:dede:29b1:5f68]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ddbcdff9-c9aa-42ef-e102-08d82d7b17cc
X-MS-TrafficTypeDiagnostic: DM5PR12MB2485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2485995F952A325F8E605E46EA780@DM5PR12MB2485.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PLP67Bx1Bl1t1415TGwAWO283BW4487V8PVm3Z7c8ZvH5fUCZZ/oaCQGqbQyvxgc80hkMeSWPxqQlULNfcvhY7ybfw/rHrnbar65g39sP0j7Ss/YV3qi7Se1DBrLuxk6bT+hw0fKR12eWOzJ2BM57d3JBR2jO0FhphO6zIYjw/7ndOcEikbyzb06EVTnKR6f4BZuVBEqFezYzKXAmJWlC4hf4PqQutv0Whe3BaMvfNB5uS0+7X3VPsm1ChMh7BwU7BDOd/DSKVdDhNINIGysSmO/6fTLC4QiL9l1u9qbgS3qNHD0wl8WfzW7KGQeM97eqxf4IpPrUes4qXYiBGxPFp2QMK+EiNutV+Zkv4wSrgio51Jl23nfOx7VWKf+qJn1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(8676002)(66556008)(110136005)(66946007)(66476007)(316002)(31686004)(2906002)(54906003)(6486002)(4744005)(16526019)(186003)(31696002)(36756003)(2616005)(83380400001)(52116002)(478600001)(5660300002)(4326008)(86362001)(53546011)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1sxUuZDpq6sEnLXUW/jcbftxWpMejlWxOfC7fIHcAwISHH0/05SHufrgqBl3zlWNUwzRuyiYNE0X1EU3IeWpvmBnDW74uNxUdx1jswzKt2S8SBgb3nFYfRYcLHF55EPWhICeG7wSI3e4BO2nvKm/trpnLuulHSsd/OVG+uULmV7RaR1Todloy23Gn8WIYiyTPdShhgexrhBT+p2f5h5DMNtKjBttO2swlcl3o6G0MdkYOMkJvY2SWUcz61MUbq29wqkjBJbNnzT93EHcJ2pjQ8/VyBMmkMnQMlrgDkpNk5eSpMGXv9k+roHjUR8ZozmMrCYV2+LWtZ/rv+jKexh536poL1drdQxEnNxz7uGA1OHtlLTALl6uUcM2o8UjVtzXA6l2xAMraTr3TYjMGQKNRp2n4zNZ6+5eJ7xYKmpCjSbL/W7H479fM2mdiyzySdFHzKV+S0XNN2HnBujX4UlASSmwIpuX/9lVnktAgmLK/6vTAm765NnFqP/rV+lnHTUcx7qC+Of2k/MoCEwRviydB6jD9QddoX94YE2te7OxDGIDLzf4ueqE5pDPQIjejmNW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbcdff9-c9aa-42ef-e102-08d82d7b17cc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 13:36:37.8133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+X2aMBIp6vfcpclnHukVh8IbgV+w4OeOIhuxS7OBlaHcq4sA+27anh0eHPlMm2b9fCDIfEsPcqCjyG3hLRkEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2485
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

Lucas, Luben picked the work on this a few month ago as I was diverted to a 
different project.

Luben, can you update Lucas please ?

Andrey

On 7/21/20 7:03 AM, Lucas Stach wrote:
> It seems we all dropped the ball on this one. I believe this is still
> an open issue. Has there been any progress from your side on fixing
> this?
>
> Regards,
> Lucas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

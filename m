Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF39856038B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 16:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F6710E8A4;
	Wed, 29 Jun 2022 14:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70077.outbound.protection.outlook.com [40.107.7.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E736810E806
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 14:46:50 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iWb8REIQUZ9nFGQ7raI458Wfzu0tJduMQIVPJzg+Zc31CtGd/epuX0kbG4KhaexVzNtvSloKeL9kSpyexbzEJWojgArniqnPM82t/jhzNIMiMOnGZ6UJSsDyW6XMpabwoFn/FwfPTzvOtEEc6qw3qHQnXvrhK6LWfV6QarLCPjbzO0LJOWPUXiSkOqHs1UsHed3Fvk8TAwWzeEgFT9YvbJzH+g8QRjG33zOCyZN0jSfRRLW3kcjNpPQfZweRGmr+6jqROYmPkAW/RoFA7opD6V/C/Gu7SxOxMiQF1yrJmQAkmLwxDx3aqL5pQrR0JQ8NFZ1kul/FFdqbBiQbTI3EnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCNuTTwxH7u6QhRhAgEPpQd5RBZOzHHHVqxF+negakM=;
 b=PRA0S5nSK5ZEfzdSl47Q3CDqZ1saqbBSeufbHrDANpbarb96l63dTvW6R2VFEsuaf0ChUuVwiWV3mVK+yOnmbJlVEDf+soroSNNqNHDod1eQ+a8mon1+ZB7cC0xUvxuHHwmCSfuz73l0r89l3WWqoUW9b3GeXuf1ve19+CNZwtvmsfSWhQdMnBtXfg7jAC6FLXrvlC5uTYBeFNDhchja9HFWj+3E6ZZA/pbB1aYFcMsHU4L7bEhb7C6/jKmbBJsuDf8YXRSUmCYiQXezaLlXEwaieWd4Wmo2fOSNQlzJcxLVDWIu9WwzfjMhWEikPyc/LphTLPJkySM+PKpJECejow==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCNuTTwxH7u6QhRhAgEPpQd5RBZOzHHHVqxF+negakM=;
 b=xYewEEiHe2E6YwXugFNNcwHHWTt52J7WaEPXGAhThpArUsmNfFFfbhJkT4FKsgpnUKFWZRRgYV43sxSdTLNmOhgyYBUqOIwE+afxDaY/8BJRl28j8tjIY2Mj1SA8YFFL37lDvRhiCUrvtqmK2HMgd14aQ+gkCcX9liDdz2Vx8QE=
Received: from DU2PR04CA0264.eurprd04.prod.outlook.com (2603:10a6:10:28e::29)
 by VI1PR08MB3358.eurprd08.prod.outlook.com (2603:10a6:803:47::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Wed, 29 Jun
 2022 14:46:44 +0000
Received: from DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::3a) by DU2PR04CA0264.outlook.office365.com
 (2603:10a6:10:28e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Wed, 29 Jun 2022 14:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT045.mail.protection.outlook.com (100.127.142.142) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 14:46:44 +0000
Received: ("Tessian outbound 9336577968ca:v121");
 Wed, 29 Jun 2022 14:46:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54b399280bc09e21
X-CR-MTA-TID: 64aa7808
Received: from 7b42733dac57.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB638F8F-FE66-4A8C-90AE-B171B8B02429.1; 
 Wed, 29 Jun 2022 14:46:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b42733dac57.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Jun 2022 14:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReodyvBD2fjlP1lMYHt84wyUzficGq/wKvMfEMXInZXdfM7ki21+tum+akQUHCstONSV4eAGVuH8IfoWiLg08SRECtUwrq5wKgVw+dNtbzqUAOPo+Tw8bdsXRhoxpBi+j6R3F0r/qpfXYSlNuCSI0lTG9kn7Itf57IvldHFVkmXE1Jb6YPmsBJrQBg6R4Mu+7rYMVeUtgk/LS1gLsSqg5zw1H1C0p1rrMhYuWwNGrJlVBM1DPWVg5STnaUEaaCAgy6s/8h9dhVPTOohA/GNF+ET64G4Q5gtyhNelXoZC9Q8zcx45VLX8W2ZngEaVxBQuA0VOz8GFWOeQYk8fsaLK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCNuTTwxH7u6QhRhAgEPpQd5RBZOzHHHVqxF+negakM=;
 b=oJZzii4Yel1CdWvXRnYfokD5WIwjh/SaEp0q3V0+wXIkzfZHmQ0OaLJLAG5QJYN04k/DNRX21KUFyQYY6xXK+FGyZRwO02WmjHfeSVnJJNFWZ4lLMot/Mst/lRyb0Ko2+lZAYvPlim3B6e1a5vfOK3EVpHFz+Teh2VyQ585YlP+kypvXObgjgejdqaUbM/HjqhnVE5/6vfZq61vA4asOqc8LgD/SEkGf22qXGxl0FBIteaBFIK3WaLVTWjdJ+qgK9bJDqpekiejvifu85/Uxezz0l8PKj1v5MLhUB5I7WZNIchz5z80wNHNoPBHhI27xC7L6FkltTDRhwLw9Kw3m3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCNuTTwxH7u6QhRhAgEPpQd5RBZOzHHHVqxF+negakM=;
 b=xYewEEiHe2E6YwXugFNNcwHHWTt52J7WaEPXGAhThpArUsmNfFFfbhJkT4FKsgpnUKFWZRRgYV43sxSdTLNmOhgyYBUqOIwE+afxDaY/8BJRl28j8tjIY2Mj1SA8YFFL37lDvRhiCUrvtqmK2HMgd14aQ+gkCcX9liDdz2Vx8QE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB8111.eurprd08.prod.outlook.com (2603:10a6:20b:54d::22)
 by VI1PR08MB3711.eurprd08.prod.outlook.com (2603:10a6:803:bc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Wed, 29 Jun
 2022 14:46:22 +0000
Received: from AS8PR08MB8111.eurprd08.prod.outlook.com
 ([fe80::8bc:5425:ded2:3a38]) by AS8PR08MB8111.eurprd08.prod.outlook.com
 ([fe80::8bc:5425:ded2:3a38%4]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 14:46:22 +0000
Message-ID: <05513f59-0bd9-77cd-36d4-41027bc339be@arm.com>
Date: Wed, 29 Jun 2022 15:46:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/1] [RFC] drm/fourcc: Add new unsigned
 R16_UINT/RG1616_UINT formats
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <AS8PR08MB81117652E417826E741154B8F8B99@AS8PR08MB8111.eurprd08.prod.outlook.com>
 <20220627175026.6a5dd239@eldfell>
From: Dennis Tsiang <dennis.tsiang@arm.com>
In-Reply-To: <20220627175026.6a5dd239@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0386.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::13) To AS8PR08MB8111.eurprd08.prod.outlook.com
 (2603:10a6:20b:54d::22)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 9a23d0ab-22d9-41ee-7462-08da59de2fde
X-MS-TrafficTypeDiagnostic: VI1PR08MB3711:EE_|DBAEUR03FT045:EE_|VI1PR08MB3358:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: URFyHkDK2yR3bwJnRbZuhgkTUz6ULDYDfBbPvp7HVBP37lndakl3NDIKZZv2gjt2Fx8Wu7XnTtUdEUHAabsgEXLKRDQmzQ/pEwKSSIso1Xh421bgv8fN+D/+tF+AMs+r8DQyT5vxPH9KKP5IqoLejRJLsoXDayG5t7LL6zgkrQnSKSF4NpsflvoPVoBn8wdAgO0CnMG4274nw9O8FO7bhVw9uEqPtsv4m6rGCgwOSZ+5bXQQeU+cas31tqBhQg/LYVfhO6llwYLbOy5i1fSSQlGY3O85GmAYvqBzXJBvETRtnNpsnsv2uQJ1UJyFnf7JKKeDjpeQoFMxKJUYxOfLxO/eN6VfZ+rstH6aPOhSNpQdYH5Zzwdq30Nk40ie4EuDTdhnkOgjbWGs3xGsFv1rhd17KUGcA3ktuChT5WTkI9DVBFSPIYHvuzS76mSpujXWtOSrYP2ZlTNpZ7E9beRcls3AiQegWABpG+PbnvDBoEGkTc0ntSTrRlKGechce09BJApWSW10BdYti7doA0NK6Pgfpb+GOXGVUTS/LdgasDTb/f4q2K+yFlOgHUcPtpKNLby0ZZ3DJpuSeWMLrF4a2YRVUr9jgDWfBe4P/qQmks0RhcKBMDZWw+rUnmv4WRuOqQ3W+ZeDtWmfjBlx3M13JYuPWmx1k2Q9i85Eo4VeZ3tGPfOnesrMSq3cRN1wLUc3nztHSTxzi+YgP5HWxbFKYAVnKNUHGGbS8MFdbWK6igPV6TdzEHuzQUzXesZul6ElSFuKFO7sQU/K5urZqABLW/DJBfccgizX7PBvr2HIZwc+YttCNpUTrIQuWf4EiV1plB9cK8n2HvOtMEgHeVJokw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB8111.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(8676002)(316002)(41300700001)(31696002)(478600001)(66556008)(2616005)(86362001)(36756003)(6916009)(6486002)(2906002)(6506007)(53546011)(66476007)(44832011)(31686004)(7416002)(83380400001)(54906003)(6512007)(5660300002)(4326008)(26005)(38100700002)(186003)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3711
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 72356d92-de01-4898-937e-08da59de225b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +pp0GOA9gaq9FxHZOe51OY6hf0BBDNbbIn2zDFLAUui5aBlWe4ZeHtH+avL8fMLxQH5SzKBmy1GheYCbVfl5wL2DGG4dtPnS87zzOjmna91W+uUhGTg96McBrdknnxkCFhpOh0IMdS1wHMSG5KTorxJy6G1nI+tGBBal0dBoclta39pkKF2Y2/lZTdoEhwRTpxKnSLlIGAaSoL+YnvShGFPf90kry4ToRN2noEI+QM+sp2hL5yK7+RxCl08jyp76uMrdBql+iL+SQ1MXSpuejrcP5/E+Xw7Gkx/IxZNkrak5iejF41KsgFXH71ThxCw4pyYpZgSNg32lgQ/u283oVjwlP7Nv9gTB27J8LYsAFRc+NpvY8cZfdKdezPKGjPhPEDs9Ah5r9m0ShPLqmlwFY9KvuReGStSWeBXCcB1aOo9HigA43r5AmUdGqHECpbfteVPzGEZeIWWUdlR7rwPHpIsPQ49gd5E9wNur7gfXUtHNeZgyuVn95dLdNgzS41MBbpCZDbMmZaBg1Y/P9PQkEpn86ky8KR/WRPJACm5F4gF9r9R0AIY31wasEF6s+gzoXN0+u1arwE8+tXhjv58qipzUmProO9tmRBT4EAJMuxmm8DhGhYGOik2oROfOSY1lgcnzHpBtPoRgBBA09BumCh/zXXx7Y5A9PoQ2y4jExdIrl6vvNTXoYArXiZxy0vGOXUH8b0OnBOTPVNjVQpyzi9ZvpI7GhtIu6FEo5+45xnSOSjXneIa2iERfbKicCqbm/YzzTgF9cdTnCtZQgG6C1Kvx88EQ7FS6FrGYHLWxnBRYy9JgJTqCd7zcgOyBi5hcWmVDniWukl4f8ezG7KBq+w==
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966006)(40470700004)(36840700001)(478600001)(5660300002)(70586007)(83380400001)(70206006)(31696002)(4326008)(41300700001)(26005)(6506007)(186003)(40480700001)(54906003)(8676002)(316002)(6512007)(356005)(81166007)(82740400003)(82310400005)(2616005)(8936002)(2906002)(6862004)(53546011)(31686004)(336012)(47076005)(36860700001)(86362001)(6486002)(36756003)(44832011)(40460700003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 14:46:44.7066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a23d0ab-22d9-41ee-7462-08da59de2fde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3358
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
Cc: Normunds Rieksts <Normunds.Rieksts@arm.com>, airlied@linux.ie,
 tzimmermann@suse.de, Liviu Dudau <Liviu.Dudau@arm.com>,
 linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 david.harvey-macaulay@arm.com, Lisa Wu <lisa.wu@arm.com>, nd <nd@arm.com>,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2022 15:50, Pekka Paalanen wrote:
> On Mon, 27 Jun 2022 13:40:04 +0000
> Dennis Tsiang <Dennis.Tsiang@arm.com> wrote:
>
>> This patch is an early RFC to discuss the viable options and
>> alternatives for inclusion of unsigned integer formats for the DRM API.
>>
>> This patch adds a new single component 16-bit and a two component 32-bit
>> DRM fourcc=E2=80=99s that represent unsigned integer formats. The use ca=
se for
>> needing UINT formats, in our case, would be to support using raw buffers
>> for camera ISPs.
>>
>> For images imported with DRM fourcc + modifier combination, the GPU
>> driver needs a way to determine the datatype of the format which
>> currently the DRM API does not provide explicitly with a notable
>> exception of the floating-point fourccs such as DRM_FORMAT_XRGB16161616F
>> as an example. As the DRM fourccs do not currently define the
>> interpretation of the data, should the information be made explicit in
>> the DRM API similarly to how it is already done in Vulkan?
>>
>> The reason for introducing datatype to the DRM fourcc's is that the
>> alternative, for any API (e.g., EGL) that lacks the format datatype
>> information for fourcc/modifier combination for dma_buf interop would be
>> to introduce explicit additional metadata/attributes that encode this
>> information which then would be passed to the GPU driver but the
>> drawback of this is that it would require extending multiple graphics
>> APIs to support every single platform.
>>
>> By having the DRM API expose the datatype information for formats saves
>> a lot of integration/verification work for all of the different graphics
>> APIs and platforms as this information could be determined by the DRM
>> triple alone for dma_buf interop.
>>
>> It would be good to gather some opinions on what others think about
>> introducing datatypes to the DRM API.
>
> Hi,
>
> I didn't quite grasp where this information is necessary, and when it
> is necessary, is it that simple to communicate? Does it even belong
> with the pixel format at all?
>
> Let us consider the existing problems.
>
> All traditional integer formats in drm_fourcc.h right now are unsigned.
> They get interpreted as being in the range [0.0, 1.0] for color
> operations, which means converting to another bit depth works
> implicitly. That's where the simplicity ends. We assume to have full
> quantization range unless otherwise noted in some auxiliary data, like
> KMS properties (I forget if there even was a property to say DRM
> framebuffer uses limited quantization range). We assume all pixel data
> is non-linearly encoded. There is no color space information. YUV-RGB
> conversion matrix coefficients are handled by a KMS property IIRC.
>
> Coming back to the nominal range [0.0, 1.0]. That's an implicit
> assumption that allows us to apply things like LUTs. It already
> breaks down if you choose a floating-point format instead of unsigned
> integer format. Is FP pixel value 1.0 the same as nominal 1.0? Or is
> the FP pixel value 255.0 the same as nominal 1.0? KMS has no way to
> know or control that AFAIK.
>
> If you had UINT format, meaning the nominal value range is [0.0, 65535.0]
> (e.g. for 16 bpc) instead of [0.0, 1.0], then how does that work with a
> LUT element in the color pipeline? How would it be both meaningful and
> different to existing 16 bpc integer format?
>
> What's the actual difference between R16 and R16_UINT, what difference
> does it make to a GPU driver?
>
> Maybe that is intimately dependent on the API where the pixel formats
> are used?
>
> Maybe for KMS R16 and R16_UINT would be completely equivalent, but not
> for some other API?
>
> We also need to be very careful to not load pixel format with meaning
> that does not belong there. Non-linear encoding (transfer function) is
> obviously something that is completely unrelated to the pixel format,
> as long as the pixel format defines a conversion to nominal value
> range. Color space (primaries and white point) are another thing that
> has nothing to do with pixel format, and so must not be in any way
> implied by pixel format.
>
> Should a pixel format define how the raw pixel values are converted to
> nominal values?
>
> No, because we have quantization range as a separate property,
> currently with "full" and "limited" understood, where "limited" means
> different things depending on the color model.
>
> Color model is defined by the pixel formats: we have RGB and YUV
> formats, likewise is chroma sub-sampling.
>
> Hmm.
>
>
> Thanks,
> pq

Hi Pekka,

Thanks for your comments. This is not intended to be used for KMS, where
indeed there would be no difference. This proposal is for other Graphics
APIs such as Vulkan, which requires the application to be explicit
upfront about how they will interpret the data, whether that be UNORM,
UINT .etc. We want to be able to import dma_bufs which create a VkImage
with a "_UINT" VkFormat. However there is currently no explicit mapping
between the DRM fourccs + modifiers combos to "_UINT" VkFormats. One
solution is to encode that into the fourccs, which is what this RFC is
proposing.

Thanks,
Dennis
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

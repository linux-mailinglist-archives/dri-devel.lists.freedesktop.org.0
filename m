Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4385843B600
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 17:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E3B6E3F7;
	Tue, 26 Oct 2021 15:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E046E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 15:48:07 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QEe6vi015637; 
 Tue, 26 Oct 2021 15:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=0YinjZUbyBDiqLPnu2i4TwedJkpDwz59JxPSFxL7xN0=;
 b=gHYUrfAJcSvd3NtjxfIrn6UmHeISxVEXvI5zakcykvGCLIvqAJAc3CDM6OkTbsYwROK1
 BlDCwBJZRHuctcMWUTHXG0zu2R9xtg5Ca7humuWT9aJH1fCGmT/Equ8xlJiqB0zmypL1
 iFUepCNjOqVaCCI71LsFNtleMqgJCbRiJ5OQzyZbsWGcOigjCeE5sdeH2EA+P2NG7bEn
 TjMTLX8m3sTOSAdOK2VuZL5kdTCtifpZ/GSsJq7tGrenwOHScHKtRx9SMU86NNfLYNHT
 4GFALgZ2eut178x1RY5ownPCkF/BvW/afulhjpj4D3GiCTfap9cB5Z80VcaiWE/sp66o +g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fjd7mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 15:48:03 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19QFZltK068122;
 Tue, 26 Oct 2021 15:48:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3020.oracle.com with ESMTP id 3bx4gb6sq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 15:48:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4PzEnSpRMV+Ic1ugBJWgxKs7DzoecnOR2dUaBPJWrcZxSHbTgQ/Yq9PHeUy84uojcjyFaM33LcL743JkLa4PAYcw25/dYAfGBaLpu7Cq3n5TrOGJ7cppC/VzT25CRQj2WjDn73ivXLbrpLKa9s+pQckvDqVfk8GRzOUn4xcB8M5fY0n2J2OToK1XTcWDtseFaKQOpsUJTORYAaAmo1fKIljZnykHsdNpKqNMYxulCxPqZ0lQPqW96aZzfDgRPNWtZ8guMIkjxgziafeu7w2krVC01krxQ/i6Toh7+0P1e+IygMfrN4Ov8oigESkGJpYovhAMYRtyLTqYUzlKyDAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YinjZUbyBDiqLPnu2i4TwedJkpDwz59JxPSFxL7xN0=;
 b=Sc8s911rwrVC1pzuCZWl6DGecstnqUtNxjMa7EwtOL1MME0XCGhrWI6Rcw0CNHbCWe7EPNvG3AmHQZU9NiJ9uZMy28fYvNV7Mxs6AAjMNjuAahQb5JcPaAQkbKK1ZXtKWQZpETPLpJDJlYLjD3kD2IlG2SGKsHZbmKM2EoAALKaroZ7YASZS7zTsfniRaYgXL3N1g4aNrGEIiGQpsuSFfGH15DSDhlfX9Qx8Q93S9qH9nqvxC4I+yQ3CLo6mcSKRB0OzRr/sIeiXnaQRAqKFnrEMoOPPaImNh7s56349kq6SdXEU2YZmtWBw1pMgagDzW+xJg54unsbkAuE//KpSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YinjZUbyBDiqLPnu2i4TwedJkpDwz59JxPSFxL7xN0=;
 b=IuDVpKwUvc/T5HINOIaraGbYsL4TXXLetfjXU0L2IodkR63qYXTpLcuWQ1OmgmmA3E6o0LVZu2QKjdxMZWygx+DmEJk/Q6fWfDNSQWoQUt7Eu/nZFGBdk6e4JCQ9VHg+FfO+nBCS+usSEp8ywv4OlV/pHSWBjvUc9sBN7RW0Cg8=
Authentication-Results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN6PR10MB1315.namprd10.prod.outlook.com (2603:10b6:404:44::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Tue, 26 Oct
 2021 15:48:00 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 15:48:00 +0000
Message-ID: <d2119d59-89e4-34aa-86df-38fee2a0c6ef@oracle.com>
Date: Tue, 26 Oct 2021 11:47:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
 <YXcAbXJfg/jKCo5h@kroah.com>
 <0ddb1c19-64b0-4117-7a92-c3d2fcddfdcf@oracle.com>
 <CAMuHMdWcU7wy1dxa_MXuHoUTWebvq6ShP820Bn_v+8tx7-TEdg@mail.gmail.com>
 <c73402dd-ec3f-4df7-6a16-36fb276a50f4@oracle.com>
 <CAMuHMdVHt=9N274SG+B7W83JbVVnbz_U5Nkejs_PR2HqvZvJgQ@mail.gmail.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAMuHMdVHt=9N274SG+B7W83JbVVnbz_U5Nkejs_PR2HqvZvJgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:806:d1::19) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.233.94] (138.3.201.30) by
 SA0PR11CA0104.namprd11.prod.outlook.com (2603:10b6:806:d1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.20 via Frontend Transport; Tue, 26 Oct 2021 15:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33718f9b-ae7b-4c38-71f0-08d99897fcd1
X-MS-TrafficTypeDiagnostic: BN6PR10MB1315:
X-Microsoft-Antispam-PRVS: <BN6PR10MB1315E5AB172E0E2ED416E21DE6849@BN6PR10MB1315.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9MPJILuqYO1Qs8pUzqoPz3gYhDjV2R/zhgnaOYVNgxhePdVPTWIertzuzVgIxHZ1EKmA9bYIATM7xEEpYjOvW5R7YRAMdl68DJP+mHmZLOSzRjuR+z6Bxn8fFM4S8Js9ntKncrzC262H1eB/zspV1B3mjfCUZB+2RRn9raT++yF2Mf2F81oj4tb24auc6nW7ak/l5etOK/qbbgq1xXcCSvs9kVSOq69i8NNOS5+GRPhBIiRsfb7qgjd4oazTtPK46kbFjPTxENnEB42jDnX3RiH3M1kPjgqn0nxPzpsSZXXLDMZOgrLHgyzuRZ8AzH3RrUOZVZAcCkkikoIRGPgK34T4xLxDPFE3wcD8VrxMSrZqCMsuUMWfvXE5Z/MEpcC8ZEH4d2lwS7ajAeiKbXIE6tVVBRAcHsMWvWrWRlA9iBWsoPXUhFwuMYCiBN0HBj3435yo1Bx7g5WcVNe3ZjxwY3iX9PtklBde5l11x2VyYQPoLiQX0QCQoCSaoMsnePVwDKWlMl6Xi7aZ1OgWb+0rq/1LZLzMfOGy8ivpowj1i+G7cXRDZGRYmmbCSDvhxKdgGSwzpBkiIFlCTbBpIutRfgp8fqbJQZpoSyVKfVvjnLyQkRnIxvXaWw+BzQ/X1A5z2Vlmhe9x8op4iFeEgvZdHTuZ4Uoc16IPtBmeu1tbh+Ny7BMKqPoZnzFdBguUsNkUP962NIu+GA/+HY9youJwaWp/IHwE72F2OgaYoiB8P38=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(956004)(53546011)(2616005)(2906002)(508600001)(83380400001)(186003)(26005)(86362001)(38100700002)(6916009)(31686004)(8676002)(36756003)(66476007)(16576012)(66946007)(6486002)(316002)(8936002)(4326008)(54906003)(31696002)(36916002)(44832011)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cndaZzZsdFk3UGRVQWx5TkQxemlzZlNpNDVraFM5Zk4rYXB1T2E1Y3NZWnVy?=
 =?utf-8?B?WjBHMTJmbExjSmRVQXZXbEhpOVlSTjc0aXVFVTRwdk94TmxpSTZxTm9yM3ZC?=
 =?utf-8?B?Vk1Jd2R0Y1hGZzl6SUk4NlZOMXNYZ0UrdFJqRTEwYmJtQklKM3JyeE85RW1q?=
 =?utf-8?B?OS9mdm9hU0VYU25MU1RpWXJya3NMQXZ4M3ZkK2Y0ais0bGo3SDVTcHNQTE9k?=
 =?utf-8?B?U2piN2ZOQjdkVjJkYW5HSHg4L2UvRmkwcEhNQTg2ZWg5UUJFVXFhK0ZRbG5m?=
 =?utf-8?B?bjk3eTRDZHpMNnloVmhMcjZGaUlwTFpMVjY0NUJSSDFpdmFucFBRMXZTbnBq?=
 =?utf-8?B?eTFGM3E4TjJwOWNUc0VLS1JPd2NNdVRWSUYxS0g1aWlJL3UxaEVqdlpyUGFU?=
 =?utf-8?B?clB0SjdNMU5oZFo5Z2hmeWFMTTVrc28zZEVLTWY4N0E0WURPNFplcFU3djBK?=
 =?utf-8?B?Z295UVg2VDZnOElIRVZQNDIvY0NSa2NWeHdQL1FnR1EydWJsZVMvc0ZoRDE4?=
 =?utf-8?B?YkNGMTVYbk0wb1VGOUU4d1EzMHh2cmY1K1RvYUdBUWdZbTd0RHJBb0NzTGJ5?=
 =?utf-8?B?bFBVMVNOQ2JYeCs1UXhJQU1UNncyR3Zmd1RlM1E0VGxBT1l0aUNBcWh3blc0?=
 =?utf-8?B?aUEyMG04Vm5FdWwzYm5wZVBZQ1VjaU1UVzVPWmxhZzVBMk5KenRONVZ1cGpM?=
 =?utf-8?B?aVB2SG5FSk1SRFRxZ21rVkplL1FHOHM0aU42TGpidXdSUnRwL21SNFA3dlJi?=
 =?utf-8?B?VXRiZmNBY3FDTlU3ZEJNK0wxaWpiZ1hlVGpBTHlEUng1RElFUCtoZU42TUVl?=
 =?utf-8?B?MUQ1cFVzUTkwZTBRNTRtY3FNaEJFYkJhVmZGMlN2SkZYZEg1V0FON2E3SFV5?=
 =?utf-8?B?elRsWWpQWEp3WDU0eEtpQ3VIWE1WRW02cTArejhDeEJUQlBXK0RjbVhxbDVM?=
 =?utf-8?B?RlZGcGtrSTZVNW5aZHJmcDc3Q0JoVys2OE5NbzBTT1NPSHdiSUNPbWloY1My?=
 =?utf-8?B?ek4rRDZzaTRGQmFIMHZiOU1GSUc3eWdtUXpqTXRoY0JLeXRpQ2YrVnZrWlUy?=
 =?utf-8?B?OGdTRXI1Qmk0aHpMZUE4YXA2YVNQcC96dXg5cE9kd0psdXd3Rmh3MnJ3bU9Y?=
 =?utf-8?B?LzI2SHVwejMzN0RabzZXNHpIdStXbWF4MXVqdVF3cE4rSGI2L0N3VGsvdkkw?=
 =?utf-8?B?SENhd3lvMlJvaVArNkEzZ1o2RWsxUWVwOHJSMzAxbGdIUDA1bmNnSUhvdEpB?=
 =?utf-8?B?V1d6T3diUXJFM0hrSHdlU2ozOWtMWHFPbitIY0JybXdyWUZ1SDNDLzNuN1Yr?=
 =?utf-8?B?c2c2Q3F0VFV1U2JuV3RUekxyWFRieEFCYVJZK0tTeTlENGltQ2ViY252Y1Mz?=
 =?utf-8?B?NTFoV2tCR2VhSUtoenRoQll6bTdvTEwrTDhsbTNtV0hSWlpCcERDeGFuMnA3?=
 =?utf-8?B?UlNqYWhITHJ6aEtQbTZySUJIelNaRGFxSFYvK1lPd25NUDN2U3pOZWorRjNQ?=
 =?utf-8?B?YjhlVU1iN0FYTkJjcjJ0bnEyM0REZ0VkZTJFYlZPQURIZTFLUW5RTlN1dnZ0?=
 =?utf-8?B?aUhCNmpieXBQa1RvRWdIcy9McURQbUJ1NmdqUEQwaVkxSkNtckpDeGV1WkZ3?=
 =?utf-8?B?dGs3TnB2M2NwQUhCQ3dOMTZkVGtUTlRWVitMSjYrbk9BUmRpTW0ySTlvRzZi?=
 =?utf-8?B?YVhqWGlJcmhqajdJMGxPbEVaWHFKZ1N5cXhNZjFBT0xDVi9yQkFySStZWlRP?=
 =?utf-8?B?YUg0V1dIUmo1Y0taOHZkUXNKdXVIZG05aTB5eER3WGkxczNvQ1k2REJ5bCta?=
 =?utf-8?B?QXpEVDc0TndpS0ZMY1FTRXd3WTdWZjBTc09ZT29iODFCbTRoRGxXcnZiYUdT?=
 =?utf-8?B?Y2ZkY1AwbExGN29jajBGK3NQWkJNa2d6V1FTaTZiVG9KTXJDUk0vazZ6RVNR?=
 =?utf-8?B?ajNON3czOERQL2QrOHZKZ1VlSlJvZ3NySTNBaVNrVGZJdDB3NFdGdDJSS2lk?=
 =?utf-8?B?dDY5dExtUWlpWUNVUXAyV2p4UUFoTUJOTFlySTRCL0VsYTRtS0t5bjVpZHFB?=
 =?utf-8?B?UEc5aFJvYmNrdmdBZ2hwUmZ2Wk1FNzZSV0MzYzA2dGl6Nm9IQ21NSmRLU0J5?=
 =?utf-8?B?c3lpd3lRclhLN3lHVTY5K3FoWnpTc0dnSzE3dHNDb25Gb09PVThZY2dYaXdr?=
 =?utf-8?B?TDN3akVJSHpuS09ZSTJJM0JpTGszRjBUODZkY0RjcW82WExGVFhSeTl3NHo0?=
 =?utf-8?B?Z1NzdUwzY0sycW5KdHFaTzNqRnBnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33718f9b-ae7b-4c38-71f0-08d99897fcd1
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 15:48:00.0237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xmRIZWyxXiqGPlYwWseO8rzCnuGKIFER9IozqSeF0a8CdOOAO7EC+GcZolK0tWX5RxZvKcV8chAiWOU2pHjcj7Dtvi4JbszbgsUPFCfPVoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1315
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10149
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260087
X-Proofpoint-GUID: Ssg06PlsQP66edBAfzoUPsxDUch0E7Yq
X-Proofpoint-ORIG-GUID: Ssg06PlsQP66edBAfzoUPsxDUch0E7Yq
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

Hi Geert,

On 10/26/2021 10:11 AM, Geert Uytterhoeven wrote:
> Hi George,
>
> On Tue, Oct 26, 2021 at 3:38 PM George Kennedy
> <george.kennedy@oracle.com> wrote:
>> On 10/26/2021 4:30 AM, Geert Uytterhoeven wrote:
>>> On Mon, Oct 25, 2021 at 9:37 PM George Kennedy
>>> <george.kennedy@oracle.com> wrote:
>>>> On 10/25/2021 3:07 PM, Greg KH wrote:
>>>>> On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
>>>>>> Do a sanity check on pixclock value before using it as a divisor.
>>>>>>
>>>>>> Syzkaller reported a divide error in cirrusfb_check_pixclock.
>>>>>>
>>>>>> divide error: 0000 [#1] SMP KASAN PTI
>>>>>> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
>>>>>> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
>>>>>> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
>>>>>>
>>>>>> Call Trace:
>>>>>>     fb_set_var+0x398/0xf90
>>>>>>     do_fb_ioctl+0x4b8/0x6f0
>>>>>>     fb_ioctl+0xeb/0x130
>>>>>>     __x64_sys_ioctl+0x19d/0x220
>>>>>>     do_syscall_64+0x3a/0x80
>>>>>>     entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>>
>>>>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>>>>>> --- a/drivers/video/fbdev/cirrusfb.c
>>>>>> +++ b/drivers/video/fbdev/cirrusfb.c
>>>>>> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
>>>>>>        struct cirrusfb_info *cinfo = info->par;
>>>>>>        unsigned maxclockidx = var->bits_per_pixel >> 3;
>>>>>>
>>>>>> +    if (!var->pixclock)
>>>>>> +            return -EINVAL;
>>> This is not correct: fbdev drivers should round up invalid values,
>>> and only return an error if rounding up cannot yield a valid value.
>> What default value would you recommend? Here are examples of some of the
>> possible cirrusfb pixclock values:
>> 40000: 25MHz
>> 20000: 50Mhz
>> 12500: 80Mhz
> You should pick the lowest supported value.

In bestclock() the frequency value ("freq") is not allowed to go below 8000.

         if (freq < 8000)
                 freq = 8000;

If pixclock is passed in as zero to cirrusfb_check_pixclock(), is it ok 
to then set the value of pixclock to 125000, which will result in "freq" 
being set to 8000 (or adjust the passed in pixclock value to make sure 
"freq" does not get below 8000)?

Thank you,
George
>
>> We can plug in a default value, but I believe it is just covering up the
>> fact that an incorrect value has been copied in.
> Passing zero is not incorrect.  The driver is supposed to round it
> up to a valid value.
>
>> I would think we would want to keep this driver consistent with the
>> other fb drivers that return failure with the incorrect value.
> I disagree: non-conformant behavior should be fixed, not copied.
>
>>>>> Shouldn't you be checking further up the call chain where this got set
>>>>> to 0?
>>>> The same pixclock check is done in these fb drivers:
>>>>
>>>> arch/arm/mach-rpc/include/mach/acornfb.h:    if (!var->pixclock)
>>>> drivers/video/fbdev/asiliantfb.c:    if (!var->pixclock)
>>>> drivers/video/fbdev/clps711x-fb.c:    if (!var->pixclock)
>>>> drivers/video/fbdev/core/fbmon.c:    if (!var->pixclock)
>>>> drivers/video/fbdev/core/modedb.c:    if (!var->pixclock)
>>>> drivers/video/fbdev/cirrusfb.c:    if (!var->pixclock)
>>>> drivers/video/fbdev/kyro/fbdev.c:    if (!var->pixclock)
>>>> drivers/video/fbdev/riva/fbdev.c:    if (!var->pixclock)
>>>> drivers/video/fbdev/uvesafb.c:    if (!var->pixclock)
>>>>
>>>>> What logic allows this to be a valid value?  What about all other fb
>>>>> drivers?
>>>> The "check_var" function, which is set into the ".fb_check_var" element
>>>> of the fb_ops struct, should do the check, but in the case of cirrusfb,
>>>> that is not being done.
>>>>
>>>> All this patch does is add the same pixclock check that the other above
>>>> fb drivers do.
>>> Indeed, several drivers are not following the rounding rules.
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


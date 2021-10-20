Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C15435BA2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854C86EB80;
	Thu, 21 Oct 2021 07:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A6389F24;
 Wed, 20 Oct 2021 18:52:22 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KHvnVW019159; 
 Wed, 20 Oct 2021 18:51:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=LuRE1YmqnU0LRqDvRha3G0sRGoCeIgZucdGQ0gBKz1s=;
 b=Qk+FIUygsk0HgdlG9aVvdLvKKnMCP+G2YQ7q8ZTbOeWXNPs1+kpyeo9R/QqDuraWjRqt
 sfKQiA1DYGFYBU6MmuaC4qLIaqdH4AAuq9QCqboTBI+C4Rk4dktD44Pne3QmWcJsB0tQ
 wrz4YapZbXtvDcswil6EPgSGL02R+n+k8dTmKYxz81Wx62i4gBnE7I9NrG9KdhkSG1x8
 MxK1Y+dhXG5kfkYGci5TnyrFfyGmAdAenlOH8Ebh+r+zk2DrUHbX4Cesb8z5KegdCmAC
 YQ79Y9+ZtHGjfrlpZiH19aVg+Uyj6U7aZQGQxD2yhVsswZX7dEbVuIe7BhmYJh+vFf+0 QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3btqypgb8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 18:51:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19KIpah1186154;
 Wed, 20 Oct 2021 18:51:38 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
 by userp3020.oracle.com with ESMTP id 3br8gumy9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 18:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgwDmlIu44HlhhzezQ6t4mb5S5cZhIfdbhPM1Cllx3a4tZhM9WZSdEy3jVX/tZLx7o+1FafAmrQqE3tV6AlRcheqoGP/IxdXxA6ZX40mGaL341Op2a5krwiGULAjEDjFjYVjTXEsHL0b1DwRm9jRM7m1o05QoZddm33e/wbPiIgwmLaaoECCq4e04gO1AQI6UQBrdsnaFTXTNhLtp5ZKW1Zj1Q2OQNljmdgI6HyC4kQ63QKh5lamvAVGYWjJWjl7FHvuv6cQKr/p3TNETwZQjBseJXqr34ur/qEuS9VRJTkTS4doZawFPfdCCvbsw+Rkly5JXuQddmax39QYjDxGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuRE1YmqnU0LRqDvRha3G0sRGoCeIgZucdGQ0gBKz1s=;
 b=TANtg+D91bdVlDo8wN39hPLNr8lyrWjS+/T8ZVWwt+eJcifePH7jwhsdq6Ymlb9TQ2nZAl12YojrBqNsU5Bth7blXnEdZW7KRGCCWSef0lA6yk9WwcwrnJr+oizydlxtwQ4usFYVcGwvCzjEIlElYTVA1VXZI2GXkQGxXikjaQe/JQYPFpOlURyf4bWlUPf/HPssU1AZUtjjS2BlHARQ881WZfbXUCgQXiKTvSK/+AR9H2gCGhvGj9J+sGXsqRcQN6YzdwzQG/8uA1tXjjoX3LQFV7ODMlVxiNztS8uPID5MwaYfRmw6qwBsQOgVjggM7SJNfJQvB+uNNFnAbmDNIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LuRE1YmqnU0LRqDvRha3G0sRGoCeIgZucdGQ0gBKz1s=;
 b=w9cnPye9ZhUK2nyRXyjUKkExB2AdLvnUABAjI/PjChSMols2GwDPOtQpV1ouTs1sHyyAuq1zc6srTgkyOHuKJPDXc57QEjj6Dv2KPaHEY4rnAjpim0COVjEHCuGXMB0n/npQ8bLsqU49UEQ1szOGjnpEDVGHziyrl2ldfaceTkg=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5106.namprd10.prod.outlook.com (2603:10b6:208:30c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Wed, 20 Oct
 2021 18:51:35 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d809:9016:4511:2bc6]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d809:9016:4511:2bc6%8]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 18:51:35 +0000
Message-ID: <48eaf3d9-b9b4-09b7-379f-edc48d06820d@oracle.com>
Date: Wed, 20 Oct 2021 19:51:26 +0100
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Matthew Wilcox <willy@infradead.org>,
 Alex Sierra <alex.sierra@amd.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Linux MM <linux-mm@kvack.org>, Ralph Campbell <rcampbell@nvidia.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Linux NVDIMM <nvdimm@lists.linux.dev>, David Hildenbrand <david@redhat.com>
References: <YWh6PL7nvh4DqXCI@casper.infradead.org>
 <CAPcyv4hBdSwdtG6Hnx9mDsRXiPMyhNH=4hDuv8JZ+U+Jj4RUWg@mail.gmail.com>
 <20211014230606.GZ2744544@nvidia.com>
 <CAPcyv4hC4qxbO46hp=XBpDaVbeh=qdY6TgvacXRprQ55Qwe-Dg@mail.gmail.com>
 <20211016154450.GJ2744544@nvidia.com>
 <CAPcyv4j0kHREAOG6_07E2foz6e4FP8D72mZXH6ivsiUBu_8c6g@mail.gmail.com>
 <20211018182559.GC3686969@ziepe.ca>
 <CAPcyv4jvZjeMcKLVuOEQ_gXRd87i3NUX5D=MmsJ++rWafnK-NQ@mail.gmail.com>
 <20211018230614.GF3686969@ziepe.ca>
 <499043a0-b3d8-7a42-4aee-84b81f5b633f@oracle.com>
 <20211019160136.GH3686969@ziepe.ca>
 <CAPcyv4gmvxi5tpT+xgxPLMPGZiLqKsft_5PzpMQZ-aCvwpbCvw@mail.gmail.com>
 <a82a1307-938b-eaf1-cf3d-b9dc76215636@oracle.com>
 <CAPcyv4g7+FTNi-vFvx_3qzrosTSET6nPc=ozdxs=p1dm0hBJtg@mail.gmail.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <CAPcyv4g7+FTNi-vFvx_3qzrosTSET6nPc=ozdxs=p1dm0hBJtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::12) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
Received: from [10.175.165.191] (138.3.204.63) by
 AM8P189CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Wed, 20 Oct 2021 18:51:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab6f14fd-e4a6-45a3-7eda-08d993faa3e6
X-MS-TrafficTypeDiagnostic: BLAPR10MB5106:
X-Microsoft-Antispam-PRVS: <BLAPR10MB510685C58E5B526B38851715BBBE9@BLAPR10MB5106.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ap6io9sD9K7grVeBnchNbvVMecQGnZBTtFLHCjAhR4DfSM5FndIRrYaWZ4OyXkodUuunyXreTt4N8WlwkYkA9zKnBPbVqO+Mbir/V2D6zdJkgX92Z8RMM5gDVdweu/NduKWLwLvMV6f9cmXAftrdCCMGRJGrEXI7oCCcFd1/ghDUbEe/9JoV7xzCTLTteGlaXKcpo7tlyMkEBAjje5JuNeg9i5CTeAZqVgNlHKoOgHcQP7fGbLCZrj9lS44A7s4VkeiB28PeZ2RI+yDNKdg9T37YPct0K+9Od6o0uy97keWDYw8Ze6DYIsXOHZzLUoPqSFoak7pP1nZSeQ3HS69UaQZWtDjLOIasP212wi0ajfIOO2OqLAsqt1/CMjq2X85XVGIIETGJ/Zf9u8HptUN4AUZwFJdGs6bq+xOwrHzEALjzF2g6UmOrR9XvzSmYP7IPhYy2/+TxffzpnpNySrR2XEJ5UzCok8j71R4ko6HHpscP7CtpSCYzVjdFtWq0Tc8ls8pyP7ypZIoOLSvjFkWbhQqsO9Otdv3oj0yUedK8xnHZIO6XRxoLBlya2IVQjgvYT4aVr3ZUXGsW3ph4VQv7VJ0TYm1K+pEjjE8Neij6bgSN2CF+XRDiWyGNrBzLhYiG8rM4vNQx8V8rMkLz1xoJa3JFit8rTdljFG5THeWOy+FmWsEsG0yX/jGztbtM+APOJ0cj2Bb1pCGOf1Qkfj929w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6666004)(54906003)(53546011)(66476007)(6486002)(66556008)(31696002)(38100700002)(5660300002)(186003)(8676002)(7416002)(4326008)(956004)(83380400001)(316002)(26005)(36756003)(8936002)(16576012)(508600001)(31686004)(66946007)(2616005)(6916009)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0MyMWFYYVJPVEliSTNaVm94Ry9mNWRyamFIR3FjbVFLejRibW5vcnB0cFhi?=
 =?utf-8?B?YW51VHBGKzJDM1B6eFNnWENqanBZdjlXQ0VJOWVqQy8xQmlJaXF3WHUycUpD?=
 =?utf-8?B?Z05xMlNRMTJ5b01PV0pJUCtaQWY3SHd6clpYMnBPSDJISnlCa1M5VFhRS2p1?=
 =?utf-8?B?Y2ttY2xBb2pWQ1FVbjBiRHd0cFNRTCtxZlkvRnN1Mmo0Zk8yV3BTREpVTmM5?=
 =?utf-8?B?YUh4TERFd3NpTnIxLzdGbWZNT0xId0xZK25UMThZbUVLSVdZT3cxQkwxc0la?=
 =?utf-8?B?SE1MclF3YU5FVHRrYkJNRjdoaUFMYjlQZjRINk85b0VSSzdFWDFveXNCeGht?=
 =?utf-8?B?TzlFcFI1MVFuNDhqWDRXd2dxdnNSQXhVZjhsbDY3cGNGUW42bGFOTXQzSDNh?=
 =?utf-8?B?S09lMGVOVmhuQ1FaN2FITzRDQTZWcUFyY01Pc3ZGM2JsQ0JacHJqZk1Fb1NY?=
 =?utf-8?B?KzRJY2VjVmZhZWZBS1RWNEJONzdaa0FqVVVoVUF3QkdpVjFjdy9MMU1xYm9o?=
 =?utf-8?B?MWlXYTF2VEkwMFpkTGovekZGb29NN2lmYkpzYkdEYjBBekNMSm5uVW9yZHdx?=
 =?utf-8?B?cVpjdHNtOXhiTy93bmdielpNSXBEejNkQ0MxK1lZZ0tGc3JDMFZVcnMwcXpQ?=
 =?utf-8?B?SkRrN2UwTmphQWNqMnd0eW4rRWZEQlNIdnZOQVZjNlpwT2twU016RTJrVS9k?=
 =?utf-8?B?VkpiTzVrVnluTno1LzZJUmdldUhucTdVT1l1blNIOWo1TkN4Z0FQNERiYUhK?=
 =?utf-8?B?ZUhmaU5ySlNFa1ByMzRrQjRBZTdRazZkZUZPb0FRTll0VnBuamtsLzdvL01z?=
 =?utf-8?B?VGxFZ2hUTlpZK3lRV1IzSDJNWnRoUjFTMnpTcW43cHRIeDZxdWw0RXJjdm1U?=
 =?utf-8?B?ODQ0YVpRNTR6SkJLU1FFMHNoR1VkeTA2NkY1WlNYRU04dXByVndyKzRZSzZj?=
 =?utf-8?B?a21JWkp3RUVoU0ZWbG1XTDViVUVVVkZTWHFhbnhZQzhmT1JXcWRoVi96SjhZ?=
 =?utf-8?B?TVl4Q0lJNisrU29SVUxYR0NicGd6UWgxUUY5a3g5cE5BdHc5aitVQkJRWWRR?=
 =?utf-8?B?NHJTK3VmNVFoNDh0YiszQ3VTZXE1emlTMDRYOE81cUZnQUZtajY0Zm1IM1RI?=
 =?utf-8?B?TWsvMkhvcG0xU2tuVFliMWFuRUtQODl2cVNweWtUN3Y1OVZWblNJc3ZzV29z?=
 =?utf-8?B?STVlSXVPTmJxWFVQZk5LYk84cDhucDh1NC93VXhXcDVyWDdWcTBRS2IzVXRW?=
 =?utf-8?B?N1g1aUFzaGVhOENZTHVHSG43dDRyTFF3Wkt5VkhSVVN2TEpTbkt6WW5TTVZZ?=
 =?utf-8?B?RmFNWTJYUngrdUpIM3B1ZjhaelZySDVqZmNCRDBEaEFqNDZ4UEE3VzgrWTMr?=
 =?utf-8?B?SXJ5Rmg3RTYvdW5oQU1DbnhDTys2bU9tTXphcE13N3JaOUpoOUswb2tvY29w?=
 =?utf-8?B?eDFLZHlVZzIrM0FpN1VTUkhFalQvWUhLWFpqd2ltWDJxQ3J0K3FrZ1NNMi9G?=
 =?utf-8?B?MVRSNjQwUVVjMU1kZklIWEVIcGpaOW5wZGNCOG1KaXQ2bkJ1TUFzVkk5dUVY?=
 =?utf-8?B?aTdUQU4rb0tqMkhDUmpLd1dXejVEdG1WOVlCZURvVjNNaVc4Vm53c1ZJd1BP?=
 =?utf-8?B?SWUwYnNiS1kxbEdESUgrTjgxbENtZjBxSFVBdmk0TTI5bjhhQlg0c2dkRWth?=
 =?utf-8?B?bUptQXl5QXg0ek4vRGh1TlhZaFNEbW1QZ0YyYkh1VUw4M25DVHNpWDh3cW9w?=
 =?utf-8?B?T296bTRZdU5ra21DbjRRV3V4TFJUb3V5YTRGWXgvZWpFQWZMVE83N3RXOFJQ?=
 =?utf-8?B?OHE0NmNlNmNtaXFmVHA4QmFJRVBIZ2RiTkFNenhoTzVrYTZ0T1UzeEp3VVBB?=
 =?utf-8?B?aDBLRTdTVkF4Q1ArOVJpNnM3SW82U0xLaFFsOGFWalZ0M1VFbGR6b0RqdjBJ?=
 =?utf-8?Q?SIFwyyzyv4iPc7JjiPsose1DwJIymFS/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6f14fd-e4a6-45a3-7eda-08d993faa3e6
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 18:51:35.3382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joao.m.martins@oracle.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5106
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10143
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110200107
X-Proofpoint-ORIG-GUID: qqe3Wl8z2pyRoXB-JoJ2TtjEBM9OeUxz
X-Proofpoint-GUID: qqe3Wl8z2pyRoXB-JoJ2TtjEBM9OeUxz
X-Mailman-Approved-At: Thu, 21 Oct 2021 07:25:31 +0000
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

On 10/20/21 18:12, Dan Williams wrote:
> On Wed, Oct 20, 2021 at 10:09 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 10/19/21 20:21, Dan Williams wrote:
>>> On Tue, Oct 19, 2021 at 9:02 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>>> On Tue, Oct 19, 2021 at 04:13:34PM +0100, Joao Martins wrote:
>>>>> On 10/19/21 00:06, Jason Gunthorpe wrote:
>>>>>> On Mon, Oct 18, 2021 at 12:37:30PM -0700, Dan Williams wrote:
>>>>> Whats the benefit between preventing longterm at start
>>>>> versus only after mounting the filesystem? Or is the intended future purpose
>>>>> to pass more context into an holder potential future callback e.g. nack longterm
>>>>> pins on a page basis?
>>>>
>>>> I understood Dan's remark that the device-dax path allows
>>>> FOLL_LONGTERM and the FSDAX path does not ?
>>>>
>>>> Which, IIRC, today is signaled basd on vma properties and in all cases
>>>> fast-gup is denied.
>>>
>>> Yeah, I forgot that 7af75561e171 eliminated any possibility of
>>> longterm-gup-fast for device-dax, let's not disturb that status quo.
>>>
>> I am slightly confused by this comment -- the status quo is what we are
>> questioning here -- And we talked about changing that in the past too
>> (thread below), that longterm-gup-fast was an oversight that that commit
>> was only applicable to fsdax. [Maybe this is just my english confusion]
> 
> No, you have it correct. However that "regression" has gone unnoticed,
> so unless there is data showing that gup-fast on device-dax is
> critical for longterm page pinning workflows I'm ok for longterm to
> continue to trigger gup-slow.
> 
To be fair, it's not surprising that nobody noticed -- my general intent
was just to special-case less for device-dax. Not many places use
pin_user_pages_fast(FOLL_LONGTERM). This is only exposed on those
few cases that do try to use it (e.g. RDMA/IB, vDPA), and specifically
when the page fault occurs (that requires fallback-ing to gup-slow) at a
higher level than the amount you're pinning e.g. pinning in 2M extents on a
device-dax of 1G pagesize. Pin size is limited to a 2M extent at a time by the
users I mentioned above -- regardless of the total size of the extent you will
be pinning (i.e. 512 struct pages pointers fit one page). But even with all this,
this [FOLL_LONGTERM on pin-fast] would still go unnoticed because gup-fast
on devmap is just as slow as gup :)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 442C7433D24
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 19:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF91E6E18E;
	Tue, 19 Oct 2021 17:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD39C6E2F2;
 Tue, 19 Oct 2021 15:14:23 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JEB5Il010389; 
 Tue, 19 Oct 2021 15:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=VaY0UQCnfYuK/mcCz4e3lG1V+/CTiYnCBCQ018K5kQc=;
 b=DeVNYSpIhtNacNMhIjNDaKtB7iIohMtbkD9vW2MSLelY8D9nIFDtteBeLuqYRbWOClL5
 GvNgmx2lRNz/m5v0inrQtBlZQfHBahjNbJmhMweG01BJzLVnqGEqjgLIRoSLVoeqhxVd
 xCe32c/lisJYlHvXKyxu7nOVdwakr3IsSh2V2vNe69XqfQZGVNeOVAQ/XZDiMDH+93EY
 MuL94UFhpnJqdJ6UMZ8dB10/ugrcP+JGOlroOk67zjo4n3L4/koxUzTIQMSLvDNTLolF
 I0iIeS69U5Cz7N+gBCL4KrLYhXH1dHaNORF5SwbA9nvuWG5fwmXad7+9lVPdo474QSH3 eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsr4534yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 15:13:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19JFBZif185218;
 Tue, 19 Oct 2021 15:13:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
 by userp3020.oracle.com with ESMTP id 3br8gsh359-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 15:13:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgKKEN3ZTiklhMvHjDvGcfFWW3Pk+SmT+Rhshg9nw3n16WdxwhfqVkrAg0fa8p4RrvyjO0TKjVvK8pmZzkWmMKIV6+vueVzQz9aYKPJaHWkFB2za7by9vQmRJXv/EFqdGTKKPd85gXWtuZWUXQtKuvP87bifNwztpHp9YBJGmOlUxuFeulpVCmoPKYJ/xqi28biz6vlcvGutERSDqjTokaKi7XAywveqdkDtJS7tFsZq2e7fBTpP6ldM1vVpuVh+DBxYQdrzc5tj7Z1NaG+4qLPfnzdKun3ja0Rczk4NenJ9EN7XjwV/sG3xjCzRrZvdOW5RM8WsJBRCjtoZoCjylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaY0UQCnfYuK/mcCz4e3lG1V+/CTiYnCBCQ018K5kQc=;
 b=OX0fwa6yb7vKn/Mj4tX2nyeE+5KGhvMFTkeE1lSkl4jASG+8Or4/J1YP7FkInXbBXcx/A18jEP/NFL9V98yubv2mwB82aQ8fdBwxDPNPHOdukXlv5CE5sKniItewvlWAkEu7VXPhaj1jh3xUPdRIZeRheqQ7SLFFEUcfGWbB64PhqW+yhdnRSU7pBPq4kSiFik4JqTNa52KZ4lRuU93degbzrPR86qkXN83oLxmi3aoq6PRr7etpkymScF8toaARvuxcRolXTlMHM2YPYbP4Vf2IWdSMgxiZlZY6x+i7rPCXd0gfgOs3/5bUyBugGMOa5lq+Mm0UdAHTcwLJWZREJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VaY0UQCnfYuK/mcCz4e3lG1V+/CTiYnCBCQ018K5kQc=;
 b=KiXtRR6eVX5AQSXbH4LO3G7PfPbzie93xo19R5GUcYM69Qw2+CRIqqYA5OLRROhGAWEMOGMvHCM8qhkUY1Z4WmemwBlP094IeqZpA18SUu5r2zRS/m8zcPmCy+EXgGN9W2bhD+QdhqNcuqkoyZlcVV21dRsCMmiuiFez1XrYA5s=
Authentication-Results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5169.namprd10.prod.outlook.com (2603:10b6:208:331::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 15:13:43 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d809:9016:4511:2bc6]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d809:9016:4511:2bc6%8]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 15:13:43 +0000
Message-ID: <499043a0-b3d8-7a42-4aee-84b81f5b633f@oracle.com>
Date: Tue, 19 Oct 2021 16:13:34 +0100
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, Alex Sierra <alex.sierra@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Linux MM <linux-mm@kvack.org>, Ralph Campbell <rcampbell@nvidia.com>,
 linux-ext4 <linux-ext4@vger.kernel.org>,
 linux-xfs <linux-xfs@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Alistair Popple <apopple@nvidia.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Linux NVDIMM <nvdimm@lists.linux.dev>, David Hildenbrand <david@redhat.com>
References: <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com> <YWh6PL7nvh4DqXCI@casper.infradead.org>
 <CAPcyv4hBdSwdtG6Hnx9mDsRXiPMyhNH=4hDuv8JZ+U+Jj4RUWg@mail.gmail.com>
 <20211014230606.GZ2744544@nvidia.com>
 <CAPcyv4hC4qxbO46hp=XBpDaVbeh=qdY6TgvacXRprQ55Qwe-Dg@mail.gmail.com>
 <20211016154450.GJ2744544@nvidia.com>
 <CAPcyv4j0kHREAOG6_07E2foz6e4FP8D72mZXH6ivsiUBu_8c6g@mail.gmail.com>
 <20211018182559.GC3686969@ziepe.ca>
 <CAPcyv4jvZjeMcKLVuOEQ_gXRd87i3NUX5D=MmsJ++rWafnK-NQ@mail.gmail.com>
 <20211018230614.GF3686969@ziepe.ca>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20211018230614.GF3686969@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::19) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
Received: from [10.175.162.43] (138.3.204.43) by
 LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:152::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 15:13:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a1011eb-648a-4af4-b709-08d993130a1b
X-MS-TrafficTypeDiagnostic: BLAPR10MB5169:
X-Microsoft-Antispam-PRVS: <BLAPR10MB5169645B75ADB9FFF4699D21BBBD9@BLAPR10MB5169.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c90bf+8KE1PKiaQIeJW0KER3XRGgpmLOn9PF9j14eJMniyeoFG5PRzb62Nh8mQncoaapCZG4N09BGe5EVUqGD+yCnKCD3ivCzOxiB5Y6SheH5ev9++OeK63VvUZ84Ckyjf7fWS5OTrNQbpIk8ujtl9uceRIdynJM3CcuZj71JJvzueGqcLlIRGkwCDFvnN/CLxY3UujavviKTfy3Gmtg7Th/Gtl1IrAGkmiZkkn9lvy4W+24iD8E/y1P6mES48fZWPjsTa/Tz2cq2+SKH/lAlwulTKARrdm/3jcDbO4nsfchyQhY2Vymi9MFZTc95lLA/5GlPQJnD3FeKM73ngUImlPOzb/ATnqqMgKD4XH0uFfWPrek1InLE9Jl17PROnB5IN12GX+BFPfu/KYWDSP4kJwbwaaztcOfzQ1DdmRJo8Od15xnU7g5qa+815E11g7Q8G0AdLgeCNaTVk5ZNZb1zhEGI5aRR+3am6oMD//zMF+PJBDMCn6mMXtL3bYbiD2UuOdtRMZfbIyC5C1fg8NlQd1om1H5X3JmnYoPEA5RZaz2+L/sf+SdT3V4Tl3Z1XmEBkY4AjCy0DcXholeIx0qQSi6rY9IBw4BJ7pwL7naC+b2PAE4rN09b9zYmNjGox7cZ9jVjiXzRqKsmQBSSrDFYGSzvEDeJbDyG7srAGxdiZNlgUHHOoWeUNQASFOr4EXrXNgrHOdAHTwFjg1EFz3uKudjDHEPhVOrHLqmxHUuCDNT/bC7fzk9TcfN0IkoJirMDdfaDWOu8Tw+jEPmY97vcSgdUz80DKfgPZSosMYQeFo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(16576012)(66476007)(66946007)(86362001)(956004)(2616005)(110136005)(2906002)(6666004)(8936002)(508600001)(8676002)(966005)(26005)(36756003)(54906003)(4326008)(53546011)(31686004)(31696002)(38100700002)(6486002)(7416002)(186003)(5660300002)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rjk3Q0tOUFlFcmdURkxHcFZIdzRCNnJaQ1dqNVBvTS94bHlXL01FeWdTdUhj?=
 =?utf-8?B?dEVNVWUxc2FMS0toUURja1pmL2FXcXYvN1JDbFJNSElPZXhuVFljREpUYzFk?=
 =?utf-8?B?QUQ3OVdMbXowUDZTd2pmUjBiZEFuUnNXU05VcVgrVHJ5UzE4c1ZUYk5lR2g4?=
 =?utf-8?B?MlpXdFBQN1M0ODA4N1FYYy9rMlBkSjVRblZjRVdRaXp0TmtaTXB0c1JiQVRo?=
 =?utf-8?B?d080YjJnTkM2STNUZ3FkZGJUNmI4TG1QQ2MzMStoeVNVZEx3YmtHakJmWlJ3?=
 =?utf-8?B?blpoeVFMVkZ5eXZEZ3VqUmVhdjRGZ1BNSTdHNThzRFJ3azY1TWI1eGtJcEY5?=
 =?utf-8?B?L1JFTjBnNktVRVREQTFoTytSd0I3M0N3dDIyUEo1T1owM0JqcFNaRW1jdXZk?=
 =?utf-8?B?RDRCSVJHNXNjU29rZkVLWWFwL2M1TFduL3drZitVZUpjNFAvWTNsYWlLZ0Rz?=
 =?utf-8?B?TVNRNHVTaU5OUmhKYktwaFlUNnl3aHVWdXJkTDdwcnIyemVJbmtENGY4ZkE0?=
 =?utf-8?B?RWRycmVtbkNOTjlmTldIajdoYmF6ejRvdGkxaFBHUFlxbVZhWFUxVUtZQjFZ?=
 =?utf-8?B?T1FuUVJjRjE0WlBBWDlsZUN1Umw0aXdySGVWN3ZpYUV2dkc4ZHpEcDBKZm1M?=
 =?utf-8?B?clMrZGJlZFBOREFmUlVBKy83UEJlUmZLMmQ4S1g1K21US0tEUjlRVDhIc2tS?=
 =?utf-8?B?RjhjcEFEczBxRDVkd0dhWjR3QkxSZGRyOU9nM1NRU3I2eEpMaGQwWDlDbnlD?=
 =?utf-8?B?NUxzUUVweFUvOEI0d1NEVnR3QXVZZWNvZ2NrY0ZtNmFVYTZNQ1hqTGNVVjQr?=
 =?utf-8?B?bko5ZmtmcWxtN0tPT1JNVDM5cFBJNWNrR1NVQlJjRnpCb3ozZzJ2L0xseGt4?=
 =?utf-8?B?eTBLdVI1NUVSZUdHckFwTmhHWlJhdko4cHZVcElUTjl3eXd5Q2tlQUUvKzdJ?=
 =?utf-8?B?RzFpWUhCbGkrV0tFNUJ5V1FjWllRSjMrdnR5UE1rOEZIdDlaTmUxOTVtMCtK?=
 =?utf-8?B?c0pBM2hWTDdWaVhUYUV2VXgwL0I1cEgyQVhaOUl5ZjF0NHlUVFBDNGx2VWhk?=
 =?utf-8?B?OE96bFZwWVhPSHB4ODY4WmtMdXFZaE95WTMwdzdsMGVFRTNVaGdVa2FpSjVN?=
 =?utf-8?B?RjREZm80TkY4US9UMGJkVkhjaEhXNVBUN3Y4VWdaaFpkbjRwR1FoOGNNc043?=
 =?utf-8?B?eUlIcWdMRDh6QkdqSmFWRUdJNlNZU2lmbjZ1ZnRNSnRTenpGcTdvOWp6YjRR?=
 =?utf-8?B?a0x1T2NQNzh5dmFzODIvRXVuaDQrTzZsN1p2dVlPSkZUU2ZSRlM5TEpQdDE1?=
 =?utf-8?B?M1hEamhrSm9aTzNnNVZYWTI0RldscnNiZ1l6a0h3c1RVT1UwenhZcTBRZVpP?=
 =?utf-8?B?ZmMrN1ZjbGJTWWdVMGx4dDdFaERnUzV2Zjh1c3J0SDhKcWQ2KzRjZWZYUzN3?=
 =?utf-8?B?UUlNc0RBVFVVWlhvYVZEM0xDVEJkWkJEbjltWGxCajVBWmlqSWVtNjJTZERR?=
 =?utf-8?B?dVk4UXg4WUlpVjlmbnhOQ1M4M2VvNy9NcVYyWDhWOEt4cm5OMzIrd1MyQkZk?=
 =?utf-8?B?dFRqWGU1c1dvS1lNeFJURU5qc1FtZUFPMDBwRzQ2d0dBdE5EaXgwVm5LREtu?=
 =?utf-8?B?ZnRXdmFaUGdjS2ljbnJSK1pydFRQRCtNeWVPVVlHVzdyYWt4V0NoYTY1aXQ2?=
 =?utf-8?B?bC8xb3V3eWFPczI3NVFZQnlwWGkvZStmaGhUN0dYeUlZbXRvU09IZk1lUDZx?=
 =?utf-8?Q?a+eUGqU9VN93l1e9ZlVY5lRhFxZzKywKfPSHaMy?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1011eb-648a-4af4-b709-08d993130a1b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 15:13:43.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WxurfhG+UZjnlYJM96T2sPLWz12AKEs35qZua6AFg30kb2SVC5mR4TquMITNs30R+pkVt35PUPz8hIBddqBjpdQYQPtaby8CmORFl8iXzeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5169
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10142
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110190091
X-Proofpoint-ORIG-GUID: f4UnzgvkAxrBcIy4aqzsMou_lUADvY1X
X-Proofpoint-GUID: f4UnzgvkAxrBcIy4aqzsMou_lUADvY1X
X-Mailman-Approved-At: Tue, 19 Oct 2021 17:13:35 +0000
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

On 10/19/21 00:06, Jason Gunthorpe wrote:
> On Mon, Oct 18, 2021 at 12:37:30PM -0700, Dan Williams wrote:
> 
>>> device-dax uses PUD, along with TTM, they are the only places. I'm not
>>> sure TTM is a real place though.
>>
>> I was setting device-dax aside because it can use Joao's changes to
>> get compound-page support.
> 
> Ideally, but that ideas in that patch series have been floating around
> for a long time now..
>  
The current status of the series misses a Rb on patches 6,7,10,12-14.
Well, patch 8 too should now drop its tag, considering the latest
discussion.

If it helps moving things forward I could split my series further into:

1) the compound page introduction (patches 1-7) of my aforementioned series
2) vmemmap deduplication for memory gains (patches 9-14)
3) gup improvements (patch 8 and gup-slow improvements)

The reason being that item 1) is the the main dependency listed below.
And allows 2) and 3) to be parallelized. FWIW, it is almost fully reviewed
by Dan (as of v3->v4). For (1) patches 6 & 7 are on changes to
device-dax subsystem (drivers/dax/*) which still needs his Ack.

>>> Here I imagine the thing that creates the pgmap would specify the
>>> policy it wants. In most cases the policy is tightly coupled to what
>>> the free function in the the provided dev_pagemap_ops does..
>>
>> The thing that creates the pgmap is the device-driver, and
>> device-driver does not implement truncate or reclaim. It's not until
>> the FS mounts that the pgmap needs to start enforcing pin lifetime
>> guarantees.
> 
> I am explaining this wrong, the immediate need is really 'should
> foll_longterm fail fast-gup to the slow path' and something like the
> nvdimm driver can just set that to 1 and rely on VMA flags to control
> what the slow path does - as is today.
> 
> It is not as elegant as more flags in the pgmap, but it would get the
> job done with minimal fuss.
> 
> Might be nice to either rely fully on VMA flags or fully on pgmap
> holder flags for FOLL_LONGTERM?
>

Whats the benefit between preventing longterm at start
versus only after mounting the filesystem? Or is the intended future purpose
to pass more context into an holder potential future callback e.g. nack longterm
pins on a page basis?

Maybe we can start by at least not add any flags and just prevent
FOLL_LONGTERM on fsdax -- which I guess was the original purpose of
commit 7af75561e171 ("mm/gup: add FOLL_LONGTERM capability to GUP fast").
This patch (which I can formally send) has a sketch of that (below scissors mark):

https://lore.kernel.org/linux-mm/6a18179e-65f7-367d-89a9-d5162f10fef0@oracle.com/

It uses pgmap->type rather than adding further fields into pgmap, given this
restriction applies only to fsdax.

... and then we could improve devmap_longterm_available(pgmap) to look at the
holder::flags or pgmap::flags should we decide that an explicit flags is required
from holder/pgmap .. as a further improvement?

	Joao

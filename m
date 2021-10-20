Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4112435BA4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8A6EB83;
	Thu, 21 Oct 2021 07:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354886E329;
 Wed, 20 Oct 2021 17:07:52 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KG6wnv028957; 
 Wed, 20 Oct 2021 17:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=oO1DIVwNkzAFUpaDE9x7ppsW2H+5gngWzg+1n4IQmAE=;
 b=Zkaw+P5XdyvR01nC5izXmSsh+95oEUBa8XnCfSvsj/0iuZ7/r8DyYhFXLGwFnqAEWy5X
 OyQst23eZvtqW5xTPwSJ/uLn41Q5PXsOr0pE2Ts3/q+JDuU47lfUCkFzOHkSH4qOLBwP
 HHDTz3Hk9lG7lNulzblEqCHtT/j8baNDN4oPejw1RjFt//yWuRdtmexP80fL7TshM0ZU
 NEHBfBwxxuQPT9u92Gt30SbwTK+DaEiJwmeL9UKm3LAeLv8/xRot1VRUnrFfrWpocTVj
 98LPepujRyt2BSP0/UvGERvnUSzYNW6qxR0y8zb0afTMMfAMXwCeiNmsIpdgsmLUiXdf /A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bsrefjj4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 17:07:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19KH7CQ9047702;
 Wed, 20 Oct 2021 17:07:14 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
 by aserp3020.oracle.com with ESMTP id 3bqpj7d491-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 17:07:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPK1ZsoRGSRsLbpEXq8zQowO40cZylx3Af7eCnCg9Ilxw9b6birnphaCYhwfxqpMkWWKpoU9edxy+ictzEEITPxG/+vPstIWUFG9bee1ErpvqY7bJlZQogPYMy8bPx+KrXNVUmxDl1znyZFDdC8lxRAPf2ICImBpHNtuEHwoPRTKKt430im/MwdkQwhTSmAnuoeFE0rdg87agCRbAcxa/xJ6Mq2Dv/mnGFvN36cfDj9MVIsRPIt2cV9yH1X2VA/iwmzh4vAZVErf8LnMApin9wX+ist8fH2YnGc+FtE2Ng4yEBRMHpIdL6yOqPkH693I0hf/Pys1lCBOh5jQE7zYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oO1DIVwNkzAFUpaDE9x7ppsW2H+5gngWzg+1n4IQmAE=;
 b=RuzKkS+/5PpFdXovV5waqBBSeFLzAzIrncVS0gGIglFv9e601S48lpcFzjQVAVe79WDHAP7pWisi1/MnLC0pfNFUmxAjEgDDteH+SVeQidcUA3OIoifyGR1uPdDE3Ma8SpG4wrczV0v7WKisPZKK+Zu2D+OHiVxg7+2a4XHI+sYExXD2aEuRwQFHWHAiz6tAQLd77SoDzv/Sme+Z+Y5uqB3n7Rx1kMTYVeppfYz9KSm4R1WWKMKSS7DbLAGBjXa0rZuWMjh3yX20+UpbKbJLfy4dqye6OAxiQsIL/QVzVlRRCDFOsuBuXXMJ2ecx4GlRQawplhJD5EJBfMyXJLhjBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oO1DIVwNkzAFUpaDE9x7ppsW2H+5gngWzg+1n4IQmAE=;
 b=QctX+pwrzGNCGrt7iARVg9NF0yGXktdvk4vTeujDzqfkUw9aWKFSSoCmti6txybMuVRMPBOVQMYNAHg0iUp98uL/HVJkmfv1HRmZ/12Dkg85RmppQ/8u6reYnkmhmkTiF9p/wpyIggtfJeG4jg9aoeKclq/qS8Qg2P4U433k+dM=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BLAPR10MB5187.namprd10.prod.outlook.com (2603:10b6:208:334::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 17:07:01 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d809:9016:4511:2bc6]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::d809:9016:4511:2bc6%8]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 17:07:00 +0000
Message-ID: <a82a1307-938b-eaf1-cf3d-b9dc76215636@oracle.com>
Date: Wed, 20 Oct 2021 18:06:51 +0100
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Content-Language: en-US
To: Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
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
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <CAPcyv4gmvxi5tpT+xgxPLMPGZiLqKsft_5PzpMQZ-aCvwpbCvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0458.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::14) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
Received: from [10.175.165.191] (138.3.204.63) by
 LO2P265CA0458.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Wed, 20 Oct 2021 17:06:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cb9143d-a7f0-4ff3-8484-08d993ec080e
X-MS-TrafficTypeDiagnostic: BLAPR10MB5187:
X-Microsoft-Antispam-PRVS: <BLAPR10MB518703FE04A9BF53D17158F6BBBE9@BLAPR10MB5187.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mv5bU6tlZDwHWp1pv+wDxD3BOiMkFYPKLqZnOxU0TaJuVVA9bgemuqKMh4jQekd24TORzEniOBG+2EXjqeh/LtBAe1olls9FkO7NU5OhrhENWQBGRsit8aMWe8uRMJljTWHFW/SPlMhKLw6aSbk0wHod6QZPPQR+oyNCv22VQvdTMTJBv2FIDVnYL/LkJTVI/PGKT359P7EqaCHqKl8CBzFkwKm9czoonPQ0e9LTYcWQ9CrBM9V1ogwSYELZ3a62g/FdW7uVa7D89uoEGXgiJZmJeVjOz2AeKdsXRLiQd0Evbbfbhqf1omXE6Pma2DAaVALvghgU3MkNbw2iysUdup/2XJioYabNdoNJQxEHy84le/EmCDON/PSh5pcvifvK3yBSQvm1+49EINALcrLn0vsT1Tsr3gp6g3jWy0WD5QfA0qcIpofMRlUOcmWBygsXI4QYg1vTEs8W6pIX4Ck8bejJbIfG6dGXqSqCBEw1ZYEVTTnCxl+gxRSCynQ8jXxl92JQOMEGCRsfjy59kJsrbfwAOe6FNBh8I5bUh7+CQ2yd8DoCreaHY5Ea7/1ZpumDMfOcUonAEH4V1RUXpTHuLqqrn3XxCDxr99aFP6CAir1Y7aDY42Sclm1auMUkQRB9ipVrmGc45CfxavSXlWbFcyueWEULEv27ct4w941NZV3xIQBAdNHzaS+KNfm3u2TVu7reIbDSYcz9KHHxNTYRgNXzS27yVb3OZk/Eqjk8wMrL+h9cdjzbnHqSEODYTgr4ZYHZFGJedQW7sRUQ33AiwRXTbC7LgXbc+dO6hJ7EFJI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(31696002)(316002)(8676002)(53546011)(2906002)(966005)(6486002)(110136005)(38100700002)(2616005)(16576012)(66556008)(36756003)(4326008)(66476007)(66946007)(31686004)(54906003)(508600001)(8936002)(956004)(86362001)(83380400001)(7416002)(6666004)(5660300002)(26005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGRVRGdTcndjT1RlQUpyYWZVajVPTGZlNFdUc3I1L1NKL2E5UXRZUFJrS3FS?=
 =?utf-8?B?aStpM0RWYkU0anZRVXFRc3V1aUFOUG80UzZtcTR3VlJFVUJ4bU1IK3l1am1E?=
 =?utf-8?B?N2YvUEdmRHVWTWlRcnhQRmdxRVdJQU53TmlHWDhwUXRNdG5sUmZzNmdiZlNF?=
 =?utf-8?B?RnJXanoxT0Y2OVNCL3BXSjhjNE1iamZzTGhMVVE3V0tjeENJTlZYRTN3WEYx?=
 =?utf-8?B?OGZiQ0hKSFpsdU52V0ZZcXpaZWZSU1pPQ2o1eTZIQUJnTkRlK1dUcEFzNHFD?=
 =?utf-8?B?VUs4djJKa3l1YmpvSVVZZ0tIdzE4K0VJS1d3REU3azllZG9FSW9sSTF2SzQ1?=
 =?utf-8?B?RzhJSkNycGxISmc4VTN5ZU4yV1N5a3M3VlVRWVJCMWVnclk5SVdkNDM0dzVr?=
 =?utf-8?B?MEFFaDJHY1E5OXpDcUtMVlpndVY2MWpta2c4bUc2TkprTnE4cDY2NVNtZUE5?=
 =?utf-8?B?UXBVQk5yQmsrQVUwVjdBMWNGVGt5eU9mMUFPaUdUVzdHclNKZW1leXg4dGs2?=
 =?utf-8?B?SzU3V0k4UjRJVE5GUTd5UUR5TGFSVXU2WDErRVc5N253Wlg0MytRalVtbytl?=
 =?utf-8?B?blZoRWF5VzU5UHIyOXRIZy9Pd2Q2aVpNM3d2eFNoejI3R1ZCTnJqbHRpV1By?=
 =?utf-8?B?UmtzSVhVSUdhNWIyUjRyd2lwQ0RoR0YrdWd0bDRvUWc5S3NRdldzZDVFVXJj?=
 =?utf-8?B?UU40QXBNcU5DcFBDTENRNXJpRzJsb0ptcElCcUpBbFdJdDJSa0N5VVJUdjNP?=
 =?utf-8?B?VnQ5NllwVXdqQ1lMRnQzL2t2TFZpaEpLZkJmaTFNWFFCMXJUR0FTNHZqVHVq?=
 =?utf-8?B?SG9NUE0xSDFSTDRJUWgvcFhLeWF2TW9wT3FxTzBKQ2luWHRUMlp2N25tQVhn?=
 =?utf-8?B?NVdsb0NYNHQ0RGFtd3JJandoTlptcXpxTDRtbVVIQU0rTXhybWNCM2ZJSUlP?=
 =?utf-8?B?eXYxU1ZETGZ0Y0t1Q1ViSjJYeVdmQTI1aDA4U1h5bFA3ZWhpMUd4V1ZpbFNP?=
 =?utf-8?B?Sy9CR2NGM0dTN0JwcW9Tc0lwTDNZOFlSUkRvTXZWV09VcXY0STYxV1d0OHg2?=
 =?utf-8?B?dFpuN0J6eTNZNy9qLzJxWmZkL294ODFMMHh3K3kvbkdJV1pUM1BycnpFQzJx?=
 =?utf-8?B?b0NsUXZNVWFQMmZCT2RubnVub1ZnUXc1cHYvSlhZVklIeFprajZrTW9GT21o?=
 =?utf-8?B?NlVCQXJ5bHIrSGdzcTVrVkY3Rm04YThUSU1zSVVxeDduTVpDQkVrR0tuL3BT?=
 =?utf-8?B?NkxCY0ZpVy9Bamsrd0pxYXNqZlBPSUZ0YzlDNFo0TUZCWWJkNmpQVlVHZUsr?=
 =?utf-8?B?MFA1NytuZ09Da0x3U2JhQmNHdWdJNnpBOGJVVTYya2MxY3BnVVVXd2NDVlYy?=
 =?utf-8?B?M0toZGpTTFJRemJUM2tnN2Z4R2pYZEhIWmJneTVtb1dnN3hqbzNXejhRS3FZ?=
 =?utf-8?B?RUFycjRTL0dWZ0NmYzBRejRVbDlCbGRPZzk2NHlrOHVpY2ZUZ0xJVmlkUzVt?=
 =?utf-8?B?MEcvcXpBVVZFYzJmMGpBUnMzeWZSNEJjb3E3ZndnVktSbFpzS0NqODRLRzAv?=
 =?utf-8?B?akw4MFRZZkV0eDRuVHRXNXRRazYzSUtnaVFVNDNUWnpvTTNwVElXdmt3YXgv?=
 =?utf-8?B?d25memN5RGhaS0FMMEYraDNGTEpIYllRU2pyOElNeGZWSmZGMDFRL1dWQ0Q3?=
 =?utf-8?B?WnBPWmRGell5S3lveEFPUEt5R0JmbE5PeHE5bVB0Z20vRjNFRktBbEYrNklB?=
 =?utf-8?Q?GstoFi+ni/ZmuvW9Yl7oOWE667Rs5se4Tc3Q2j5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb9143d-a7f0-4ff3-8484-08d993ec080e
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 17:07:00.8868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: joao.m.martins@oracle.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5187
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10143
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 adultscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110200096
X-Proofpoint-GUID: ID3MOZYN2QsjajfdHnbo0C2eYxXZVz4H
X-Proofpoint-ORIG-GUID: ID3MOZYN2QsjajfdHnbo0C2eYxXZVz4H
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

On 10/19/21 20:21, Dan Williams wrote:
> On Tue, Oct 19, 2021 at 9:02 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>>
>> On Tue, Oct 19, 2021 at 04:13:34PM +0100, Joao Martins wrote:
>>> On 10/19/21 00:06, Jason Gunthorpe wrote:
>>>> On Mon, Oct 18, 2021 at 12:37:30PM -0700, Dan Williams wrote:
>>>>
>>>>>> device-dax uses PUD, along with TTM, they are the only places. I'm not
>>>>>> sure TTM is a real place though.
>>>>>
>>>>> I was setting device-dax aside because it can use Joao's changes to
>>>>> get compound-page support.
>>>>
>>>> Ideally, but that ideas in that patch series have been floating around
>>>> for a long time now..
>>>>
>>> The current status of the series misses a Rb on patches 6,7,10,12-14.
>>> Well, patch 8 too should now drop its tag, considering the latest
>>> discussion.
>>>
>>> If it helps moving things forward I could split my series further into:
>>>
>>> 1) the compound page introduction (patches 1-7) of my aforementioned series
>>> 2) vmemmap deduplication for memory gains (patches 9-14)
>>> 3) gup improvements (patch 8 and gup-slow improvements)
>>
>> I would split it, yes..
>>
>> I think we can see a general consensus that making compound_head/etc
>> work consistently with how THP uses it will provide value and
>> opportunity for optimization going forward.
>>

I'll go do that. Meanwhile, I'll wait a couple days for Dan to review the
dax subsystem patches (6 & 7), or otherwise send them over.

>>> Whats the benefit between preventing longterm at start
>>> versus only after mounting the filesystem? Or is the intended future purpose
>>> to pass more context into an holder potential future callback e.g. nack longterm
>>> pins on a page basis?
>>
>> I understood Dan's remark that the device-dax path allows
>> FOLL_LONGTERM and the FSDAX path does not ?
>>
>> Which, IIRC, today is signaled basd on vma properties and in all cases
>> fast-gup is denied.
> 
> Yeah, I forgot that 7af75561e171 eliminated any possibility of
> longterm-gup-fast for device-dax, let's not disturb that status quo.
> 
I am slightly confused by this comment -- the status quo is what we are
questioning here -- And we talked about changing that in the past too
(thread below), that longterm-gup-fast was an oversight that that commit
was only applicable to fsdax. [Maybe this is just my english confusion]

>>> Maybe we can start by at least not add any flags and just prevent
>>> FOLL_LONGTERM on fsdax -- which I guess was the original purpose of
>>> commit 7af75561e171 ("mm/gup: add FOLL_LONGTERM capability to GUP fast").
>>> This patch (which I can formally send) has a sketch of that (below scissors mark):
>>>
>>> https://lore.kernel.org/linux-mm/6a18179e-65f7-367d-89a9-d5162f10fef0@oracle.com/
>>
>> Yes, basically, whatever test we want for 'deny fast gup foll
>> longterm' is fine.
>>
>> Personally I'd like to see us move toward a set of flag specifying
>> each special behavior and not a collection of types that imply special
>> behaviors.
>>
>> Eg we have at least:
>>  - Block gup fast on foll_longterm
>>  - Capture the refcount ==1 and use the pgmap free hook
>>    (confusingly called page_is_devmap_managed())
>>  - Always use a swap entry
>>  - page->index/mapping are used in the usual file based way?
>>
>> Probably more things..
> 
> Yes, agree with the principle of reducing type-implied special casing.
> 
OK.

Moving from implicit devmap types to pgmap::flags is rather simple fixup.
And I suppose (respectivally) PGMAP_NO_PINF_LONGTERM, PGMAP_MANAGED_FREE_PAGE,
PGMAP_USE_SWAP_ENTRY, etc, etc.

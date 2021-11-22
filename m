Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F171B45916A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A2B89BF5;
	Mon, 22 Nov 2021 15:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C6989BF5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:30:19 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMF5Je9017075; 
 Mon, 22 Nov 2021 15:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=Gqn9dNVLo2IOSZUY0BkHUQiOAEJnCMZnm9ZGqgGDEHM=;
 b=DG5Q4JcAHrmBf0h2ZFmTg0d0eZW9I3+kWkCBPMKEa94QygvOg3yPK+Zs4bhdDNc8ALRg
 N6G3k6nhdPsQaxUoCT0I88M+PcA4ltxX9xv+u2kMfdxoDyuEXldOjgT7MKmzDm0zUMwg
 01el9X6Njc77l2IvK8o+yDqxVzZxVNww6NsC6xLGpdFnCd30b4ZX0zVj5+ig75qhGYv9
 XcBKSIT5SFqVJzcDiz13eRXkJQ6308vJKlchGYanQIA5oZAZuaXDtz+Bg8NXQQhbqHRB
 m8jzGsAnb4+39abEsWIPLhXPiUdeVYoqTH/CX9vhV/j0xpJI9P1Clo9kRrYH5WLcmkUV ZA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg46f2x28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 15:29:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AMFRNMh194838;
 Mon, 22 Nov 2021 15:29:14 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
 by userp3020.oracle.com with ESMTP id 3cfasqumen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 15:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex5+Tlvo/OOTwvI7hnol3mpURGh4PrOP3KNR+/QoS3G93dRw4t64k0uj4IIY6jAiU6iiZ0UrfJAkqYLg1sTWn0j91UMHoZzsaQ+2gwmrPIoJ6qhk+I2lPMygpHxdtiADtVucXIbGvalapdzFiwyoAP9iwu6xrgI6uxNvCdN/SbvRddAFlmzfd5LwFHYEf7G3PiVEsinmpHnYX+n1/XuBiLiRE8x6YCfDO/g0r89GlUGTo8HGq/hw/NbJNJxNcPWVxytSeGk8vpHXQlXcYIavC/3Efn7gji0MIsCGb9ZryhRy40IqW8bGFl6wVaJRG3addBlJHPGhtDZtayFyXrd2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gqn9dNVLo2IOSZUY0BkHUQiOAEJnCMZnm9ZGqgGDEHM=;
 b=eOmWWQ0WO9ZiolTeHl+VR3D5do8U3/tc2l2hTOAvkD547rK5toYqWMHEk+PMkIHmCe1CJVcZBiXgx0zXzrhmrXVCHHvlw8/7d+Gk4NN+w1IRu1xW5xz8Wu0fhQ4SV6m9qa1OP8SX6hDOcNZUvpPRPoqDlm1940pNcQXBQt6EjCc4zJ8ECYkc6nC7adS1IsKBIBLaDCEGRv7UHmG84iJmtTxbzeBcMwpehOjs1MixwCRYqZtK18NIm8rtIo9sa1X56AXqEtllYA2tU7p8ZM52Zc3/r7N3aW1xRIcpqnBGDxZYmDsRSA+l5mFoL6nnHfYr4dfgHuWvQ/RaTUnZWVMtbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gqn9dNVLo2IOSZUY0BkHUQiOAEJnCMZnm9ZGqgGDEHM=;
 b=V+8Wh2Yyh6H3mO9ub/qDoBYbmKZfbJZRSLmhNwFQks9bRNElIWPoUbBwZajgN1GtU/+pbpwC68ZDTwfy2bauNQRwTyJqAca/qCYcXL6ySRuraIctLZaFAxKbNMWu8uhRM3dhruv4NdwVtWT7HT1Auda2LqkMFIlv+S2vE1dctyI=
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN7PR10MB2625.namprd10.prod.outlook.com (2603:10b6:406:c4::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 15:29:11 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%4]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 15:29:11 +0000
Message-ID: <706003ee-62ca-17a1-f629-6bc010aa5d49@oracle.com>
Date: Mon, 22 Nov 2021 10:29:05 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid divide
 by zero
Content-Language: en-CA
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com> <YZdxFvGkBPXrtoQ7@phenom.ffwll.local>
 <YZd2VI820CUGrMjv@intel.com> <YZd8tpDN9lsq0ZbZ@phenom.ffwll.local>
 <87a6i0jk8r.fsf@intel.com>
From: George Kennedy <george.kennedy@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <87a6i0jk8r.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::30) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from [10.39.246.5] (138.3.201.5) by
 BYAPR07CA0017.namprd07.prod.outlook.com (2603:10b6:a02:bc::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 15:29:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1156b2f4-1427-44d8-363f-08d9adccd51c
X-MS-TrafficTypeDiagnostic: BN7PR10MB2625:
X-Microsoft-Antispam-PRVS: <BN7PR10MB262586C7561FA831E15C4925E69F9@BN7PR10MB2625.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a+K3/lMEb7XVj5Ynw0ppXtRi+r8ca+g0ZOau3oO+0nLaM0MEd1CnKBfd3EdocyBzu4WEwZK/juZiPT9UFo33yP38Dweh97n2OSRPUUFNnnyVdRNJmKR36H6OVppuZ2eMeBCRaKTomVPdwybZiELCLyy/EU4ketrjqe2AhFNlVcbZ/uneuFnaI4WWbZgGh4/NrzljItG9h1GUYtNLgfQ+zvzcVrrDT4JvbvUPJhu5bAvG0hbqapJ+042XQdhWSsqyjj1HnVh18QosZQqsvh4W3Drc0tR9z1JesOCWfulWUtTxJPCF5wyDzAMaePYPV1G/vV1GlQFaLYmV0DWxywMwwtiVnhIhmXmRwsPevumBOvvmfIMVhrGgTDFM6nB9Joo7FRwFrRqrKS9ElyBZPxltvf9/TzgSQAdzgE9ycVX3402/NbNS9e+dwnBdMKq6q3unx3wjQDZuykc2YyY5a2TG0au8e2MnccfztI3m2xw6hrSCge/5VTejpbIsmgNNWMICDimPHJsfRW/+acu77CMY4OlYHevwd9gtrAlcgmpxZOCOqejxTjUnt6j+rukddIy8vrz8B21YGIpiX0a37DddeexOD4YWLO0o4aCinUzt6ged1uolLWbMAjgQ+3kwGUBSjkiW5IC8lSBQO2NjFjRtzawra2nRiIsZz1Gi7VjRyjXWJG5fLJ/4iAHm2Lr5CcJ649xgrw9co23xU2SaebDuzkT78cDG0/6IDwaUd8Ruzro=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(2616005)(956004)(186003)(36916002)(26005)(31686004)(5660300002)(36756003)(38100700002)(86362001)(44832011)(66476007)(53546011)(16576012)(4326008)(66556008)(6486002)(2906002)(83380400001)(316002)(8676002)(110136005)(8936002)(66574015)(508600001)(66946007)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFNrVFA0aEVSYlQrYkxPNUVHVXhVNzVZRldMNWhITlRZUS80R0FEbzUrQWwz?=
 =?utf-8?B?MFVUSTA3dmFCOTJORW0yaTZwOHkwTC9kVFRFZGx2a3BNNmNiSEVHcUJUS0dM?=
 =?utf-8?B?YjZla2NhQzNPT2NrWE1sRkNVT2J6dU9HSE1RSCt1bEF1L2dhTkc3YWhaOGQr?=
 =?utf-8?B?NUxXcXFOWi9qVnBiNlJOY1FERkFTc0lFeGNTbzVzdERiZVRybkc0WEJ0cTBr?=
 =?utf-8?B?OFBxbEt0Zk15QVdwNWVaK0R6TS9tWEZyanF2cW1PRVVHaThtcUFOR0tqUitL?=
 =?utf-8?B?OWdBSnBlZFhMdjZzNG5HYmR1M2pQby9kVXlpU1JkaTU0b2l1Q2h2NEJSYTN5?=
 =?utf-8?B?WmxGTG5EK21wVmpsZm5PbmFDSHllTmhSa0dnUG8rdjJ5Z2krdGxaWHM5NC9x?=
 =?utf-8?B?a2RDM3p3bSthdVJVbDY4em42allENUtoQi8zaUZwaUhqTkF5RXJPQXFKREM2?=
 =?utf-8?B?ZHlHWUdVbWFyR3h4Mml2cm9EZzlRNDdjb1d5VHdFNk5mbUNJRnBJUXlBWWlR?=
 =?utf-8?B?TUZxS3U1SW5TS1dGRVpIRDZRUmxCN3VMM0k5bjEwN1gvMkJyc2pVei9sdy9M?=
 =?utf-8?B?QkFqQ2R3RVQ0RXg0N3gvVU1jZitVT0k2ZWFRN2R5NWs4SlQ3SG9hYlludmJS?=
 =?utf-8?B?S0ZjRlFVVDBxNktLeVZ4NkJiOWR4SXNzNXdjSWV0cStDeWlJbFhsSzFmKzlj?=
 =?utf-8?B?M0lUdm9NbFBYbkpkdG5xRVFsSE5PN0kvTDZRVENWNUZ5dDdjL1dnRnNocklT?=
 =?utf-8?B?RmsxVWRSYjN0aWVHYzFMVks4TG55VHp0cG12ZUFwVmN2OWV3Rjdoa0JDbmpX?=
 =?utf-8?B?WFNiMDVIL3Nja0xMcjBHR1lxQ3UyZGs2RTQ4ZUZzcVdKUEpnVFc1YkM1Qkg2?=
 =?utf-8?B?MkpUWDRaVDNWM2JQMEIxVkgrK3FMaDVSWEhnU1FTMnQ5SVk3WFV3MEs5M3px?=
 =?utf-8?B?YmFQWDRTSUVybHZPMVcyNDVHSldZQ1ZmR0xPb210VEI1TWdBc2luMEk4WkQw?=
 =?utf-8?B?bUJPUTF0SXlxaGhYR2dMVmxyWk5jay8yemN4ZnhqM1JqNDk4MWhlazFnUGgv?=
 =?utf-8?B?UkMwRSt4eDkxK080UGJMblVnd2FwTDlJM3I3UnRrMng1SzNENVB3cW5FczFX?=
 =?utf-8?B?ZW1FN0xXdDJuY0tMS3RXR3RxNDAxUWlKdm85YWxmMHZmODNzdGorTFRidVZ5?=
 =?utf-8?B?eDNxTkZrdVZxMWtzYTJaWUwvL2tURmEyc04xZVhaU2N5T0NCNDdmU1dGNXJF?=
 =?utf-8?B?bXA3djFlS0JmTTQ1cjc0bjFoTnpjek94QUpOREdhVkMrWmx6ZEwxVVpKa2Fn?=
 =?utf-8?B?djYyUE8yOWdYOFZ5dXIrb1hPS2R4ell1cFc1eHo0UVRVbDZ5UGZCQkJkek5w?=
 =?utf-8?B?MTBkZFFZSyt1aXNFRzVWOVdvWUdVOUIzVFAvaXRpRzZpUWdMYkJlRUZRZzAz?=
 =?utf-8?B?eW5OcUN2Z25mbnNmMXNqUXFXb051U01tQmxwdnI3S0diYjNDTm1HVzhnRUFV?=
 =?utf-8?B?bHJKYnBsa0M4Q3pyYis2d3o4QlZxTE14VWpMOXowL2NnZ2lWTWZOKysrTjQ4?=
 =?utf-8?B?MkhwWUFPSGl1bUFMSHRsdnBUTkdoQUoxcmIyZGJPemVJeW1zK1M3ZUlPU3pP?=
 =?utf-8?B?Wml3SWVEM2toUGpPNTFhUUpaOHdKQW03SkdlS3A0ZFVXTk5Ibnc3Z2diVFAr?=
 =?utf-8?B?TmJwSDdlRTVTWElFRGZnZ0xFWU8zay9DN2QrWnpTaWlwQUlTd3V1R1lPY3g5?=
 =?utf-8?B?cXRlUWVoaW5rVTJIV0F2dldqOGZKOCtoamdTM05PM1RBV2pYaVFydFhWSURn?=
 =?utf-8?B?eElKL0o0dXc2R2ZMNjgxY0dGUmNxN09BVy84RFUrSC84MGREdStDSmhFVloz?=
 =?utf-8?B?alNRTTJKVUVjSm1pcnhIaFcrODlmNWxkNU5FSnhqeHp4dGxSUmJ3WmZvdzJG?=
 =?utf-8?B?ZkpPcXVRNVRzV2tKN2piN0lld0I4S2xMYUFINnJsSE9uVnprdys3dHdxR29w?=
 =?utf-8?B?QWUxRDhDcGdNdHFVOFR1VnVVZCtBWmdFMndRRFN4a01OTlJUY0RJOTJoY012?=
 =?utf-8?B?dDdoZHZQZmJKUE9MREVvV2U2K0NoM09zK0Y5VGU5aTlOOTVWVXh4TDhOWmlD?=
 =?utf-8?B?ZTdzQmxLcEFiajlEMm1NTU5aSGtKYmpxSnBDcWdoZElWdWVkSVlSWUdsY3Jy?=
 =?utf-8?B?UlNsd3VWN0tEUTJSQ0JzNjZpUlFSTEthckUrQ1hhWElMRTZsSXNBa1YwSUdG?=
 =?utf-8?B?SE5uUENqWUtBZCtxbUp3c3NwS0pRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1156b2f4-1427-44d8-363f-08d9adccd51c
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 15:29:11.3221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeyNmvo7rUYHvxjAStQ46OGU2cFvjcHQXAm/sWdf18Tjs+q61L66ycivkQKnFU/7phlGNnbyFDIFIp1jyQbKJ9CambK8nPCedpxJqCyrtb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2625
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220081
X-Proofpoint-GUID: dljDLAXR5hXPQcuyyc2AcDVnpsEkw3Ms
X-Proofpoint-ORIG-GUID: dljDLAXR5hXPQcuyyc2AcDVnpsEkw3Ms
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/19/2021 9:25 AM, Jani Nikula wrote:
> On Fri, 19 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Fri, Nov 19, 2021 at 12:03:00PM +0200, Ville Syrjälä wrote:
>>> On Fri, Nov 19, 2021 at 10:40:38AM +0100, Daniel Vetter wrote:
>>>> On Thu, Oct 28, 2021 at 05:04:19PM +0300, Ville Syrjälä wrote:
>>>>> On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
>>>>>> Do a sanity check on struct drm_format_info hsub and vsub values to
>>>>>> avoid divide by zero.
>>>>>>
>>>>>> Syzkaller reported a divide error in framebuffer_check() when the
>>>>>> DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
>>>>>> the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
>>>>>> the DRM_FORMAT_Q410 pixel_pattern has ".hsub = 0" and ".vsub = 0".
>>>>>> fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
>>>>>> vsub as a divisor. These divisors need to be sanity checked for
>>>>>> zero before use.
>>>>>>
>>>>>> divide error: 0000 [#1] SMP KASAN NOPTI
>>>>>> CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syzk #1
>>>>>> Hardware name: Red Hat KVM, BIOS 1.13.0-2
>>>>>> RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 [inline]
>>>>>> RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
>>>>>> drivers/gpu/drm/drm_framebuffer.c:317
>>>>>>
>>>>>> Call Trace:
>>>>>>   drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
>>>>>>   drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c:391
>>>>>>   drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
>>>>>>   drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
>>>>>>   vfs_ioctl fs/ioctl.c:51 [inline]
>>>>>>   __do_sys_ioctl fs/ioctl.c:874 [inline]
>>>>>>   __se_sys_ioctl fs/ioctl.c:860 [inline]
>>>>>>   __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
>>>>>>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>>>>>>   do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
>>>>>>   entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>>
>>>>>> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
>>>>>>   1 file changed, 10 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
>>>>>> index 07f5abc..a146e4b 100644
>>>>>> --- a/drivers/gpu/drm/drm_framebuffer.c
>>>>>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>>>>>> @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_device *dev,
>>>>>>   	/* now let the driver pick its own format info */
>>>>>>   	info = drm_get_format_info(dev, r);
>>>>>>   
>>>>>> +	if (info->hsub == 0) {
>>>>>> +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", info->hsub);
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>>> +
>>>>>> +	if (info->vsub == 0) {
>>>>>> +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", info->vsub);
>>>>>> +		return -EINVAL;
>>>>>> +	}
>>>>> Looks like duct tape to me. I think we need to either fix those formats
>>>>> to have valid format info, or just revert the whole patch that added such
>>>>> broken things.
>>>> Yeah maybe even a compile-time check of the format table(s) to validate
>>>> them properly and scream ... Or at least a selftest.
>>> I really wish C had (even very limited) compile time evaluation
>>> so one could actually loop over arrays like at compile time to
>>> check each element. As it stands you either have to check each
>>> array element by hand, or you do some cpp macro horrors to
>>> pretend you're iterating the array.
>> Python preprocess or so seems to be the usual answer, and that then just
>> generates the C table after it's all checked.
>>
>> Or a post-processor which fishes the table out from the .o (or just links
>> against it).
>>
>> But yeah doing this in cpp isn't going to work, aside from it'd be really
>> ugly.
> Kbuild does have support for hostprogs which are typically used in the
> build. The obvious idea is to use that for code generation, but it would
> also be interesting to see how that could be used for compile-time
> evaluation of sorts. Kind of like compile-time selftests? And, of
> course, how badly that would be frowned upon.
>
> git grep says there are only four hostprogs users in drivers/, so it
> certainly isn't a popularity contest winner. (One of them is
> "mkregtable" in radeon.)

So, can someone suggest a fix? A cpp type of approach does not seem 
feasible.

Adding the sanity checks that are in the patch, which are similar to the 
sanity checks preceding them in framebuffer_check(), along with a 
self-test that ran through all the table entries, might address all the 
concerns brought up in this thread.

Thank you,
George
>
>
> BR,
> Jani.
>


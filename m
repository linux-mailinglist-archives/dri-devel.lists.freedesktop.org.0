Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C149322004
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 20:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7566B6E1B5;
	Mon, 22 Feb 2021 19:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3F16E108;
 Mon, 22 Feb 2021 19:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdJx2w99RyZFuMomFy4bmsYgaVcnCBqI9lft2chc2KzUaEf211fOTDWm6a92lXa798R+cemrbHZAInLC1HWRrS+ErW3eKglQJtuWK9l3FUU1KYbyldK6cySBBzHOJUZI1Z7yazXRvGMofFhxlcVOj4gwSvrvY8RZQ0c9wZyNardTB0bbN8nWVo5a30oJgSZ5ukfoOpJJ+Ij3uvNCGMz/8yMyOAB4Ue06olvXLpIDJdFXUFtoO5esyK/J7LmQ/CRU5nxP5aPluE0HM6M+RTAn5Tj9/nM39rY8bIW/DOCcrb3HUtFrO5n1nHdIPZHXxkR/8llReiND7g/TmMPppsYE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3YBkWdxHVIDIvNfUhcYEl60aJBEsrRtbqZXMkR73Rk=;
 b=PbU2aC+rWoS3y+w3/yQ8+Wc1vY2YkNJQMsIl6yaChLQ3vc0HPLh0/2Sgjq+0F1vkJwaP08aQwe2yVnJCUgF3nLg18PcrxmTeJoQuNO5mast5kBazZYRg1Z2SxxJtU5v4yUAotHD7P6p156gCCLTYEMHXnKwZIP8CWA9Ly356EhxB6w+M1NUUCFMq9HUSdG5q2r4iqF6swaAtXwbzYWRx8tNrTmZkbDUSL33WfUyfhketVXsnmc/xe/19zWCgr+WZopblkjCpNs+nPBnZzFnwIVn22B86ZjLwNdMX4Ujw66rsyo/vG/I/18sqFTg2Jf6R4Axf7LwZnmzZLGPdtcNBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3YBkWdxHVIDIvNfUhcYEl60aJBEsrRtbqZXMkR73Rk=;
 b=XBVltpEm7Phl+xl+ZkzKjSrm7y2j37YK1Q/CV6icUJRqAqzbCQEryTvvEzaSA3ZyaoRi33aXwsVES/+RqsdQVmiCXo30GMEkm6bA/f8OLE792quy3NVWz5cmhvnENyyiuK/UMTZLsw7YkyLKfxi3enru8ndzDjB0uTBvICbYgCg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (2603:10b6:a03:ae::10)
 by BY5PR12MB4968.namprd12.prod.outlook.com (2603:10b6:a03:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Mon, 22 Feb
 2021 19:25:03 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f073:f3ea:6ce8:1956]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::f073:f3ea:6ce8:1956%4]) with mapi id 15.20.3825.040; Mon, 22 Feb 2021
 19:25:03 +0000
Subject: Re: [PATCH] drm/amdgpu: stream's id should reduced after stream
 destruct
To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com
References: <20210220063038.1790398-1-zhangzhijie@loongson.cn>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <cc528ba3-490d-dc19-16d4-43c27a6af203@amd.com>
Date: Mon, 22 Feb 2021 14:24:59 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210220063038.1790398-1-zhangzhijie@loongson.cn>
Content-Language: en-US
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31 via Frontend
 Transport; Mon, 22 Feb 2021 19:25:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c65e949c-5bf7-43e7-91e9-08d8d7678d63
X-MS-TrafficTypeDiagnostic: BY5PR12MB4968:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB49685865BD9E7ADAD96CD43CEC819@BY5PR12MB4968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpJoo1PfL79myrU+O6bwx/20lt/LmEqPPA5TCUznbmebhsAJyejxNVVrTtJ/TuJZvIQ6NU4CtsqP3lo+191kHIIBs8gqNjqIxbWlKtLZY+fYFhXrMOvVQ9iNrzbAyVsXLGDFOPiSGVZ62Rj3Ej3VIh5XgQJ4eKebPsZvC7A/mTPC2RTI3kXkTVGr/ifw0ZiFIB0yTYj6xl6qh0mKCVEb0ypFeHvs98MAQMdH0SQnJGRErn+3qIzJUGWwU+pHab3zuW9/wD0dY1gDEOJEfEJdmmDCZ01x8lQjYtKF8cQgH9WB8FCEv/x9j3QB264d7946GsnrmGrPxruwA4cakEljQVCKI35Uk35X+f66ckfhwOrTawAiNUkj8rVRyAnEDI7T6B60pvsdaLAifCdviauww9JxOCtlWBzw79Vpb12brRMVKpeQHw3vb30PfhO0uOl7X+zneZoPF4URtBcUFHGZ480uBJKt/dhB1Y0fcYR1s4hqacYrRMX6Xny7tIT8funDpbwTmrWxzHn+ZjWLQnT7xsFPlwZ3Ev5Sq0grb4ipkJCk24zJAzc+wfeDXb1hzSU01gkN9RIna+jevr9tfQ97bkZEhiZYUxDxJJ/Og5GwsG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(186003)(16526019)(8676002)(478600001)(4744005)(5660300002)(316002)(4326008)(8936002)(2616005)(16576012)(66556008)(66476007)(26005)(53546011)(66946007)(6486002)(956004)(86362001)(31696002)(36756003)(31686004)(6636002)(52116002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RWYrcU5SYVRDRlpwUWtjTUJrMFlRb0hHdHNzN08vTGJXdUtkZ1hFaFM5UjVP?=
 =?utf-8?B?d3RiL2YzYWVCVWYyeHJIdTZ6QXg3R1NrdjZYUCtHNTU1RCs5S294RHc2TkF5?=
 =?utf-8?B?L2t2cktpcDJvbUdDTWllODhmenVld3R3eWEvaVpzanlLMHZCQWI2NXBJdjNZ?=
 =?utf-8?B?bkU3U0haek52bkNGUUxrWkFzNlNOdmEremptSGFKQmQ3T1VEK1VlN24yTmtT?=
 =?utf-8?B?bHVNSDdaOFF2MXNXQ0tlYmNMKy9hNnNIYW5xdVAweVlFaVlrS05Lb1BZUU5i?=
 =?utf-8?B?ZFo0aEdZb2QwMktnNklaa2hnajJnQTZQckROTit0WHNxdkVtNDloMTJLZXUz?=
 =?utf-8?B?VXNmbkZweWk3Q3VCNGlSdk1SOFdlNStCeGhUbWlrYjVoRzkxNDVERjBCU3dN?=
 =?utf-8?B?L3BNUlRDU0VudmpndjU2SUZ1N3RETEFId05lN0NjOUtaeS9EUEw4WCtZWUND?=
 =?utf-8?B?M3BMS0pVY3FSb2UwQU1abStuOUtuMCsvMnA2aUZWMzA4VXJoSGxYYkVRenFV?=
 =?utf-8?B?eEdreEMwN3hCb1g1cnRvRVJqZzdDTHZSeDdVREdDdlo1a0NiVC85V0RHYkkz?=
 =?utf-8?B?WXJGYXVlS3JYOHI3UFNIVFpoUzNVY2tLU01pZDNGTHI5ckFzNTV2Y0xmY3VO?=
 =?utf-8?B?MTBOT2tFb2RHS09zYzdHbnM5UkFKdnpqMStjVkNPem9IMnZ3bklScUVyNURh?=
 =?utf-8?B?a2tXc25wVE5mQXc3RUdVd2ZYOEQyc2VXV0tZVUJRTkw0WTIxVTdnTDc3UERw?=
 =?utf-8?B?N0Rqc0laWTJCa054TngyaVBmejBqZytkMERtUVVCeXJSdjdIblZUb041bFhj?=
 =?utf-8?B?ekI4WFcyRXhWMVFFQndPMFpHZjZmNU0zUFMrRXZZTlVpM3NLZUJQVjBsMFlO?=
 =?utf-8?B?RTdvMC92TWhzK0sxbGcrdGhiOHlXa0lxZEpJTWttdCs2d0ZTSHBpSFF0OXRI?=
 =?utf-8?B?ZVlpSC9LSkN1SHkyNksvTC9lOHRWa3B4ckE1dDlQbGFPY2JQNkYwdXlpN25x?=
 =?utf-8?B?TktwMk81VUU4dzhqK2RyRndHZlFBeWd6ZExrUHo2dTJuVUFGeFBOQUtBaE5O?=
 =?utf-8?B?bWF4SmR4ZkQzUkpqeHBwbUl5eVdheDhtYkdqTFVUcUxpdHpiNFhjb1YvTmMx?=
 =?utf-8?B?SitaVWVpRE90V3RuNkkzSHZuUzE3eC9WRmtnZC9zYWVhYnZHT2I1R29NajNl?=
 =?utf-8?B?Z2srbXp5bzcvQmZxMlJIenA4MVlaVGNXbDU3dGNEZWdzVFhiQjJUbzdJWHNW?=
 =?utf-8?B?OG0xamw4MkxhSXVqYzZEcEFBWkZ6VzJDM0dlMG1LUlg5UFNRNW1zZUlwZ2ha?=
 =?utf-8?B?ZFdPN1d0aXQ2K045ajhVQzNueEVWbUNvZ1Jlcmt3U2Nob1NSd3RZdnhEZkZV?=
 =?utf-8?B?SXdlb1U2bUdZU3pKYWJaME0wZDZESU9tMy9nMTNxNUVqcjZyQTE2Mm9Na29q?=
 =?utf-8?B?VDVGMlh2T084Q3ZONzI0WjVicnJMSVl2UG1Gb0FmY1FXNWZIeVJ6S1lFaWQw?=
 =?utf-8?B?a2VXZHU5Z29UbzlCcnJqMWJUSnNLWW5ITkM3YWZuRnNEQ1dwczk5M1Y0QzFi?=
 =?utf-8?B?Zkg3YnBUWVZvd0dQZDNxS2xjK0pVamxndzlpMHpHczBSRFdEK1pTV25na01H?=
 =?utf-8?B?WVRqNm1iaEFCMWp2NTZaTStnckU1UE0vVlU4cFUxY1dTMDhUU0hrRXArb3U1?=
 =?utf-8?B?dVRXM21vS1lMQ21Sd0NLQWRlRm1VN2R5Wk1QT0preHJCQ3JZcFVRck5paURV?=
 =?utf-8?Q?qQf6LDpurC1cx7OX+3+ScBO7XdHW5E8+ZKSoWSm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65e949c-5bf7-43e7-91e9-08d8d7678d63
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 19:25:02.9639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy4DxL61Y/3S1Paq0GVvUzjV1+KVcGUjH2VWRMcxStEdZtkoGRdGOl/lSZbqkUJiqEorjXK7mliu0+XR4XD+0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4968
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
Cc: mchehab+huawei@kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-20 1:30 a.m., ZhiJie.Zhang wrote:
> Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index c103f858375d..dc7b7e57a86c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -137,6 +137,8 @@ static void dc_stream_destruct(struct dc_stream_state *stream)
>   		dc_transfer_func_release(stream->out_transfer_func);
>   		stream->out_transfer_func = NULL;
>   	}
> +
> +	stream->ctx->dc_stream_id_count--;

This is supposed to be a unique identifier so we shouldn't be reusing 
any old ID when creating a new stream.

Regards,
Nicholas Kazlauskas

>   }
>   
>   void dc_stream_retain(struct dc_stream_state *stream)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

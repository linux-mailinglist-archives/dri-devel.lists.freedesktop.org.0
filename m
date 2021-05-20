Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50338A48D
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 12:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411866F3AE;
	Thu, 20 May 2021 10:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 740 seconds by postgrey-1.36 at gabe;
 Thu, 20 May 2021 10:04:58 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B296F3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 10:04:58 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14K9mDWb020665; Thu, 20 May 2021 09:52:28 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
 by mx0a-0064b401.pphosted.com with ESMTP id 38muc710vc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 09:52:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWRL0cOg4jiwAaeNI2MSQ3qcIw+/YysbJnjANr4v5gU7+RVSlctz7dcWLZdoELRtRCx/tqr8t4rUhzQAy0igyGSwKn7JqapE581i9y0Z2f455u4BsEnuUk+PYt9U605OwbP+GNO9qtuuRLVtTvZuTJ7tGmT1MufSGPAQNeQlYRg8dIEIbyfrl5CwwQOFsj+/ffGyMtYK3dBdM+nO404dck8WXWkuWuN3uP5QfNJ/ZdsByLWBuRONO7TVsps1rQy1DEncwuUoTsdofhuiQu4qcjpaahzBs4528nCMn3bA0Ar9KZ19o9j0TjRFRhLwev7xr7wVrG+9y3qhSm1+n74FiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PyXcGGuQcSkYSC6hGQTS+9V2rXb/nkKAgsRrv2IuPQ=;
 b=ivCDBTyihY3/H4Gs6nnYIMMRg+jG1HGE3YPHc4qECD5FZh80UYYNAV0SRyocTt6js6mIG9Dgs8DiHDhj8xuYRgbM+DpewSSTKf3W7rJ6Jp1PszrsN3Y9kBeZ4zwIMgcB6w+A5j5Tu6rGkEOaBkFfp74d7nlBDSa+2KVoSiA69ioTXq7ALpgOk9kWfMx9MceztgkM45tXpzzO/438ZEYoTpyhMFpCxzznphOtqGUAHEMQ7OPkUy8fdPEAIagzwFW/OUE777ZrCtxLcd2UFqnlP+jLmWBPFK6YhfQ9d/3sUIzFOkyRelXfyEWcr29lp10OJunjxvsZ21UDsrPkkIkmBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PyXcGGuQcSkYSC6hGQTS+9V2rXb/nkKAgsRrv2IuPQ=;
 b=JEgqjkBEeG3NpgPFkrFlRQlE/Q+sVzl5b+PreIhixO7WS31JGAPMVnYqvM2zSldeCf9Ec3Hl3JyGSmnaY15r4ZrVGrYC+FAtuRHpid0c4VRwal5R3+Xnmq+7VAuTJmzxWNA7neVrXSSkFP8uxA5keXM2mBwj2c3vwBTPRvsFvrI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB1463.namprd11.prod.outlook.com (2603:10b6:910:3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 09:52:25 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::cccf:6e19:b547:da8b%6]) with mapi id 15.20.4129.032; Thu, 20 May 2021
 09:52:25 +0000
Subject: Re: [V2][PATCH 1/2] drm: xlnx: add is_layer_vid() to simplify the code
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210518095019.3855369-1-quanyang.wang@windriver.com>
 <20210518095019.3855369-2-quanyang.wang@windriver.com>
 <YKYt1h54NbZrVe02@pendragon.ideasonboard.com>
From: "quanyang.wang" <quanyang.wang@windriver.com>
Message-ID: <d40b9620-32f3-9556-f243-b62f3bd9542c@windriver.com>
Date: Thu, 20 May 2021 17:50:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YKYt1h54NbZrVe02@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::31) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.199] (60.247.85.82) by
 SJ0PR05CA0056.namprd05.prod.outlook.com (2603:10b6:a03:33f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend
 Transport; Thu, 20 May 2021 09:52:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8e37b4d-d4bf-4d86-ef35-08d91b74f8c6
X-MS-TrafficTypeDiagnostic: CY4PR11MB1463:
X-Microsoft-Antispam-PRVS: <CY4PR11MB1463C3507AF92FCAA07DCB3EF02A9@CY4PR11MB1463.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EozqwxsRhVI3NOEW87J9AV10UHrihYIoe56T7iQNsgwZJBZl20zdtq4tAdh32haetdTu1A3/g9O/nltxWGOfpb2tzD5yq8cMnVh3oVSjldK/Eqm53uykMr+y3riHQ6MpJl9GvG3l1F+xaLBW8XTBU06mOl+9SVzGVpKjCDhLAH+BHu/kPfscawHDb8MiXdiWuw6iGfeZcu8UOBxvqEktGaiPmobGNW7AQIRDu/oQmG3JV0g23h2+iw7xSF2eGWRY8fKvt/UT5mP8tTcJwNlO6eAbvrYY2dpcyPJpc/PN1o423jK13WXLV3LxJG57R7fNFhPvCsvUAsoc33ELojnjqZAOvKgdfbze81a3g7VviWxYxlrc4HOWAgkHvh0RQT1Ey8V6bC4idSU+oRvw0QbB13AH9un+f7BwatKDkFoJ+YeEcxo3uaNKfVamfX+/WQLuLHzdTAfwdPlfsH0Y0yXI87oX72HsEd6gIsogXDEK/1mn4HWV8OHGy4u99zkuJR4uq724xVrmPiHwbr4OQHa0WArYO9eIilkPl7+eFidVSpE+obMtfVpMURFDjeYDaA8d59hY+0rvtrHHg7L/N66+E/CdQ8c1MbIs18EH4dQP7R5zFB3yMEUOgSd2kYgJvPJ+LXlwiBNVt3duKKbIMDtB7IV4W5eemCPz5xjJDcX9PBM2uU+tPeBEFrsG3pPBkKVCG2R2m5V2KSC/2oq2c7XYALj5H+GsBOX/ncsaO+QNzR+Ch/TDsgnu8ryRfmLHkMUT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39850400004)(36756003)(5660300002)(66556008)(478600001)(8936002)(66946007)(54906003)(31686004)(66476007)(2906002)(86362001)(956004)(26005)(83380400001)(53546011)(2616005)(6666004)(16526019)(52116002)(38100700002)(6916009)(186003)(6706004)(38350700002)(316002)(16576012)(31696002)(6486002)(4326008)(8676002)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3ZVTUNpamFlVTJlNHJtck85R1pHMmhCalRDWmRCZzA1OTM5L243eUlNZHA0?=
 =?utf-8?B?eW04YXpNcVUwUGdCSlcxdTF5b2I4Y0IxWHlCUFI4ZDAzMmh0endja3h2Ukt0?=
 =?utf-8?B?UktTTmhsNHdROEk2NkFPanYrVTlqYytwa3FSbUl2SEVzV3JQdHJObXg2OVlR?=
 =?utf-8?B?RUdlaXc4VnE3TlhyOHVCc0d5aGdHd2c1K05kUWhKWmhHSGU5cS91TzZOVEdy?=
 =?utf-8?B?RUVubnY5b29ObEpCeWU3UTZTdmUyK0wxY2ZDUlpHQzdvSXJXdEpvZkw4R1Zs?=
 =?utf-8?B?anlrQzdkZUd0aE8wMDNFREFXaFlvZDMvM1k5VGNRa0ZGalJSYkp1Ly9HMXZv?=
 =?utf-8?B?ek1lRTZFMjJQVFo0OFR4aTNMZWFFNEkwaURKY3hzZ2hnQUsvaHRZNHVnNmVK?=
 =?utf-8?B?TlJhcklDcUV6dnVlb09iYWdVZ0lOMlRBejBnRFZGdGJNcG5pVXorakt5RERH?=
 =?utf-8?B?MEFTZmNqTnNUeWxwbHJsNm05K1laMWhwWjhIV1gwMTh4MTc3ZEhROGZKYk9z?=
 =?utf-8?B?Y3VEVTNwNFg5UDYvWC8yMnpYZ3VUaXNXUWZ2M0hHajRIR2dKNXoyVERmU1hx?=
 =?utf-8?B?djN5K2YrWmRPanJISk05RThrVEl0NEdXWVZ5eW5EUjI5RXdlNnorVHVnMjlC?=
 =?utf-8?B?cU8wbTZ5bWpOR3dOOW1IeHFxeGNrUHhGQzBWaGtLZzBSbDA5YXJvTGNmNHUr?=
 =?utf-8?B?M3h6bWl4L05LcTlPOGFJaTNNRUtvK3EyRzlGSm9iV1UxSXdma2tuSHFJOWRi?=
 =?utf-8?B?VVNyZTRycTZpZUFPaWVzSnFXbndyb2hvWnlTUFEzblRPeTYvOHROMlJMdXhJ?=
 =?utf-8?B?aE81Z0xhUVNvTDZKSmptcEE3cjErZDlFZlE1MG5TMDRjQkRUbXNLak1zKytI?=
 =?utf-8?B?bC91VWkwc20zRjhnVnZUTkZnSFNUZHp5b1dib3hZc2NUZ1VmNXFwcUJibmVo?=
 =?utf-8?B?TUttRHkyS3ZuS3dwcGM3V1NWWVY0cnBuQzNjY0xrdUFXTG95QVBySm9UNjAx?=
 =?utf-8?B?RzM4MWt2ay9xNWl0akdENVQwMktBNFpIWVJSSzlMKzZPSm9ZZjkxS3FheVpL?=
 =?utf-8?B?dXhuL3F1dnRRYmMyeWllZnFxbjJmWVZCSVpEMEl3ZVMvSTBnWXprS21MWnNQ?=
 =?utf-8?B?ckE5bGlJbytnUnlNdE1tSFViYkFtWC9Pd1Ura3NtY0ltbTFBYmJkYVBpV2xp?=
 =?utf-8?B?NUJzV3JqRUZIYzBFRlFvNUVnWktFVUNCTk14YVd3OGQydHpSWXRDclZwYnRp?=
 =?utf-8?B?Ky8vSS9qem8ybUw0WmVlZnpubFI3YUxrZnZOanhjZ1FZbVRLeVVyb0NqWmJq?=
 =?utf-8?B?UnlwNSthMUZRczgyRklJUlBPcUtnMU15UVRMNCtrMUlJR1UyWlJXLys4YWJX?=
 =?utf-8?B?NVVmQmo3cU83ZXlsVnk4Nm5kN3FhQUE5L2Y3ZVBEMGF2akY2bC84YUtiV3NX?=
 =?utf-8?B?WWFIOTNHWmdqWFVoNzJubXcrejgzaFFWbzM5QjJNYXZhSjNpZ3hJQ3lEdW45?=
 =?utf-8?B?bFMyYUFURW4rempRVGRrTXpnRlBLUy80YlNUNUFrRGsrUHJURnJOcmw3dkwy?=
 =?utf-8?B?KzNmeFJHU1c5d01jKy9aQ1doVytZZUFwVU83eDZuR2tHZ1VNRktuOE5HZHlq?=
 =?utf-8?B?dkh4aVpsczVVeHkyR3N1UFIxSmJLVFRrM1JzZDYvUzBlZnkwcVVaalhnaEtZ?=
 =?utf-8?B?TmFaTDlNc2Yyd0FoWjlqa1ZiNEFxSmdnbldMaElWaXVldUFXbDNVcndHQWJB?=
 =?utf-8?Q?GpZ78gG0CFSXZJ+OKiwneIANQ4rI1MHvJA4IMMv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e37b4d-d4bf-4d86-ef35-08d91b74f8c6
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 09:52:25.5188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tQ/uFWlf8RL1PMus4WwhLvvUJoaInju0tg1zcv0ENJzCay3Q47OQK+nXnCsNTg61Y0wu/07AynJTWcb361Czcklbp+K7I5oTUXWrozZFXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1463
X-Proofpoint-ORIG-GUID: gSXhJn8GAIJNPJPfIt2BTES6ojN5R9Vt
X-Proofpoint-GUID: gSXhJn8GAIJNPJPfIt2BTES6ojN5R9Vt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_01:2021-05-20,
 2021-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200073
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
Cc: Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for your review.

On 5/20/21 5:37 PM, Laurent Pinchart wrote:
> Hi Quanyang,
> 
> Thank you for the patch.
> 
> On Tue, May 18, 2021 at 05:50:18PM +0800, quanyang.wang@windriver.com wrote:
>> From: Quanyang Wang <quanyang.wang@windriver.com>
>>
>> Add a new function is_layer_vid() to simplify the code that
>> judges if a layer is the video layer.
> 
> I like this, and especially passing the layer pointer to functions
> instead of the layer ID. I'm however wondering is we shouldn't name the
> function xlnx_zynqmp_disp_layer_is_video(), for consistency. If that's
> fine with you I can make the change when applying the patch to my tree,
> there's no need to submit a new version.
That's fine. Please help change the function name to 
xlnx_zynqmp_disp_layer_is_video().

Thanks,
Quanyang
> 
>> Acked-by: Paul Cercueil <paul@crapouillou.net>
>> Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> ---
>>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 39 +++++++++++++++++-------------
>>   1 file changed, 22 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index 109d627968ac..eefb278e24c6 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -434,30 +434,35 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp_avbuf *avbuf,
>>   	writel(val, avbuf->base + reg);
>>   }
>>   
>> +static bool is_layer_vid(const struct zynqmp_disp_layer *layer)
>> +{
>> +	return layer->id == ZYNQMP_DISP_LAYER_VID;
>> +}
>> +
>>   /**
>>    * zynqmp_disp_avbuf_set_format - Set the input format for a layer
>>    * @avbuf: Audio/video buffer manager
>> - * @layer: The layer ID
>> + * @layer: The layer
>>    * @fmt: The format information
>>    *
>>    * Set the video buffer manager format for @layer to @fmt.
>>    */
>>   static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp_avbuf *avbuf,
>> -					 enum zynqmp_disp_layer_id layer,
>> +					 struct zynqmp_disp_layer *layer,
>>   					 const struct zynqmp_disp_format *fmt)
>>   {
>>   	unsigned int i;
>>   	u32 val;
>>   
>>   	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_FMT);
>> -	val &= layer == ZYNQMP_DISP_LAYER_VID
>> +	val &= is_layer_vid(layer)
>>   	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
>>   	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
>>   	val |= fmt->buf_fmt;
>>   	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_FMT, val);
>>   
>>   	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
>> -		unsigned int reg = layer == ZYNQMP_DISP_LAYER_VID
>> +		unsigned int reg = is_layer_vid(layer)
>>   				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
>>   				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
>>   
>> @@ -573,19 +578,19 @@ static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
>>   /**
>>    * zynqmp_disp_avbuf_enable_video - Enable a video layer
>>    * @avbuf: Audio/video buffer manager
>> - * @layer: The layer ID
>> + * @layer: The layer
>>    * @mode: Operating mode of layer
>>    *
>>    * Enable the video/graphics buffer for @layer.
>>    */
>>   static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
>> -					   enum zynqmp_disp_layer_id layer,
>> +					   struct zynqmp_disp_layer *layer,
>>   					   enum zynqmp_disp_layer_mode mode)
>>   {
>>   	u32 val;
>>   
>>   	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -	if (layer == ZYNQMP_DISP_LAYER_VID) {
>> +	if (is_layer_vid(layer)) {
>>   		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>>   		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
>>   			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
>> @@ -605,17 +610,17 @@ static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
>>   /**
>>    * zynqmp_disp_avbuf_disable_video - Disable a video layer
>>    * @avbuf: Audio/video buffer manager
>> - * @layer: The layer ID
>> + * @layer: The layer
>>    *
>>    * Disable the video/graphics buffer for @layer.
>>    */
>>   static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf *avbuf,
>> -					    enum zynqmp_disp_layer_id layer)
>> +					    struct zynqmp_disp_layer *layer)
>>   {
>>   	u32 val;
>>   
>>   	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
>> -	if (layer == ZYNQMP_DISP_LAYER_VID) {
>> +	if (is_layer_vid(layer)) {
>>   		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
>>   		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
>>   	} else {
>> @@ -807,7 +812,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
>>   		}
>>   	}
>>   
>> -	if (layer->id == ZYNQMP_DISP_LAYER_VID)
>> +	if (is_layer_vid(layer))
>>   		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(0);
>>   	else
>>   		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(0);
>> @@ -818,7 +823,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
>>   		zynqmp_disp_blend_write(blend, reg + 8, coeffs[i + swap[2]]);
>>   	}
>>   
>> -	if (layer->id == ZYNQMP_DISP_LAYER_VID)
>> +	if (is_layer_vid(layer))
>>   		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(0);
>>   	else
>>   		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(0);
>> @@ -1025,7 +1030,7 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
>>    */
>>   static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
>>   {
>> -	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer->id,
>> +	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
>>   				       ZYNQMP_DISP_LAYER_NONLIVE);
>>   	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
>>   
>> @@ -1046,7 +1051,7 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
>>   	for (i = 0; i < layer->drm_fmt->num_planes; i++)
>>   		dmaengine_terminate_sync(layer->dmas[i].chan);
>>   
>> -	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer->id);
>> +	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
>>   	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
>>   }
>>   
>> @@ -1067,7 +1072,7 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>>   	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
>>   	layer->drm_fmt = info;
>>   
>> -	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer->id,
>> +	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer,
>>   				     layer->disp_fmt);
>>   
>>   	/*
>> @@ -1244,8 +1249,8 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
>>   			drm_formats[j] = layer->info->formats[j].drm_fmt;
>>   
>>   		/* Graphics layer is primary, and video layer is overlay. */
>> -		type = i == ZYNQMP_DISP_LAYER_GFX
>> -		     ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
>> +		type = is_layer_vid(layer)
>> +		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
>>   		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
>>   					       &zynqmp_disp_plane_funcs,
>>   					       drm_formats,
> 

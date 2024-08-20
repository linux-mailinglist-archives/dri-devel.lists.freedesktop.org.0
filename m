Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3486E957CC3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 07:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AA410E4AF;
	Tue, 20 Aug 2024 05:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="awluFcuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3B810E4AF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 05:35:31 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-70930f8eabbso1828217a34.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 22:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724132131; x=1724736931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ndtfIALYxvSwyfZwUZk30HMSZOs/3lo4XrgNJ0/XS/Y=;
 b=awluFcuX7YOtWymM6JlF2YDafUy4JKkRXB4rkYwR79BUxLEDibxS2bV8ri7NTZh1jH
 xFyF+WChDbtuh4BHA7+8HOgl6jPngd3yMBgu16rTWC4NpIGgxhAU0YvPoqMSzdNM7i83
 ocoD7gi8lIdiANanLIsu06nhEw8xakKJWqTanzGSJ7BdLBOeOappfZYWi6TCDgsSFZls
 m7G0AJ0IZUJ2mSCFQTR2hJAWIPJcjfRhhnKTRAUHFbHIKfHZXGJU3Vrt3x8RWG5T1+XK
 TZFExleKIb/sBn9Yx1qU+YxzDtM+8fPOdkzNu89PUcF9y0QmzZSh783ILxGtZeXWT73r
 9lng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724132131; x=1724736931;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ndtfIALYxvSwyfZwUZk30HMSZOs/3lo4XrgNJ0/XS/Y=;
 b=COpuMtsCN7+lvLfdowrYFVMHSPaQT0sbAuN39muw+IA3pLvxbg8XgEBjieCbYFkvL8
 AkoJKKUvvNHSRQZIAg6gGC1g5hTj5N+Wm3v1sixoMfsmPupANnkrWNkrd6J6iwYx9729
 QAX4Uueiw32OJp+9ZzOJTKnYKCy+F0cXb1PyHVG4LkQDh7+kQKcWLDAoykjIp6wAJwk5
 pw2vlNZCzxSaNsYWbYNXg2FdAEaAAZ0nnO93jBpqgVYkV/Pk6DiLLBZ+Fa8mj+NXJbyM
 Cvoj2OefT5HCb3Ddyrv0wvVFtIYL2Y2d7Jm/6doFRjLkkTJojvH8AHGxBocTEnqft22Y
 Gvgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyss62F2GaRtKNbyS3G5w3Icv8TJb17t9EMQZMtp0tRdAuEBQvzAmtXt3KMIE7UzohKangMBjm7qs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxe0RBOEHGTO/LOTAX0D6sLjfvWZwTRHhF2hrECNGoKirGINL7K
 LtZhMs4M8eNH5qmwWo/Uv+hd1CqrPX6IihirO8tkKHfr0sBPm1uF
X-Google-Smtp-Source: AGHT+IFtEn8H0UZ4sEWSOI7G4y4Mo1XLRTZ28Kau1HwcAHNrGsrgcbQQoKbgrUrFfpCGq+Yq/fxnrQ==
X-Received: by 2002:a05:6870:224e:b0:268:a074:39cf with SMTP id
 586e51a60fabf-2701c349599mr11711600fac.8.1724132130748; 
 Mon, 19 Aug 2024 22:35:30 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127aef5431sm7461828b3a.109.2024.08.19.22.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 22:35:30 -0700 (PDT)
Message-ID: <fe56d8be-9c75-48d5-bc2c-76a79e5d7843@gmail.com>
Date: Tue, 20 Aug 2024 13:35:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-3-hpchen0nvt@gmail.com>
 <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Dear Krzysztof,

Thank you for your reply.



On 2024/8/19 下午 07:19, Krzysztof Kozlowski wrote:
> On Mon, Aug 19, 2024 at 09:20:37AM +0000, Hui-Ping Chen wrote:
>> Nuvoton MA35 SoCs NAND Flash Interface Controller
>> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
>> 12-bit, and 24-bit hardware ECC calculation circuit
>> to protect data communication.
>>
>> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ...
>
>> +static int ma35_nand_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand;
>> +	struct nand_chip *chip;
>> +	struct mtd_info *mtd;
>> +	int retval = 0;
>> +
>> +	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
>> +	if (!nand)
>> +		return -ENOMEM;
>> +
>> +	nand_controller_init(&nand->controller);
>> +
>> +	nand->regs = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(nand->regs))
>> +		return PTR_ERR(nand->regs);
>> +
>> +	nand->dev = &pdev->dev;
>> +	chip = &nand->chip;
>> +	mtd = nand_to_mtd(chip);
>> +	nand_set_controller_data(chip, nand);
>> +	nand_set_flash_node(chip, pdev->dev.of_node);
>> +
>> +	mtd->priv = chip;
>> +	mtd->owner = THIS_MODULE;
>> +	mtd->dev.parent = &pdev->dev;
>> +
>> +	nand->clk = devm_clk_get(&pdev->dev, "nand_gate");
>> +	if (IS_ERR(nand->clk))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
>> +				     "failed to find nand clock\n");
>> +
>> +	retval = clk_prepare_enable(nand->clk);
>> +	if (retval < 0) {
>> +		dev_err(&pdev->dev, "failed to enable clock\n");
>> +		retval = -ENXIO;
>> +	}
>> +
>> +	nand->chip.controller    = &nand->controller;
>> +
>> +	chip->legacy.cmdfunc     = ma35_nand_command;
>> +	chip->legacy.waitfunc    = ma35_waitfunc;
>> +	chip->legacy.read_byte   = ma35_nand_read_byte;
>> +	chip->legacy.select_chip = ma35_nand_select_chip;
>> +	chip->legacy.read_buf    = ma35_read_buf_dma;
>> +	chip->legacy.write_buf   = ma35_write_buf_dma;
>> +	chip->legacy.dev_ready   = ma35_nand_devready;
>> +	chip->legacy.chip_delay  = 25; /* us */
>> +
>> +	/* Read OOB data first, then HW read page */
>> +	chip->ecc.hwctl      = ma35_nand_enable_hwecc;
>> +	chip->ecc.calculate  = ma35_nand_calculate_ecc;
>> +	chip->ecc.correct    = ma35_nand_correct_data;
>> +	chip->ecc.write_page = ma35_nand_write_page_hwecc;
>> +	chip->ecc.read_page  = ma35_nand_read_page_hwecc_oob_first;
>> +	chip->ecc.read_oob   = ma35_nand_read_oob_hwecc;
>> +	chip->options |= (NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA);
>> +
>> +	ma35_nand_initialize(nand);
>> +	platform_set_drvdata(pdev, nand);
>> +
>> +	nand->controller.ops = &ma35_nand_controller_ops;
>> +
>> +	nand->irq = platform_get_irq(pdev, 0);
>> +	if (nand->irq < 0)
>> +		return dev_err_probe(&pdev->dev, nand->irq,
>> +				     "failed to get platform irq\n");
>> +
>> +	if (request_irq(nand->irq, ma35_nand_irq, IRQF_TRIGGER_HIGH, "ma35d1-nand", nand)) {
>> +		dev_err(&pdev->dev, "Error requesting NAND IRQ\n");
>> +		return -ENXIO;
>> +	}
>> +
>> +	retval = nand_scan(chip, 1);
>> +	if (retval)
>> +		return retval;
>> +
>> +	if (mtd_device_register(mtd, nand->parts, nand->nr_parts)) {
>> +		nand_cleanup(chip);
>> +		devm_kfree(&pdev->dev, nand);
>> +		return retval;
>> +	}
>> +
>> +	return retval;
>> +}
>> +
>> +static void ma35_nand_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +	struct nand_chip *chip = &nand->chip;
>> +	int ret;
>> +
> Where do you release IRQ handler?

I will add a release IRQ handler to this function.



>> +	ret = mtd_device_unregister(nand_to_mtd(chip));
>> +	WARN_ON(ret);
>> +	nand_cleanup(chip);
>> +
>> +	clk_disable_unprepare(nand->clk);
>> +
>> +	kfree(nand);
> NAK, you never tested your code.

I will strengthen the testing of this function.



>> +	platform_set_drvdata(pdev, NULL);
> Why? Drop.

I will remove it.



>> +}
>> +
>> +/* PM Support */
>> +#ifdef CONFIG_PM
>> +static int ma35_nand_suspend(struct platform_device *pdev, pm_message_t pm)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +	unsigned long timeo = jiffies + HZ/2;
>> +
>> +	/* wait DMAC to ready */
>> +	while (1) {
>> +		if ((readl(nand->regs + MA35_NFI_REG_DMACTL) & DMA_BUSY) == 0)
>> +			break;
>> +		if (time_after(jiffies, timeo))
>> +			return -ETIMEDOUT;
>> +	}
>> +
>> +	clk_disable(nand->clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35_nand_resume(struct platform_device *pdev)
>> +{
>> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
>> +
>> +	clk_enable(nand->clk);
>> +	ma35_nand_hwecc_init(nand);
>> +	ma35_nand_dmac_init(nand);
>> +
>> +	return 0;
>> +}
>> +
>> +#else
>> +#define ma35_nand_suspend NULL
>> +#define ma35_nand_resume NULL
>> +#endif
>> +
>> +static const struct of_device_id ma35_nfi_of_match[] = {
>> +	{ .compatible = "nuvoton,ma35d1-nand" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35_nfi_of_match);
>> +
>> +static struct platform_driver ma35_nand_driver = {
>> +		.driver = {
> Messed indentation.

I will fix it.



>> +		.name   = "ma35d1-nand",
>> +		.owner  = THIS_MODULE,
> Drop. Please do not upstream some 10 year old code... Use recent code as
> template, not 10yo stuff...

I will refer to the new driver implementation.



> Best regards,
> Krzysztof


Best regards,

Hui-Ping Chen

